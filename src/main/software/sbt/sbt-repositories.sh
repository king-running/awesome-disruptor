#!/usr/bin/env bash

echo '
[repositories]
  local

#  sbt-repox:http://10.163.108.146:8078/
#  sbt-repox-ivy:http://10.163.108.146:8078/ , [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]

  sbt-repox:http://120.27.31.34:8078/
  sbt-repox-ivy:http://120.27.31.34:8078/ , [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]

  Sonatype Nexus Repository Manager:http://repo.wecash.net:8081/nexus/content/repositories/snapshots
  Sonatype Nexus Repository Manager-ivy:http://repo.wecash.net:8081/nexus/content/repositories/snapshots, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]

  oss-snapshots:https://oss.sonatype.org/content/repositories/snapshots
  oss-snapshots-ivy:https://oss.sonatype.org/content/repositories/snapshots, [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]

  repo1:http://repo1.maven.org/maven2/
  repo1-ivy:http://repo1.maven.org/maven2/ , [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]

  typesafe:http://dl.bintray.com/typesafe/ivy-releases/
  typesafe-ivy:http://dl.bintray.com/typesafe/ivy-releases/ , [organization]/[module]/(scala_[scalaVersion]/)(sbt_[sbtVersion]/)[revision]/[type]s/[artifact](-[classifier]).[ext]

' > ~/.sbt/repositories

echo '
realm=Sonatype Nexus Repository Manager
host=repo.wecash.net
user=mvn_deploy_user
password=LPG92DP8g8iL
' > ~/.sbt/credentials