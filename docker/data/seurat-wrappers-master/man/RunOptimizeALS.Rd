% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/liger.R
\name{RunOptimizeALS}
\alias{RunOptimizeALS}
\alias{optimizeALS}
\title{Run optimizeALS on a Seurat object}
\usage{
RunOptimizeALS(
  object,
  k,
  assay = NULL,
  split.by = "orig.ident",
  lambda = 5,
  thresh = 1e-06,
  max.iters = 30,
  reduction.name = "iNMF_raw",
  reduction.key = "riNMF_",
  nrep = 1,
  H.init = NULL,
  W.init = NULL,
  V.init = NULL,
  rand.seed = 1,
  print.obj = FALSE,
  ...
)
}
\arguments{
\item{object}{A merged Seurat object}

\item{assay}{Assay to use, defaults to the default assay of the first object}

\item{split.by}{Attribute for splitting, defaults to "orig.ident"}

\item{reduction.name}{Name to store resulting DimReduc object as}

\item{reduction.key}{Key for resulting DimReduc}

\item{...}{Arguments passed to other methods}
}
\value{
A Seurat object with embeddings and loadings from \code{\link[liger]{optimizeALS}}
stored as a DimReduc object with name \code{reduction.name} (key set to \code{reduction.key});
per-dataset feature loadings matrices stored in the \code{tool} slot, accessible with
\code{\link[Seurat]{Tool}}
}
\description{
Run optimizeALS on a Seurat object
}
\seealso{
\code{\link[rliger]{optimizeALS}} \code{\link[Seurat]{Tool}}
}
