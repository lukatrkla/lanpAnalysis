test_that("plot_mutation_location works", {
  expect_identical(plot_mutation_location_solution, plot_mutation_location("TP53", tp53mutated3times, confidence = 1))
})
