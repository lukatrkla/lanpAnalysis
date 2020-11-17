#' Visualize the Gene's Peptide Locations/Affinities for Neoantigens
#'
#' Produce a graphical output portraying a geneName's neoantigen positions, as
#' well as predicted percentage ranks for their present mutant neoantigen
#' peptides (which have HLA alleles affinities information available in the
#' lung cancer neoantigen database.)
#'
#' @param geneName The string name of the gene.
#' @param seq The string peptide sequence associated with the gene.
#' @param confidence By default, confidence is set to 0. If it is set to 1,
#' scatterplot will be coloured according to the confidence level of the
#' neoantigens.
#'
#' @return NULL
#' @export
#'
#' @examples
#' plot_mutation_location("EPB41L3", "RAMAIYKQSQ...", confidence=0)
plot_mutation_location <- function(geneName, seq, confidence=0) {
  #produces a list of dataframes from of all rows in geneName where seq is a
  #mutation featured in the lung cancer neoantigen data set.
  presentMutations<- mutation_gene_data(geneName, seq)
  #produces a 'list' of positions where presentMutations entries are found in
  #geneName
  mutationPositions <- as.character(presentMutations[,1])
  #check if gene has no neoantigen binding affinity data
  if (is.na(mutationPositions[1])) {
    #return an empty plot
    plot(x=-10, y=-10, main=geneName, xlab="Nucleotide Position",
         ylab="% Binding Affinity: Peptide & HLA",
         las=1, xlim=c(0, nchar(seq)), ylim=c(0,100))
    return(NULL)
  }
  #for simplicity, renamed presentMutations' list of ranks, HLA allele names,
  # and mutation names to simple variables
  mutationRank <- as.character(presentMutations[,6])
  mutationHLA <- as.character(presentMutations[,4])
  mutationNames <- as.character(presentMutations[,11])
  #plot the mutation positions on a scatterplot
  plot(mutationPositions, mutationRank, ylim=c(0 ,
                                               max(as.numeric(mutationRank)) * 1.3), yaxs = "i", type="n", main=geneName,
       xlab="Nucleotide Position",
       ylab="% Binding Affinity: Peptide & HLA", las=1)
  #inserts confidence colouring if requested, with corresponding legend
  if (confidence != 0) {
    midConfidence <- subset(presentMutations, confidence == "MC")
    graphics::lines(midConfidence$position, midConfidence$rank, type="h", lwd = 6,
          col="Yellow")
    highConfidence <- subset(presentMutations, confidence == "HC")
    graphics::lines(highConfidence$position, highConfidence$rank, type="h", lwd = 6,
          col="Red")
    graphics::legend(nchar(seq) / 10, max(as.numeric(mutationRank)) * 1.25,
           legend=c("High Confidence", "Middle Confidence"),
           fill=c("Red", "Yellow"), bty="n")
  } else {
    graphics::lines(mutationPositions, mutationRank, type="h", lwd = 6)
  }
  #provides text name of mutation and corresponding HLA allele to plot
  for (i in 1:length(mutationRank)) {
    graphics::text(x=as.numeric(mutationPositions[i]), y=as.numeric(mutationRank[i]),
         pos=2, srt=90, adj=c(0,0), label=paste0(mutationHLA[i], " : ",
                                                 mutationNames[i]))
  }
  return(NULL)
}
