#' Plot cells of a selected cluster
#'
#' @param selected_cluster Cluster name or ID to plot.
#' @param title_show Optional title for the plot.
#' @return A plot of the point pattern for the selected cluster.
#' @importFrom spatstat.geom ppp
#' @importFrom spatstat.geom owin
#' @export

Plot_selected_cluster = function(selected_cluster,title_show=NULL) {
  ppp_temp = ppp(x = Raw_metadata$cell_centroid_x[Raw_metadata$Clustering==selected_cluster],
                 y = Raw_metadata$cell_centroid_y[Raw_metadata$Clustering==selected_cluster],
                 window = owin(xrange = range(Raw_metadata$cell_centroid_x),yrange = range(Raw_metadata$cell_centroid_y)))
  plot(ppp_temp,cex=0.2,main=title_show)
  
}
