mutation_positions <- function(geneName, seq) {
  #produces a list of neoantigen data from lungData for geneName
  geneAppearances <- (1:nrow(lungData))[lungData[,2] == geneName]
  mutationLocation <- data.frame(position=NA, length=NA)
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
            mutationLocation[[1]] = j
            mutationLocation[[2]] = lungData[[8]][geneAppearances[i]]
          } else {
            mutationLocation <- rbind(mutationLocation, c(j, lungData[[8]]
                                                          [geneAppearances[i]]))
          }
        }
      }
    }
  }
  return(mutationLocation)
}
