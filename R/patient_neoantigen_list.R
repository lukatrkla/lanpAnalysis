#' The Gene Neoantigen Index Function
#'
#' Produces a list of valid indexes into geneSet where a neoantigen target
#' for lung cancer was discovered. This serves to effectively remove all the
#' genes from query that do not have neoantigen target information for lung
#' cancer available.
#'
#' @param geneSet A data.frame of gene names and associated gene peptide
#' sequences.
#'
#' @return A list of indexes
#' @export
#'
#' @examples
#' NULL
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
