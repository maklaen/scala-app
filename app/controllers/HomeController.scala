package controllers

import javax.inject.Inject
import models._
import play.api.data.Forms._
import play.api.data._
import play.api.mvc._
import views._

import scala.concurrent.{ExecutionContext, Future}

class HomeController @Inject()(computerService: ComputerRepository,
                               companyService: CompanyRepository,
                               cc: MessagesControllerComponents)(implicit ec: ExecutionContext)
  extends MessagesAbstractController(cc) {

  private val logger = play.api.Logger(this.getClass)

  val Home = Redirect(routes.HomeController.list(0, 2, ""))

  val computerForm = Form(
    mapping(
      "id" -> ignored(None: Option[Long]),
      "name" -> nonEmptyText,
      "introduced" -> optional(date("dd-MM-yyyy")),
      "discontinued" -> optional(date("dd-MM-yyyy")),
      "company" -> optional(longNumber)
    )(Computer.apply)(Computer.unapply)
  )

  def index = Action {
    Home
  }

  def list(page: Int, orderBy: Int, filter: String) = Action.async { implicit request =>
    computerService.list(page = page, orderBy = orderBy, filter = ("%" + filter + "%")).map { page =>
      Ok(html.list(page, orderBy, filter))
    }
  }

  def edit(id: Long) = Action.async { implicit request =>
    computerService.findById(id).flatMap {
      case Some(computer) =>
        companyService.options.map { options =>
          Ok(html.editForm(id, computerForm.fill(computer), options))
        }
      case other =>
        Future.successful(NotFound)
    }
  }

  def update(id: Long) = Action.async { implicit request =>
    computerForm.bindFromRequest.fold(
      formWithErrors => {
        companyService.options.map { options =>
          BadRequest(html.editForm(id, formWithErrors, options))
        }
      },
      computer => {
        computerService.update(id, computer).map { _ =>
          Home.flashing("success" -> "Компьютер %s был обновлен".format(computer.name))
        }
      }
    )
  }

  def create = Action.async { implicit request =>
    companyService.options.map { options =>
      Ok(html.createForm(computerForm, options))
    }
  }

  def save = Action.async { implicit request =>
    computerForm.bindFromRequest.fold(
      formWithErrors => companyService.options.map { options =>
        BadRequest(html.createForm(formWithErrors, options))
      },
      computer => {
        computerService.insert(computer).map { _ =>
          Home.flashing("success" -> "Компьютер %s успешно создан".format(computer.name))
        }
      }
    )
  }

  def delete(id: Long) = Action.async {
    computerService.delete(id).map { _ =>
      Home.flashing("success" -> "Компютер успешно удален")
    }
  }

}