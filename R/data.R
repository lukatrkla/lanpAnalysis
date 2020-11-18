#' Known Lung Cancer Related Neoantigen Database
#'
#' A dataset containing information pertaining to known neoantigens associated
#' with lung cancer.
#'
#' @source \url{http://www.biostatistics.online/dbPepNeo/index.php}
#'
#' @format A data frame with 179 rows and 13 variables:
#'
"lungData"
#' RANBP9 Mutated Peptides
#'
#' A string of nucleotides for RANBP9 that has been modified to include
#' neoantigen relevant mutations.
#'
#' @source \url{https://www.uniprot.org/uniprot/Q96S59}
#'
#' @format A string
#'
#'  @examples
"RANBP9mutated"
#' Produced graph_affinity_solution
#'
#' The solution to running graph_affinity_solution, graph_affinity("TP53", tp53mutated3times, 1)
#'
#' @source NULL
#'
#' @format NULL
#'
#'  @examples
"graph_affinity_solution"
#' Produced mutation_gene_data_solution
#'
#' The solution to running mutation_gene_data("TP53", tp53mutated3times)
#'
#' @source NULL
#'
#' @format NULL
#'
#'  @examples
"mutation_gene_data_solution"
#' Produced mutation_positions_solution
#'
#' The solution to mutation_positions("TP53", tp53mutated3times)
#'
#' @source NULL
#'
#' @format NULL
#'
#'  @examples
"mutation_positions_solution"
#' Produced patient_affinity_visualizer_solution
#'
#' The solution to patient_affinity_visualizer(testingGeneSet, colNum=1, colorFlag=0)
#'
#' @source NULL
#'
#' @format NULL
#'
#'  @examples
"patient_affinity_visualizer_solution"
#' Produced patient_location_visualizer_solution
#'
#' The solution to patient_location_visualizer(testingGeneSet, colNum=1, confidence=0)
#'
#' @source NULL
#'
#' @format NULL
#'
#'  @examples
"patient_location_visualizer_solution"
#' Produced plot_mutation_location_solution
#'
#' The solution to plot_mutation_location("TP53", tp53mutated3times, confidence = 1)
#'
#' @source NULL
#'
#' @format NULL
#'
#'  @examples
"plot_mutation_location_solution"
#' Produced solution_patient_neoantigen_list
#'
#' The solution to patient_neoantigen_list(testingGeneSet)
#'
#' @source NULL
#'
#' @format NULL
#'
#'  @examples
"solution_patient_neoantigen_list"
#' Produced surrounding_peptides_solution'
#'
#' The solution to surrounding_peptides("TP53", tp53mutated3times, 3)
#'
#' @source NULL
#'
#' @format NULL
#'
#'  @examples
"surrounding_peptides_solution"
#' tp53mutated3times Mutated Peptides
#'
#' A string of nucleotides for tp53mutated3times that has been modified to include
#' neoantigen relevant mutations in at least 3 locations.
#'
#' @source \url{https://www.uniprot.org/uniprot/E7EQX7#sequences}
#'
#' @format A string
#'
#'  @examples
"tp53mutated3times"

#' Produced testingGeneSet'
#'
#' An assortment of Genes to be used for testing/
#'
#' @source NULL
#'
#' @format NULL
#'
#'  @examples
"testingGeneSet"
