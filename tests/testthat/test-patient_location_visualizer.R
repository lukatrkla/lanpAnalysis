test_that("patient_location_visualizer works", {
  expect_identical(patient_location_visualizer_solution, patient_location_visualizer(testingGeneSet, colNum=1, confidence=0))
})
