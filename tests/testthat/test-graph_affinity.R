test_that("graph_affinity_solution", {
  expect_identical(graph_affinity_solution, graph_affinity("TP53", tp53mutated3times, 1))
})
