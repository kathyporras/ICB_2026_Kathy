## Are most toads right handed?

Humans do not only show preferential use of one of our hands, but the
majority of the population also shows preference for using the right
hand. In other words, most humans are right-handed. In this exercise you
will test whether the same is true for toads.

The file R/DataFiles/Toad\_Handedness.tsv contains their results.

1.  For each toad, use simulations to determine whether the results
    support right handedness, left handedness or no handedness.

<!-- -->

    #opening the file
    toads <- read.table("Toad_Handedness.tsv", header = T)
    head(toads)

    ##   Toad Sex N_trials N_rights
    ## 1   T1   F       16       14
    ## 2   T2   M       15       12
    ## 3   T3   M       17        3
    ## 4   T4   M       15       15
    ## 5   T5   M       16       12
    ## 6   T6   F       16       16

    #number of experiments
    nExp <- 10000

    #empty data frame to save results at the end
    results <- data.frame(
      toad = 1:nrow(toads),
      right_hand = numeric(nrow(toads)),
      p_value = numeric(nrow(toads))
    )

    #probability for each toad
    for(j in 1:nrow(toads)){
      right_ct <- c()
      n <- toads$N_trials[j]
      
    #simulation
      for(i in 1:nExp){
        experiment <- sample(c("R", "L"), size = n, prob = c(0.5, 0.5), replace = TRUE)
        right <- sum(experiment == "R")
        right_ct[i] <- right
      }

    #probabilities
    probs <- table(factor(right_ct, levels = 0:n))/nExp

    #Observed number of right hands
    observed <- toads$N_rights[j]

    #calculating p-value
    p_value <- sum(probs[as.numeric(names(probs)) >= observed]) +
               sum(probs[as.numeric(names(probs)) <= n - observed])

    #save results
      results$right_hand[j] <- observed
      results$p_value[j] <- p_value
    }

    #here I'm going to add a column with the conclusion. This is based on if p-value is < 0.05 and the occurrence of right/left is higher than 50%.

    results$handedness <- ifelse(
      results$p_value < 0.05 & results$right_hand > toads$N_trials/2,
      "Right handed",
      ifelse(
        results$p_value < 0.05 & results$right_hand < toads$N_trials/2,
        "Left handed",
        "No handedness"
      )
    )

    results

    ##    toad right_hand p_value    handedness
    ## 1     1         14  0.0039  Right handed
    ## 2     2         12  0.0329  Right handed
    ## 3     3          3  1.9977 No handedness
    ## 4     4         15  0.0001  Right handed
    ## 5     5         12  0.0727 No handedness
    ## 6     6         16  0.0000  Right handed
    ## 7     7         15  0.0003  Right handed
    ## 8     8         15  0.0002  Right handed
    ## 9     9          2  1.9996 No handedness
    ## 10   10         15  0.0005  Right handed
    ## 11   11         15  0.0000  Right handed
    ## 12   12         12  0.1504 No handedness
    ## 13   13         16  0.0010  Right handed
    ## 14   14          8  1.5231 No handedness
    ## 15   15         14  0.0012  Right handed
    ## 16   16         15  0.0007  Right handed
    ## 17   17          2  1.9993 No handedness
    ## 18   18          9  0.8007 No handedness

1.  Using your results from 1. test the null hypothesis that a frog is
    equally likely to be right or left handed.

<!-- -->

    #keep only toads with handedness (however all of them are right!!),this means that pvalue has to be < 0.05 because there's not the same probability of being right and left handed with this data.
    handed <- results$handedness[results$handedness != "No handedness"]
    # Number of toads with handedness
    n <- length(handed)
    #observed number of right-handed toads by counting the right handed toads
    observed <- sum(handed == "Right handed")

    right_ct <- c()

    # Simulation
    for(i in 1:nExp){
      experiment <- sample(c("R", "L"), size = n, prob = c(0.5, 0.5), replace = TRUE)
      right <- sum(experiment == "R")
      right_ct[i] <- right
    }

    #calculate probabilities
    probs <- table(factor(right_ct, levels = 0:n))/nExp

    #calculate p-value
    p_value <- sum(probs[as.numeric(names(probs)) >= observed]) +
               sum(probs[as.numeric(names(probs)) <= n - observed])

    #we got p-value < 0.05. As I said before, it's because our data, but if I get left handed frogs it might have variability to calculate de pvalue.
    p_value

    ## [1] 0.0013

1.  Using randomization test the null hypothesis that males and females
    are equally likely to be right handed

<!-- -->

    #this code is in case we suspect differences between males and females because with this dataset I already know that there won't be difference because all of them ended up being right handed.

    #permutations
    nPer <- 10000

    #sex and handedness
    toad_data <- data.frame(
      Sex = toads$Sex,
      handedness = results$handedness
    )

    #proportion of right-handed males
    male_right <- mean(toad_data$handedness[toad_data$Sex == "M"] == "Right handed")

    #proportion of right-handed females
    female_right <- mean(toad_data$handedness[toad_data$Sex == "F"] == "Right handed")

    #difference
    obs_diff <- male_right - female_right

    #vector to save results
    diff_sex <- c()

    #randomization
    for(i in 1:nPer){
      sex_shuf <- sample(toad_data$Sex, size = nrow(toad_data), replace = FALSE)
      male_right <- mean(toad_data$handedness[sex_shuf == "M"] == "Right handed")
      female_right <- mean(toad_data$handedness[sex_shuf == "F"] == "Right handed")
      diff_sex[i] <- male_right - female_right
    }

    #calculating p-value
    p_value <- mean(abs(diff_sex) >= abs(obs_diff))

    #results: there are no differences between males and females in this data
    p_value

    ## [1] 1

## Assortative Mating in Animals (A & W 4.10.1)

Jiang et al. (2013) studied assortative mating in animals. They compiled
a large database, reporting the results of many experiments on mating.
In particular, for several taxa they provide the value of correlation
among the sizes of the mates. A positive value of r stands for
assortative mating (large animals tend to mate with large animals), and
a negative value for disassortative mating.

1.  You can find the data in R/DataFiles//Jiang2013\_data.csv. Write a
    function that takes as input the desired Taxon and returns the mean
    value of r.

<!-- -->

    mating <- read.csv("Jiang2013_data.csv", sep = "\t", header = T)
    head(mating)

    ##            Scientific.Name     Taxon Trait      r SampleSize         Source
    ## 1 Acanthurus glaucoparieus      Fish  size -0.110         12 Robertson 1985
    ## 2  Acanthurus leucosternon      Fish  size  0.380         15 Robertson 1985
    ## 3   Acanthurus nigrofuscus      Fish  size  0.510         13 Robertson 1985
    ## 4    Agalychnis callidryas Amphibian  size  0.868         10    Briggs 2007
    ## 5    Agalychnis callidryas Amphibian  size  0.297          5    Briggs 2007
    ## 6    Agalychnis callidryas Amphibian  size  0.084         15    Briggs 2007

    #developing the fuction to calculate mean of r of each taxon

    meanM <- function(taxon){
      group <- mating$r[mating$Taxon == taxon]
      result <- mean(group)
      return(result)
    }

    meanM("Amphibian")

    ## [1] 0.1855282

1.  You should see that fish have a positive value of r, but that this
    is also true for other taxa. Is the mean value of r especially high
    for fish? To test this, compute a p-value by repeatedly sampling 37
    values of r at random from the entire dataset (37 experiments on
    fish are reported in the database), and calculating the probability
    of observing a higher mean value of r. To get an accurate estimate
    of the p-value, use 50,000 randomizations.

<!-- -->

    #randomizations
    nExp <- 50000

    #mean r for fish
    fish_mean <- mean(mating$r[mating$Taxon == "Fish"])

    #vector to save results
    random_means <- c()

    #randomization
    for(i in 1:nExp){
      #here the replacement is false because we are randomly selecting 37 different values, no repeated
      random_sample <- sample(mating$r, size = 37, replace = F)
      random_means[i] <- mean(random_sample)
    }

    #calculating p-value
    p_value <- sum(random_means >= fish_mean)/nExp

    #results 
    p_value

    ## [1] 0.00308

    #this p value since it's < 0.05 tells us that it's unlikely to obtain a mean as high as or higher than the fish mean by chance.

1.  Repeat the procedure for all taxa.

<!-- -->

    #all taxa, unique values fish amphibian crustacean etc
    all_taxa <- unique(mating$Taxon)

    #randomizations
    nExp <- 50000

    #data frame to save results
    results <- data.frame(Taxon = all_taxa, mean = NA, p_value = NA)

    #each taxon
    for(j in 1:length(all_taxa)){
      #selecting the r values for this taxon
      rs <- mating$r[mating$Taxon == all_taxa[j]]
      #calculating the mean of r per taxon
      mean <- mean(rs)
      #experiments for this taxon, in fish was 37 but it might vary across taxa
      n <- length(rs)
      #random means
      random_means <- c()

      #randomization
      for(i in 1:nExp){
        random_sample <- sample(mating$r, size = n, replace = FALSE)
        random_means[i] <- mean(random_sample)
      }

      #calculate p-value
      p_value <- sum(random_means >= mean) / nExp

      # Save results
      results$mean[j] <- mean
      results$p_value[j] <- p_value
    }

    # Display results
    results

    ##          Taxon      mean p_value
    ## 1         Fish 0.3971901 0.00304
    ## 2    Amphibian 0.1855282 1.00000
    ## 3  Chelicerate 0.4911353 0.01032
    ## 4         Bird 0.1317567 0.99978
    ## 5   Crustacean 0.4030283 0.00000
    ## 6    Gastropod 0.4010000 0.08108
    ## 7      Reptile 0.1175000 0.93180
    ## 8       Insect 0.1966453 0.99820
    ## 9     Annelids 0.2000000 0.58998
    ## 10     Protist 0.6140200 0.00344
    ## 11      Mammal 0.0090000 0.84472
