patient_location_visualizer <- function(geneSet, colNum=1, confidence=0) {
  #produces the indexes of entries in geneSet that have mutations in the
  #lung cancer database
  neoIndexes <- patient_neoantigen_list(geneSet)
  #checks if geneSet has any neoantigen targets
  if (length(neoIndexes) == 0) {
    print("The gene set doesn't have neoantigen targets for lung cancer")
    return(1)
  } else {
    #produces the appropriate number of rows and columns for viewing all the
    #plots
    nRow <- length(neoIndexes) %/% colNum
    if ((length(neoIndexes) %% colNum) != 0) {
      nRow <- nRow + 1
    }
    par(mfrow=c(nRow,colNum))
    #plots the location plots row by row
    for(i in neoIndexes){
      plot_mutation_location(geneSet[i,][[1]], geneSet[i,][[2]], confidence)
    }
  }
  return(0)
}

patient_neoantigen_list <- function(geneSet) {
  sol <- list()
  # populates sol with indexes of genes in geneSet that have neoantigen targets
  # for lung cancer"
  for(i in 1:nrow(geneSet)){
    if (is.na(mutation_positions(geneSet[i,1], geneSet[i,2])$position[1])) {
    } else {
      sol <- c(sol, i)
    }
  }
  return(unlist(sol))
}
