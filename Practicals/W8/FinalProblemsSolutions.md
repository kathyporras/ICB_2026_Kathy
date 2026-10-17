# Final Problems

## 7.1 Disease Risks

1.  How many people were samples in total? The total number of
    genotypess at each site gives us the total number of people
    sequenced, but not everyone is sequenced for every site. Find the
    maximum of the sum of nA1A1, nA1A2, and nA2A2.

<!-- -->

    data <- read.table("H938_Euro_chr6.geno", sep=" ", header = T)
    head(data)

    ##   CHR        SNP A1 A2 nA1A1 nA1A2 nA2A2
    ## 1   6  rs4959515  A  G     0    17   107
    ## 2   6   rs719065  A  G     0    26    98
    ## 3   6  rs6596790  C  T     0     4   119
    ## 4   6  rs6596796  A  G     0    22   102
    ## 5   6  rs1535053  G  A     5    39    80
    ## 6   6 rs12660307  C  T     0     3   121

    #the maximum of the sum of nA1A1, nA1A2, and nA2A2
    total <- (data$nA1A1 + data$nA1A2 + data$nA2A2)
    max(total)

    ## [1] 124

1.  Use the function rowSums() to get the same result.

<!-- -->

    ?rowSums() #we have to tell the function from where (geno) and the name of the columns that we want it to sum.
    total2 <- rowSums(data[,c("nA1A1", "nA1A2", "nA2A2")])
    max(total2)

    ## [1] 124

1.  The file R/DataFiles/SNP\_risks.csv is a comma-separated file that
    contains data on whether ach of the sites genotyped is associated
    with the risk of developing a disease. Read this table into R and,
    and join its third column to the six columns of
    H938\_Euro\_chr6.geno.

<!-- -->

    risks <- read.table("SNP_risks.csv", sep=",", header = T)
    head(risks)

    ##   CHR        SNP     Risk
    ## 1   6  rs4959515 Non-Risk
    ## 2   6   rs719065 Non-Risk
    ## 3   6  rs6596790 Non-Risk
    ## 4   6  rs6596796 Non-Risk
    ## 5   6  rs1535053 Non-Risk
    ## 6   6 rs12660307 Non-Risk

    #I'm addind the new column to the other doc.
    risksCol <- risks$Risk
    data$Risks <- risksCol
    head(data)

    ##   CHR        SNP A1 A2 nA1A1 nA1A2 nA2A2    Risks
    ## 1   6  rs4959515  A  G     0    17   107 Non-Risk
    ## 2   6   rs719065  A  G     0    26    98 Non-Risk
    ## 3   6  rs6596790  C  T     0     4   119 Non-Risk
    ## 4   6  rs6596796  A  G     0    22   102 Non-Risk
    ## 5   6  rs1535053  G  A     5    39    80 Non-Risk
    ## 6   6 rs12660307  C  T     0     3   121 Non-Risk

1.  On average, how many individuals are heterozygous at sites
    associated with disease risk? On sites not associated with disease
    risk?

<!-- -->

    #heterozygous are nA1A2
    #mean of heterozygous people associated to sites with disease risk
    mean(data$nA1A2[data$Risks == "Risk"])

    ## [1] 37.31296

    #mean of heterozygous people associated to sites without disease risk
    mean(data$nA1A2[data$Risks == "Non-Risk"])

    ## [1] 36.96878

## 7.2 Data Cleanup

Smith et al. (2003) compiled a database of the body mass of mammals of
the late Quaternary period, which are saved in the tab-delimited file
R/DataFiles/Smith2003\_data.txt.

1.  Read the file into R. How many species are represented in the file?

<!-- -->

    #text separated by tabs without titles!
    mammals <- read.table("Smith2003_data.txt", sep="\t", header = F)
    head(mammals)

    ##   V1     V2           V3      V4         V5            V6   V7       V8     V9
    ## 1 AF extant Artiodactyla Bovidae      Addax nasomaculatus 4.85  70000.3     60
    ## 2 AF extant Artiodactyla Bovidae  Aepyceros      melampus 4.72  52500.1 63, 70
    ## 3 AF extant Artiodactyla Bovidae Alcelaphus    buselaphus 5.23 171001.5 63, 70
    ## 4 AF extant Artiodactyla Bovidae Ammodorcas       clarkei 4.45  28049.8     60
    ## 5 AF extant Artiodactyla Bovidae Ammotragus        lervia 4.68  48000.0     75
    ## 6 AF extant Artiodactyla Bovidae Antidorcas   marsupialis 4.59  39049.9     60

    #assuming that all epithets are unique, (which probably not):
    length(mammals$V6)

    ## [1] 5731

    #assuming that species might be repeated, I decided to google how can I look for unique values in the column of genus and species, because they can repeat within the same column. Theres a function called unique!
    ?unique()
    nrow(unique(mammals[, c("V5", "V6")]))

    ## [1] 4889

1.  Column 7 contains log(body mass), and column 8 contains raw body
    mass values. Missing values are expressed as “-999”. R uses “NA” for
    missing values. Write code that replaces “-999” for “NA” in both
    columns, and writes a file with the “clean” data.

<!-- -->

    #just checking if colums 7 and 8 are deteted as numbers already and they are! I can also see that min values are -999
    summary(mammals)

    ##          V1               V2               V3               V4      
    ##  Length   :5731   Length   :5731   Length   :5731   Length   :5731  
    ##  N.unique :   7   N.unique :   4   N.unique :  29   N.unique : 153  
    ##  N.blank  :   0   N.blank  :   0   N.blank  :   0   N.blank  :   0  
    ##  Min.nchar:   2   Min.nchar:   6   Min.nchar:   7   Min.nchar:   4  
    ##  Max.nchar:   7   Max.nchar:  12   Max.nchar:  16   Max.nchar:  19  
    ##  NAs      : 779                                                     
    ##          V5               V6             V7                V8           
    ##  Length   :5731   Length   :5731   Min.   :-999.00   Min.   :     -999  
    ##  N.unique :1247   N.unique :3451   1st Qu.:   0.60   1st Qu.:        4  
    ##  N.blank  :   0   N.blank  :   0   Median :   1.60   Median :       40  
    ##  Min.nchar:   2   Min.nchar:   2   Mean   :-237.27   Mean   :   153157  
    ##  Max.nchar:  17   Max.nchar:  19   3rd Qu.:   2.89   3rd Qu.:      776  
    ##                                    Max.   :   8.28   Max.   :190000000  
    ##          V9      
    ##  Length   :5731  
    ##  N.unique : 278  
    ##  N.blank  :   0  
    ##  Min.nchar:   1  
    ##  Max.nchar:  23  
    ## 

    mammals$V7 <- gsub("-999", NA, mammals$V7)
    mammals$V8  <- gsub("-999", NA, mammals$V8)

    #now they are all removed.
    summary(mammals)

    ##          V1               V2               V3               V4      
    ##  Length   :5731   Length   :5731   Length   :5731   Length   :5731  
    ##  N.unique :   7   N.unique :   4   N.unique :  29   N.unique : 153  
    ##  N.blank  :   0   N.blank  :   0   N.blank  :   0   N.blank  :   0  
    ##  Min.nchar:   2   Min.nchar:   6   Min.nchar:   7   Min.nchar:   4  
    ##  Max.nchar:   7   Max.nchar:  12   Max.nchar:  16   Max.nchar:  19  
    ##  NAs      : 779                                                     
    ##          V5               V6               V7               V8      
    ##  Length   :5731   Length   :5731   Length   :5731   Length   :5731  
    ##  N.unique :1247   N.unique :3451   N.unique : 587   N.unique :1835  
    ##  N.blank  :   0   N.blank  :   0   N.blank  :   0   N.blank  :   0  
    ##  Min.nchar:   2   Min.nchar:   2   Min.nchar:   1   Min.nchar:   1  
    ##  Max.nchar:  17   Max.nchar:  19   Max.nchar:  11   Max.nchar:   9  
    ##                                    NAs      :1372   NAs      :1372  
    ##          V9      
    ##  Length   :5731  
    ##  N.unique : 278  
    ##  N.blank  :   0  
    ##  Min.nchar:   1  
    ##  Max.nchar:  23  
    ## 

    #if I use this code, everything is quoted in the text, so I'll add quote=F so that it removes it.
    #write.table(mammals, "Smith2003_clean.txt", sep = "\t", row.names = F, col.names = F)
    write.table(mammals, "Smith2003_clean.txt", sep = "\t", row.names = F, col.names = F, quote = F)
    cleanMammals <- read.table("Smith2003_clean.txt", sep="\t", header = F)
    #All the -999 of the 2 columns were changed.
