test_that("mutation_positions works", {
  expect_identical(mutation_positions_solution, mutation_positions("TP53", tp53mutated3times))
})
