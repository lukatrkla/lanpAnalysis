test_that("patient_affinity_visualize works", {
  expect_equal(patient_affinity_visualizer_solution, patient_affinity_visualizer(testingGeneSet, colNum=1, colorFlag=0))
})
