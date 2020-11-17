mutation_gene_data <- function(geneName, seq) {
  #produces a list of neoantigen data from lungData for geneName
  geneAppearances <- (1:nrow(lungData))[lungData[,2] == geneName]
  mutationLocation <- data.frame(position=NA, mut_peptide=NA, gene=NA,
                                 HLA_allele=NA, mut_affinity=NA, rank=NA,
                                 bind_level=NA, wt_peptide=NA,
                                 peptide_length=NA, verification=NA,
                                 mutation=NA, reference=NA, confidence=NA,
                                 cancer=NA)
  if (length(geneAppearances) == 0) {
    return(mutationLocation)
  } else {
    #there is lung cancer neoantigen available for geneName
    for (i in 1:length(geneAppearances)){
      #if the current mutation is in seq
      if (unlist(gregexpr(lungData[[geneAppearances[i],1]], seq))[1] != -1) {
        for (j in unlist(gregexpr(lungData[[geneAppearances[i],1]], seq))) {
          #if mutationLocation hasn't been populated yet
          if (is.na(mutationLocation[[1]][1]) == TRUE) {
            mutationLocation[[1]] <- j
            #
            for (k in 2:14) {
              #populates the dataframe with the corresponding data from lungData
              mutationLocation[[k]] <- as.character(lungData[geneAppearances[i],
                                                             k - 1])
            }
          } else {
            a <- c(j)
            for (k in 2:14) {
              a[k] <- as.character(lungData[geneAppearances[i],k - 1])
            }
            mutationLocation <- rbind(mutationLocation, a)
          }
        }
      }
    }
  }
  return(mutationLocation)
}
