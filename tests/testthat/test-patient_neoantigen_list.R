test_that("patient_neoantigen_list works", {
  expect_identical(solution_patient_neoantigen_list, patient_neoantigen_list(testingGeneSet))
})
