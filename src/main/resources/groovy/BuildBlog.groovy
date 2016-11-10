package groovy

import java.nio.file.*

GroovyShell shell = new GroovyShell()
common = shell.parse(Paths.get("${basedir}/target/classes/groovy/Common.groovy").toFile())

String src = "${basedir}/src/content/blog"
String target = "/opt/pigeon/blog"

new File(target).deleteDir();
new File(target).mkdir()
new File("${target}/images").mkdir()
new File("${target}/posts").mkdir()
new File("${target}/authors").mkdir()

common.copyFiles(Paths.get(src + "/images").toString(), Paths.get(target + "/images").toString())
common.copyFiles(Paths.get(src + "/resources").toString(), Paths.get(target + "/resources").toString())

common.copyProperties(src, target, "posts")
common.copyProperties(src, target, "authors")

common.processMarkDown(src, target, "posts")
common.processMarkDown(src, target, "authors")

