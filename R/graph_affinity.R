graph_affinity <- function(geneName, seq, colorFlag=0) {
  #produces list of mutations found in geneName that also reside in the lung
  #cancer database
  presentMutations<- mutation_gene_data(geneName, seq)
  mutationAffinity <- unlist(as.numeric(presentMutations$rank))
  #check if gene has no neoantigen binding affinity data in lung cancer
  #database
  if (is.na(mutationAffinity[1])) {
    #return an empty plot
    barplot(c(1, 3, 5), col = NA, border = NA, main=geneName,
            ylab="log(HLA : Mutation Affinity)")
    return(NULL)
  }
  mutationName <- as.character(presentMutations$mutation)
  # modified data and data2 from user1945827 on May 27, '16 @ 10:42, on
  #   https://stackoverflow.com/questions/37480949/...
  #   ...re-ordering-bars-in-rs-barplot/37481077
  data <- data.frame(mutationAffinity, mutationName)
  data2  <- data[order(data[,1],decreasing=TRUE),]
  colorList <- c()
  #produces sequence of colors based on colorFlag
  if (colorFlag == 1) {
    for (i in order(data[,1],decreasing=TRUE)) {
      if (presentMutations[i,]$bind_level == "NB") {
        colorList <- c(colorList, "#7EB6FF")
      } else if (presentMutations[i,]$bind_level == "WB") {
        colorList <- c(colorList, "#5190ED")
      } else if (presentMutations[i,]$bind_level == "SB") {
        colorList <- c(colorList, "#1B3F8B")
      }
    }
  } else if (colorFlag == 2) {
    for (i in order(data[,1],decreasing=TRUE)) {
      if (presentMutations[i,]$confidence == "MC") {
        colorList <- c(colorList, "Yellow")
      } else if (presentMutations[i,]$confidence == "HC") {
        colorList <- c(colorList, "Red")
      }
    }
  }
  #plots the data with the appropriate colorFlag
  barplot(data2[,1],names.arg=data2[,2], col=colorList, log="y", main=geneName,
          ylab="log(HLA : Mutation Affinity)")
  #adds legend if confidence or binding data is requested
  if (colorFlag == 1) {
    legend("topright", legend = c("Nonbinding", "Weak Binding",
                                  "Strong Binding"),
           fill = c("#7EB6FF", "#5190ED", "#1B3F8B"))
  } else if (colorFlag == 2) {
    legend("topright", legend = c("Middle Confidence", "High Confidence"),
           fill = c("Yellow", "Red"))
  }
  return(NULL)
}
