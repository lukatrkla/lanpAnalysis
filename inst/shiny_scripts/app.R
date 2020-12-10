library(shiny)
ui <- fluidPage(
  headerPanel("lanpAnalysis: plot_mutation_location"),
  sidebarPanel(
    textInput(inputId = "givenGeneName",
              label = "Input a Gene Name",
              value = "TP53"
    ),
    textInput(inputId = "givenSequence",
              label = "Input a Gene Sequence",
              value = "MEEPQSDPSVEPPLSQEFPSPSKTSLTLTFSDLWCMGGMNLRKLLPENNVLSPLPSQAMDDLMLSPDDIEQWFTEDPGPDEAPRMPEAAPPVAPAPAAPTPAAPAPAPSWPLSSSVPSQKTYQGSYGFRLGFLHSGTAKSVTCTYSPALNKMFCQLAKTCPVQLWVDSTPPPGTRVRAMAIYKQSQHMTEVVRRCPHHCMGGMNLRERCSDSDSPSKTSLTLGLAPPQHLIRVEGNLRVEYLDDRNTFRHSVVVPYEPPEVGSDCTTIHYNYMCNSSCMGGMNLRPILTIITLEDSRPRQVDHLRSGVQDSLANCMGGMNLRIAKSHLY",
    ),
    checkboxInput(inputId = "givenColorFlag",
                  label = "Confidence",
                  FALSE
    )
  ),
  plotOutput("finPlot")
)

server <- function(input, output) {
  output$finPlot <- renderPlot({
    geneName <- input$givenGeneName
    seq <- input$givenSequence

    if (isFALSE(input$givenColorFlag)) {
      confidence <- 0
    } else {
      confidence <- 1
    }

    presentMutations<- mutation_gene_data(geneName, seq)
    mutationPositions <- as.character(presentMutations[,1])
    if (is.na(mutationPositions[1])) {
      plot(x=-10, y=-10, main=geneName, xlab="Nucleotide Position",
           ylab="% Binding Affinity: Peptide & HLA",
           las=1, xlim=c(0, nchar(seq)), ylim=c(0,100))
    } else {
      mutationRank <- as.character(presentMutations[,6])
      mutationHLA <- as.character(presentMutations[,4])
      mutationNames <- as.character(presentMutations[,11])
      plot(mutationPositions, mutationRank, ylim=c(0 ,
                                                   max(as.numeric(mutationRank)) * 1.3), yaxs = "i", type="n", main=geneName, xlab="Nucleotide Position", ylab="% Binding Affinity: Peptide & HLA", las=1)
      if (confidence != 0) {
        midConfidence <- subset(presentMutations, confidence == "MC")
        graphics::lines(midConfidence$position, midConfidence$rank, type="h", lwd = 6, col="Yellow")
        highConfidence <- subset(presentMutations, confidence == "HC")
        graphics::lines(highConfidence$position, highConfidence$rank, type="h", lwd = 6, col="Red")
        graphics::legend(nchar(seq) / 10, max(as.numeric(mutationRank)) * 1.25, legend=c("High Confidence", "Middle Confidence"),
                         fill=c("Red", "Yellow"), bty="n")
      } else {
        graphics::lines(mutationPositions, mutationRank, type="h", lwd = 6)
      }
      for (i in 1:length(mutationRank)) {
        graphics::text(x=as.numeric(mutationPositions[i]), y=as.numeric(mutationRank[i]), pos=2, srt=90, adj=c(0,0), label=paste0(mutationHLA[i], " : ", mutationNames[i]))
      }
    }
  })
}

shinyApp(ui = ui, server = server)
