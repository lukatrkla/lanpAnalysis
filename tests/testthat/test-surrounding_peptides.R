test_that("surrounding_peptides works", {
  expect_identical(surrounding_peptides_solution, surrounding_peptides("TP53", tp53mutated3times, 3))
})
