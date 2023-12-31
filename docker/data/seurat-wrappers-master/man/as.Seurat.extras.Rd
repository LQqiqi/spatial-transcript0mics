% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/conos.R, R/monocle3.R, R/velocity.R
\name{as.Seurat}
\alias{as.Seurat}
\alias{as.Seurat.Conos}
\alias{as.Seurat.cell_data_set}
\alias{as.Seurat.list}
\title{Extra conversions to Seurat objects}
\usage{
\method{as.Seurat}{Conos}(
  x,
  method = "mnn",
  reduction = "largeVis",
  idents = names(x = x$clusters)[1],
  verbose = TRUE,
  ...
)

\method{as.Seurat}{cell_data_set}(
  x,
  counts = "counts",
  data = NULL,
  assay = "RNA",
  project = "cell_data_set",
  loadings = NULL,
  clusters = NULL,
  ...
)

\method{as.Seurat}{list}(
  x,
  default.assay = 1,
  slot = "counts",
  min.cells = 0,
  min.features = 0,
  verbose = TRUE,
  ...
)
}
\arguments{
\item{method}{Name of matching method graph was built using}

\item{reduction}{Name of graph embedding, if calculated}

\item{idents}{Name of clutering method to set as identity class}

\item{loadings}{Name of dimensional reduction to save loadings to, if present;
defaults to first dimensional reduction present (eg.
\code{SingleCellExperiment::reducedDimNames(x)[1]}); pass \code{NA} to
suppress transfer of loadings}

\item{clusters}{Name of clustering method to use for setting identity classes}

\item{default.assay}{Name or index of matrix to use as default assay;
defaults to name of first matrix in list}

\item{slot}{Name of slot to store matrix in; choose from 'counts' or 'data'}
}
\description{
Extra conversions to Seurat objects
}
\details{
The \code{Conos} method for \code{\link[Seurat]{as.Seurat}} only works if all
samples are \code{Seurat} objects. The object is initially constructed by merging
all samples together using \code{\link[Seurat]{merge}}, any sample-level dimensional
reductions and graphs will be lost during the merge. Extra information is added
to the resulting Seurat object as follows:
\itemize{
  \item Pairwise alignments will be stored in miscellaneous data, as will any
  other miscellaneous information
  \item If a graph is present in the \code{graph} field, it will be stored as
  a \code{Graph} object, reordered to match cell order in the new \code{Seurat}
  object. It will be named "\code{DefaultAssay(SeuratObject)}_\code{method}"
  \item If an embedding is present in the \code{embedding} field as a
  \code{\link{matrix}}, it will be stored as a \code{DimReduc} object with the
  name \code{reduction} and a key value of "\code{toupper(reduction)}_"
  \item If the length of the \code{clusters} field is greater than zero,
  clustering information (\code{groups} field) will be added to object metadata.
  Extra information (\code{result} field) will be added to miscellaneous data
  with the name "conos.\code{clustering}.result"
  \item If present, the first clustering entry in the \code{clusters} field
  will be set as object identity classes
}

The \code{cell_data_set} method for \code{\link[Seurat]{as.Seurat}}
utilizes the \code{\link[Seurat::as.Seurat]{SingleCellExperiment}} method of
\code{\link[Seurat]{as.Seurat}} to handle moving over expression data, cell
embeddings, and cell-level metadata. The following additional information
will also be transfered over:
\itemize{
 \item Feature loadings from \code{cds@reduce_dim_aux$gene_loadings} will be
 added to the dimensional reduction specified by \code{loadings} or the name
 of the first dimensional reduction that contains "pca" (case-insensitive) if
 \code{loadings} is not set
 \item Monocle 3 clustering will be set as the default identity class. In
 addition, the Monocle 3 clustering will be added to cell-level metadata as
 \dQuote{monocle3_clusters}, if present
 \item Monocle 3 partitions will be added to cell-level metadata as
 \dQuote{monocle3_partitions}, if present
 \item Monocle 3 pseudotime calculations will be added to
 \dQuote{monocle3_pseudotime}, if present
 \item The nearest-neighbor graph, if present, will be converted to a
 \code{\link[Seurat]{Graph}} object, and stored as
 \dQuote{\code{assay}_monocle3_graph}
}

The \code{list} method for \code{\link[Seurat]{as.Seurat}} takes a named list
of matrices (dense or sparse) and creates a single \code{Seurat} object where
each matrix is its own assay. The names of the list are taken to be the names
of the assays. If not present, assays will be named as "Assay#" where "#" is
the index number in the list of matrices. Objects will be constructed as follows:
\itemize{
  \item By default, all matrices are assumed to be raw counts and will be stored
  in the \code{counts} slot. This can be changed to store in the matrix in the
  \code{data} slot instead. The \code{slot} parameter is vectorized, so different
  matrices can be stored in either \code{counts} or \code{data}
  \item For any and all matrices designated as \code{counts}, the \code{min.cells}
  and \code{min.features} filtering will be applied. These parameters are vectorized,
  so different filterings can be applied to different matrices
  \item No extra information (eg. \code{project}) can be provided to
  \code{\link[Seurat]{CreateSeuratObject}}
}
}
\seealso{
\code{\link[Seurat]{as.Seurat}}

\code{\link[Seurat]{as.Seurat.SingleCellExperiment}}
}
