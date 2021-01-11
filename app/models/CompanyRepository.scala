package models

import javax.inject.Inject
import scala.util.{ Failure, Success }
import anorm._
import anorm.SqlParser.{ get, str }
import play.api.db.DBApi
import scala.concurrent.Future

case class Company(id: Option[Long] = None, name: String)

@javax.inject.Singleton
class CompanyRepository @Inject()(dbapi: DBApi)(implicit ec: DatabaseExecutionContext) {

  private val db = dbapi.database("default")

  private[models] val simple = {
    get[Option[Long]]("company.id") ~ str("company.name") map {
      case id ~ name => Company(id, name)
    }
  }


  def options: Future[Seq[(String,String)]] = Future(db.withConnection { implicit connection =>
    SQL"select * from company order by name".
      fold(Seq.empty[(String, String)], ColumnAliaser.empty) { (acc, row) =>
        row.as(simple) match {
          case Failure(parseErr) => {
            println(s"Fails to parse $row: $parseErr")
            acc
          }

          case Success(Company(Some(id), name)) =>
            (id.toString -> name) +: acc

          case Success(Company(None, _)) => acc
        }
      }
  }).flatMap {
    case Left(err :: _) => Future.failed(err)
    case Left(_) => Future(Seq.empty)
    case Right(acc) => Future.successful(acc.reverse)
  }
}