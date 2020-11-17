patient_affinity_visualizer <- function(geneSet, colNum=1, colorFlag=0) {
  #produces the indexes of entries in geneSet that have mutations in the
  #lung cancer database
  neoIndexes <- patient_neoantigen_list(geneSet)
  #checks if geneSet has any neoantigen targets
  if (length(neoIndexes) == 0) {
    print("The gene set doesn't have neoantigen targets for lung cancer")
    return(1)
  } else {
    #produces the appropriate number of rows and columns for viewing all the
    #graphs
    nRow <- length(neoIndexes) %/% colNum
    if ((length(neoIndexes) %% colNum) != 0) {
      nRow <- nRow + 1
    }
    #initializes the rows and columns for the barplots
    par(mfrow=c(nRow,colNum))
    for(i in neoIndexes){
      #populates the barplots row by row. Based on colorFlag, the subsequent
      #barplots will be appropriately coloured
      graph_affinity(geneSet[i,][[1]], geneSet[i,][[2]], colorFlag)
    }
    return(0)
  }
}
