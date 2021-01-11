lazy val root = (project in file("."))
  .enablePlugins(PlayScala)
  .settings(
    name := "scala-app",
    scalaVersion := "2.13.1",
    libraryDependencies ++= Seq(
      guice,
      jdbc,
      evolutions,
      "com.h2database" % "h2" % "1.4.199",
      "org.playframework.anorm" %% "anorm" % "2.6.5",
      "org.scalatestplus.play" %% "scalatestplus-play" % "5.0.0" % Test,
    )
  )