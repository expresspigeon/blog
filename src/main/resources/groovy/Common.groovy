package groovy

import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths
import static groovy.io.FileType.FILES


def copyProperties(String src, String target, String contentName){
    Path posts = Paths.get(src + '/' + contentName)
    posts.toFile().eachFileRecurse(FILES) {
        if(it.name.endsWith('.properties')) {
            Files.copy(Paths.get(it.canonicalPath), Paths.get(target + "/${contentName}/" + it.name))
        }
    }
}

def processMarkDown(String src, String target, String contentName){
    Path dir = Paths.get(src + '/' + contentName)
    dir.toFile().eachFileRecurse(FILES) {
        if(it.name.endsWith('.md')) {
            println "Processing ${it.absolutePath}"
            "pandoc -f markdown -t html   ${it.absolutePath} -o ${target}/${contentName}/${it.name}.html".execute();
        }
    }
}

def copyFiles(String source, String target){
    ant = new AntBuilder()
    ant.sequential {
        copy(todir: target) {
            fileset(dir: source) {
                include(name: "**/*.*")
            }
        }
    }
}

def copyFile(String fileCanonicalPath, String destinationDir){
    println "Copying file: $fileCanonicalPath to: $destinationDir"
    new AntBuilder().copy( file:"$fileCanonicalPath", todir: "$destinationDir")
}
