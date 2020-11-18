test_that("mutation_gene_data works", {
  expect_identical(mutation_gene_data_solution, mutation_gene_data("TP53", tp53mutated3times))
})
