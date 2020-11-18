#' Known Lung Cancer Related Neoantigen Database
#'
#' A dataset containing information pertaining to known neoantigens associated
#' with lung cancer.
#'
#' @source \url{http://www.biostatistics.online/dbPepNeo/index.php}
#'
#' @format A data frame with 179 rows and 13 variables:
#' \describe{
#'   \item{%rank}{The % rank of binding affinity between the HLA allele and the the mutated peptide.}
#'   \item{bind level}{The binding level between the mutant peptide and its associated HLA Allele.}
#'   \item{cancer}{Neoantigen's associated form of cancer.}
#'   \item{confidence}{The confidence level of the neoantigen.}
#'   \item{gene}{The name of the gene.}
#'   \item{hla allele}{The HLA allele for the neoantigen.}
#'   \item{mut affinity(nM)}{The binding affinity between the HLA allele and the mutated peptide.}
#'   \item{mut peptide}{The mutated sequence of peptides for the neoantigen.}
#'   \item{mutation}{The name of the mutation.}
#'   \item{peptide length}{The name of the mutation in bp}
#'   \item{reference}{Pubmed article link for source of neoantigen.}
#'   \item{verification}{The form of verifying the mutation and HLA allele
#'   interaction.}
#'   \item{wt peptide}{Wild type peptide sequence for the mutation.}
#'   ...
#'  }
#'  @examples
#'   \dontrun{
#'    lungData
#'   }
"lungData"
