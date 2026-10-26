# Final Problems

## 4.1 File Processing

Write an R script that loads every file, reports the number of rows and
columns in each matrix, as well as the proportion of entries that are 1
and 0. Report your results in a tab-delimited file called
MatrixStats.tsv

    setwd("~/Documents/VT/IntroCompBio/ICB_2026_Kathy/Practicals/W9")

    #get all the files of the folder
    files <- list.files("Saavedra2013")

    #creating an empty file to save results
    results <- data.frame()

    #loop to extract the data
    for (file in files) {
      mat <- read.table(paste("Saavedra2013", file, sep="/"))

      #number of rows and columns
      Nrow <- nrow(mat)
      Ncol <- ncol(mat)

      #calculating proportions of 1 and 0 by counting all the 1/0s and diving them by the total of values (multiplication of columns by rows)
      p_1 <- sum(mat == 1) / (Nrow * Ncol)
      p_0 <- sum(mat == 0) / (Nrow * Ncol)

      #setting and adding variables into the new data frame
      results <- rbind(results, data.frame(
        File = file,
        Nrow = Nrow,
        Ncol = Ncol,
        p_1 = p_1,
        p_0 = p_0
      ))
    }


    write.table(results, "MatrixStats.tsv", sep = "\t", row.names = FALSE)

    MatrixStats <- read.table("MatrixStats.tsv", sep= "\t", header = T)
    head(MatrixStats)

    ##      File Nrow Ncol        p_1       p_0
    ## 1  n1.txt   97   80 0.04587629 0.9541237
    ## 2 n10.txt   14   20 0.17857143 0.8214286
    ## 3 n11.txt  270   91 0.03736264 0.9626374
    ## 4 n12.txt    7   72 0.28373016 0.7162698
    ## 5 n13.txt   61   17 0.14079074 0.8592093
    ## 6 n14.txt   35   15 0.16000000 0.8400000

## Leaf areas

1.  Install the EBImage

<!-- -->

    BiocManager::install("EBImage")

    ## Bioconductor version 3.23 (BiocManager 1.30.27), R 4.6.0 (2026-04-24)

    ## Warning: package(s) not installed when version(s) same as or greater than current; use
    ##   `force = TRUE` to re-install: 'EBImage'

    ## Warning in .available.both(repos, method, ...): Some listed binary packages
    ## have no source

    ## Old packages: 'aplot', 'base64enc', 'bit64', 'bslib', 'callr', 'class',
    ##   'clipr', 'cluster', 'combinat', 'curl', 'data.table', 'dbplyr', 'emmeans',
    ##   'estimability', 'expm', 'foreign', 'gdtools', 'ggfun', 'ggplotify', 'httr',
    ##   'igraph', 'KernSmooth', 'knitr', 'lattice', 'maps', 'MASS', 'Matrix',
    ##   'mvtnorm', 'nlme', 'nnet', 'openssl', 'optimParallel', 'Rcpp', 'readxl',
    ##   'rlang', 'rmarkdown', 'rstudioapi', 'selectr', 'spatial', 'stringi',
    ##   'survival', 'tidytree', 'tinytex', 'withr', 'xfun', 'xml2', 'yulab.utils'

    library(EBImage)

1.  Write a for loop that processes all images using the function
    getArea, which is provided in the folder. Your loop should record
    the leaf area for each image, and store it in the data frame
    results.

<!-- -->

    #running the function provided
    source("getArea.R")

    #getting the names of all images
    files <- list.files("leafarea", pattern = "\\.JPG$")
    #there are 44 pictures
    length(files)

    ## [1] 44

    #creating an empty file to save results
    results <- data.frame()

    #loop to analyze all images
    for (file in files) {

      area <- getArea(file)

    #saving the results
      results <- rbind(results, data.frame(
        File = file,
        Area = area
      ))
    }

    head(results)

    ##           File  Area
    ## 1 t1_B101m.JPG 28802
    ## 2 t1_B102m.JPG 30982
    ## 3 t1_B102p.JPG 21308
    ## 4 t1_B103m.JPG 30690
    ## 5 t1_B103p.JPG 26177
    ## 6  t1_B21m.JPG 15413

1.  Calculate the change in leaf area between time points 1 and 2 for
    each plant, and add it as a column in your data frame. How much did
    the leaves grow between time points on average?

<!-- -->

    #I decided to do it from the folder with all the files because I'm not sure how to do it with the data frame I created.

    #getting the time 1 and time 2 according to the name of the picture
    t1 <- list.files("leafarea", pattern = "^t1.*\\.JPG$")
    t2 <- list.files("leafarea", pattern = "^t2.*\\.JPG$")

    #creating a column to save the change of area in the leaves. We put NA because we still don't have the values. but it's like an empty column
    results$Change <- NA

    #calculating the change in leaf area for each plant
    for (i in 1:length(t1)) {

      #we extract from our data frame the values of area of point t1 and t2.
      area_t1 <- results$Area[results$File == t1[i]]
      area_t2 <- results$Area[results$File == t2[i]]
      #we add the results in our empty column and the result is going to show up just   in the row of the t2 pictures
      results$Change[results$File == t2[i]] <- area_t2 - area_t1
    }

    #so that we can see the rows of t2 with the change of area
    tail(results)

    ##           File  Area Change
    ## 39 t2_B62p.JPG 33687   7297
    ## 40 t2_B63m.JPG 45664  11030
    ## 41 t2_B81m.JPG 29646   6351
    ## 42 t2_B81p.JPG 46766  10476
    ## 43 t2_B83m.JPG 27267   5928
    ## 44 t2_B83p.JPG 29694   6986

    #how much did the leaves grow on average. We have to add NA true to just ignore them, because he have multiple NA's from the t1's
    mean(results$Change, na.rm = TRUE)

    ## [1] 7097.455

1.  Save your results as a comma-separated file and include them in your
    repository.

<!-- -->

    write.table(results, file="leafarea.csv", sep=",")
