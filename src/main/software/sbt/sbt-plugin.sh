#!/usr/bin/env bash

echo '
addSbtPlugin("io.get-coursier" % "sbt-coursier" % "1.0.0-M14")
addSbtPlugin("org.xerial.sbt" % "sbt-pack" % "0.7.9")
addSbtPlugin("org.scoverage" % "sbt-scoverage" % "1.4.0")

' > ~/.sbt/0.13/plugins/build.sbt
