package groovy

import java.nio.file.*

GroovyShell shell = new GroovyShell()
common = shell.parse(Paths.get("${basedir}/target/classes/groovy/Common.groovy").toFile())

String src = "${basedir}/src/content/kb"
String target = "/opt/pigeon/kb"

new File(target).deleteDir();
new File(target).mkdir()
new File("${target}/images").mkdir()
new File("${target}/resources").mkdir()

common.copyFiles(Paths.get(src + "/images").toString(), Paths.get(target + "/images").toString())
common.copyFiles(Paths.get(src + "/resources").toString(), Paths.get(target + "/resources").toString())
common.processMarkDown(src, target, "")

