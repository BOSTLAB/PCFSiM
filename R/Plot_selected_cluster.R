#' Plot cells of a selected cluster
#'
#' @param selected_cluster Cluster name or ID to plot.
#' @param title_show Optional title for the plot.
#' @return A plot of the point pattern for the selected cluster.
#' @importFrom spatstat.geom ppp
#' @importFrom spatstat.geom owin
#' @export

Plot_selected_cluster = function(Meta_data, cell_centroid_x = 2, cell_centroid_y = 3, Labels = 4, selected_cluster, title_show = NULL) {
  cluster_data = Meta_data[Meta_data[[Labels]] == selected_cluster, ]
  ppp_temp = ppp(x = cluster_data[[cell_centroid_x]],y = cluster_data[[cell_centroid_y]], 
    window = owin(xrange = range(Meta_data[[cell_centroid_x]]), yrange = range(Meta_data[[cell_centroid_y]])))
  plot(ppp_temp, cex = 0.2, main = title_show)
}

