library(shiny)

# User interface part
ui <- fluidPage(
  # Application title
  titlePanel("Gene Log2FC Visualization App - RNAseq data"),
  sidebarLayout(
    ## Select the file and dropdown menu to select a gene
    sidebarPanel(
      fileInput("data_file", "Upload Gene Expression Data (CSV)"),
      selectInput("gene", "Select Gene Name", choices = NULL)  # dropdown menu
    ),
    ## Show the data
    mainPanel(
      plotOutput("distPlot", width = "1200px", height = "800px")
    )
  )
)

# Server part
server <- function(input, output, session) {
  gene_data <- reactive({
    req(input$data_file)  # Ensure a file is selected
    read.csv(input$data_file$datapath) #read csv
  })
  
  ## Dynamically populate the gene name dropdown based on the uploaded data
  observe({
    gene_data_df <- gene_data()
    gene_names <- unique(gene_data_df$X)
    updateSelectInput(session, "gene", choices = gene_names)
  })
  
  ## Plot part
  output$distPlot <- renderPlot({
    gene_data_df <- gene_data()
    filtered_data <- gene_data_df[grepl(input$gene, gene_data_df$X, ignore.case = TRUE), ]
    
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
