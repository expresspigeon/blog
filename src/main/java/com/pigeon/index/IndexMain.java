package com.pigeon.index;

import app.services.search.Indexer;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Arrays;

/**
 * @author Igor Polevoy on 10/16/15.
 */
public class IndexMain {
    public static void main(String[] args) throws IOException {
        String target = "/opt/pigeon/search_index";
        File targetDir = Paths.get(target).toFile();
        if (targetDir == null || !targetDir.exists() || !targetDir.isDirectory()) {
            throw new RuntimeException("failed to find target directory");
        }

        Arrays.asList(targetDir.listFiles()).forEach(File::delete);

        Indexer indexer = new Indexer(Paths.get(target));
        System.out.println("IndexMain: Completed indexing Blog. Processed: " +
                indexer.index(args[0] + "/blog/posts") + " documents");
        System.out.println("IndexMain: Completed indexing KB. Processed: " +
                indexer.index(args[0] + "/kb") + " documents");
    }
}
