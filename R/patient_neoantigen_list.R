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
