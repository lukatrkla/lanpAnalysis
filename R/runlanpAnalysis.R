#' Shiny Applet for lanpAnalysis
#'
#' A function that instantiates the shiny applet made for lanpAnalysis
#'
#' @return Return Nothing, but instantiates the shiny applet.
#'
#' @export
#' @importFrom shiny runApp
#'
#' @examples
#' \dontrun{
#' runlanpAnalysis()
#' }
#'
runlanpAnalysis <- function() {
  appDir <- system.file("shiny_scripts",
                        package = "lanpAnalysis")
  shiny::runApp(appDir, display.mode = "normal")
  return()
}

