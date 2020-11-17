#' Builds a Neoantigen Information Data.Frame Function
#'
#' Analyzes seq for mutations in the lung cancer neoantigen database for
#' neoantigens for pertaining to geneName, and returns a data.frame with the
#' information pertaining to each neoantigen discovered, as well as the
#' position in seq where the mutation was found.
#'
#' @param geneName The string name of the gene.
#' @param seq The string peptide sequence associated with the gene.
#'
#' @return data.frame
#' @export
#'
#' @examples
#' mutation_gene_data("KRAS", "AKSVTCTY...")
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
