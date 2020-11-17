#' Visualize a Patient's Mutant Peptide - HLA Allele Affinities
#'
#' Barplot a set of gene's predicted percentage ranks for their present mutant
#' neoantigen peptides (which have HLA alleles affinities information available
#' in the lung cancer neoantigen database.)
#'
#' @param geneSet A data.frame of gene names and associated gene peptide
#' sequence.
#' @param colNum Number of Columns the resulting set of barplots will have
#' @param colorFlag By Default, colorFlag is set to 0. If it is set to 1,
#' all subsequent affinity barplots will be coloured according to binding
#' strength between the mutation and the HLA-Allele. If it is set to 2,
#' all subsequent affinity barplots will be coloured according to confidence
#' level between mutation and the HLA-Allele.
#'
#' @return status, 1 for failure, 0 for success.
#' @export
#'
#' @examples
#' NULL
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
    graphics::par(mfrow=c(nRow,colNum))
    for(i in neoIndexes){
      #populates the barplots row by row. Based on colorFlag, the subsequent
      #barplots will be appropriately coloured
      graph_affinity(geneSet[i,][[1]], geneSet[i,][[2]], colorFlag)
    }
    return(0)
  }
}
