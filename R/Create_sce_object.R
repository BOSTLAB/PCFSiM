#' Create a SingleCellExperiment object from a data.frame
#'
#' @param df A data.frame containing at least coordinates and clustering info.
#' @param cell_centroid_x Name of the column for x coordinates (default: "cell_centroid_x").
#' @param cell_centroid_y Name of the column for y coordinates (default: "cell_centroid_y").
#' @param Clustering Name of the column for cluster labels (default: "Clustering").
#'
#' @return A SingleCellExperiment object with coordinates and cluster labels.
#' @export 

Create_sce_object = function(df, cell_centroid_x='cell_centroid_x',cell_centroid_y='cell_centroid_y',Clustering='Clustering') {
  if (!all(c(cell_centroid_x, cell_centroid_y, Clustering) %in% colnames(df))) {
    stop("One or more specified columns do not exist in the input data.frame.")
  }
  sce <- SingleCellExperiment(
    assays = list(
      Raw_intensity = matrix(0, nrow = 2, ncol = nrow(df))
    ),
    metadata = list(
      dimension = "2D",
      N_core = 8,
      Is_nuc_cyt = FALSE
    )
  )
  colLabels(sce) = as.numeric(df[[Clustering]])
  sce$Location_Center_X =df[[cell_centroid_x]]
  sce$Location_Center_Y = df[[cell_centroid_y]]
  sce$ImageNumber =  1
  return(sce)
}