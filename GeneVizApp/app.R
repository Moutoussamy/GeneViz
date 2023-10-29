#
# This is a Shiny web application allowing to display the log2FC from RNAseq data
#

library(shiny)

data = read.csv("../test_data.csv") #READ THE DATA


# User interface part
ui <- fluidPage(

    # Application title
    titlePanel("Gene Log2FC vizualisation App - RNAseq data"),

    sidebarLayout(
        # text input to select a gene
        sidebarPanel(
            textInput("gene","Gene name","BST2")
        ),

        # show the data
        mainPanel(
           plotOutput("distPlot", width = "1200px",height = "800px")
        )
    )
)

# Server part
server <- function(input, output) {
  output$distPlot <- renderPlot({
    filtered_data <- data[grepl(input$gene, data$X, ignore.case = TRUE), ]
    if (nrow(filtered_data) > 0) {
      bar_names <- colnames(filtered_data)[-1]
      bar_colors <- ifelse(filtered_data[, -1] > 0, "#A69F3F", "#AECCF2")
      par(oma = c(5, 5, 4, 5))  
      barplot(
        t(as.matrix(filtered_data[, -1, drop = FALSE])),
        beside = TRUE,
        col = bar_colors,
        names.arg = bar_names,
        main = paste("Log2FC for the gene", input$gene),
        width = 0.5,
        space = 0.2,
        las = 1, 
        ylab = "Log2FC",
        font.axis = 2,
        cex.axis = 1.5, 
        cex.lab = 1.2,
        cex.main = 2,
        border = "transparent",
      )
      abline(h = 0, col = "black", lty = 2, lwd = 2)
    } else {
      plot(1, type = "n", xlab = "", ylab = "", main = "No data found for the gene")
    }
  })
}


# Run the application 
shinyApp(ui = ui, server = server)
