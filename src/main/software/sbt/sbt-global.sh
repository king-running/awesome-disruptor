#!/usr/bin/env bash


echo '

resolvers += "Sonatype Nexus Repository Manager" at "http://repo.xxxx.net:8081/nexus/content/repositories/snapshots"

credentials += Credentials(Path.userHome / ".sbt" / "credentials")

coursier.Keys.coursierCredentials += "Sonatype Nexus Repository Manager" -> coursier.Credentials(Path.userHome / ".sbt" / "credentials")

//publishTo := {
//  if (version.value.toLowerCase.endsWith("snapshot"))
//  Some("snapshots" at "http://repo.xxxxx.net:8081/nexus/content/repositories/snapshots")
//  else
//  Some("releases" at "http://repo.xxxxx.net:8081/nexus/content/repositories/releases/")
//}

//option
javacOptions  ++= Seq("-encoding", "UTF-8")
scalacOptions ++= Seq("-encoding", "UTF-8")
scalacOptions ++= Seq("-feature", "-language:_")
scalacOptions ++= Seq("-Xlint", "-unchecked")
scalacOptions ++= Seq("-deprecation")

//test
parallelExecution in ThisBuild := false
parallelExecution in ThisProject := false
parallelExecution in Global := false
parallelExecution in Test := false
concurrentRestrictions in Global += Tags.limit(Tags.Test, 1)
testOptions in Test += Tests.Argument(TestFrameworks.ScalaTest, "-oD")

//test coverage
//scoverage.ScoverageKeys.coverageEnabled := true
//scoverage.ScoverageKeys.coverageReport := true
scoverage.ScoverageKeys.coverageOutputTeamCity := true

' > ~/.sbt/0.13/global.sbt
