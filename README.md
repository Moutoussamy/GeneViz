# Shiny Gene Log2FC Visualization App
## Overview

The Shiny Gene Log2FC Visualization App is a Shiny web application that allows you to upload a CSV file containing gene expression data and visualize the Log2FC (Log2 Fold Change) for a selected gene. Log2FC is a common metric used in RNA-seq analysis to assess the change in gene expression between two conditions.

## Getting Started

To run this Shiny app on your local machine, follow these steps:

1. **Prerequisites**: Make sure you have R and RStudio installed on your computer. You can download R from the R Project website and RStudio from the RStudio website.

2. **Download the Code**: Download the code for this Shiny app.

3. **Install Required Packages**: Open RStudio, and install the required packages if you haven't already by running the following commands:
```
install.packages("shiny")
```

4. **Run the App**: Open the app.R file in RStudio and click the "Run App" button. This will launch the Shiny app in your web browser.

5. **Usage**: Use the app to upload a CSV file with gene expression data and select a gene from the dropdown menu. The app will generate a bar plot showing the Log2FC for the selected gene. 

6. **Interact with the Plot**: The generated plot provides a visual representation of the Log2FC values for the selected gene. You can explore the plot, and if no data is found for the selected gene, a message indicating "No data found for the gene" will be displayed.


## Dependencies

The app uses the following R packages:

**shiny**: The Shiny package is used for building interactive web applications in R.


## License

This Shiny Gene Log2FC Visualization App is provided under the MIT License.

## Author

This app was created by Emmanuel E. Moutoussamy. If you have any questions or need further assistance, please don't hesitate to contact the author.