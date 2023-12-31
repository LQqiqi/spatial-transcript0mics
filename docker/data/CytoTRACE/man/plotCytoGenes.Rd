% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotCytoGenes.R
\name{plotCytoGenes}
\alias{plotCytoGenes}
\title{Visualizing genes associated with CytoTRACE}
\usage{
plotCytoGenes(
  cyto_obj = NULL,
  numOfGenes = 10,
  colors = c("darkred", "navyblue"),
  outputDir = "./"
)
}
\arguments{
\item{cyto_obj}{a list object generated by the 'CytoTRACE' or 'iCytoTRACE' functions}

\item{numOfGenes}{a numeric value indicating the number of genes to plot. default: 10}

\item{colors}{a two-item character vector, where the first color corresponds to the genes associated with least differentiated cells (high CytoTRACE) and second color to the genes associated with most differentiated cells (low CytoTRACE). default: c("darkred", "navyblue")}

\item{outputDir}{path to output directory where the plot will be written. Format should be "/PATH/TO/DIRECTORY/".}
}
\value{
a PDF of bar plots indicating the genes associated with least and most differentiated cells based on correlation with CytoTRACE.
}
\description{
This function generates a bar plot to visualize genes associated with CytoTRACE.
At minimum, the ‘plotCytoGenes’ function takes as input a list object generated by either the ‘CytoTRACE’ or ‘iCytoTRACE’ functions.
Users can also indicate the number of genes and colors to display.

cyto_obj = NULL, phenotype = NULL, gene = NULL, colors = NULL, emb = NULL
}
\examples{

#Use the bone marrow 10x scRNA-seq dataset to run CytoTRACE
results <- CytoTRACE(marrow_10x_expr)

#Run plotCytoTRACE
plotCytoGenes(results, numOfGenes = 10)

}
\references{
https://doi.org/10.1101/649848
}
\seealso{
https://cytotrace.stanford.edu
}
\author{
Gunsagar Gulati <cytotrace@gmail.com>
}
