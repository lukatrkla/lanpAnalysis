#' Visualize the Patient's Peptide Locations/Affinities for Neoantigens
#'
#' Produce a graphical output portraying a set of gene's neoantigen positions
#' within their respected genes, as well as predicted percentage ranks for their
#' present mutant neoantigen peptides (which have HLA alleles affinities
#' information available in the lung cancer neoantigen database.)
#'
#' @param geneSet A data.frame of gene names and associated gene peptide
#' sequence.
#' @param colNum The number of columns you wish the scatterplots to be in.
#' @param confidence By Default, confidence is set to 0. If it is set to 1, all
#' subsequent affinity scatterplots will be coloured according to the
#' confidence level of the neoantigen.
#'
#' @return status, 1 for failure, 0 for success.
#' @export
#'
#' @examples
#' NULL
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
    graphics::par(mfrow=c(nRow,colNum))
    #plots the location plots row by row
    for(i in neoIndexes){
      plot_mutation_location(geneSet[i,][[1]], geneSet[i,][[2]], confidence)
    }
  }
  return(0)
}
