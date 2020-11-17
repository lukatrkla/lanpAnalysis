surrounding_peptides <- function(geneName, seq, sides = 3) {
  mutationLocation <- mutation_positions(geneName, seq)
  # sort the list of peptides from first to least
  mutationLocation <- mutationLocation[order(mutationLocation$position),]
  surroundingLocations <- data.frame(peptides=NA)
  # if the list is empty
  if (is.na(mutationLocation[[1]][1]) == TRUE) {
    return(surroundingLocations)
  } else {
    #the list is non-empty
    counter <- 1
    for (i in 1:nrow(mutationLocation)) {
      if (mutation_positions(geneName, mut)[[1]][i] >= counter) {
        leftBoundary <- mutation_positions(geneName, seq)[[1]][i] - sides
        # testing for out of bounds
        if (leftBoundary < 1) {
          leftBoundary <- 1
        }
        rightBoundary <-  mutation_positions(geneName, seq)[[1]][i] +
          mutation_positions(geneName, seq)[[2]][i] - 1 + sides
        # testing for out of bounds
        if (rightBoundary> nchar(seq)) {
          rightBoundary <- nchar(seq)
        }
        # sides number of peptides to the left of the mutation (if available)
        leftFlank <- substr(seq, leftBoundary, mutation_positions(geneName, seq)
                            [[1]][i] - 1)
        # sides number of peptides to the right of the mutation (if available)
        rightFlank <- substr(seq, mutation_positions(geneName, seq)[[1]][i] +
                               mutation_positions(geneName, seq)[[2]][i],
                             rightBoundary)
        # the mutation peptide
        middle <- substr(seq, mutation_positions(geneName, seq)[[1]][i],
                         mutation_positions(geneName, seq)[[1]][i] +
                           mutation_positions(geneName, seq)[[2]][i] - 1)
        finSeq <- paste0("(", leftBoundary, ")", tolower(leftFlank), middle,
                         tolower(rightFlank), "(", rightBoundary, ")")
        if (is.na(surroundingLocations[[1]][1]) == TRUE) {
          surroundingLocations[[1]] <- finSeq
        } else {
          surroundingLocations <- rbind(surroundingLocations, finSeq)
        }
        #advance counter to position after the current mutation
        counter <- mutation_positions(geneName, seq)[[1]][i] +
          mutation_positions(geneName, seq)[[2]][i] - 1
      }

    }
  }
  return(surroundingLocations)
}
