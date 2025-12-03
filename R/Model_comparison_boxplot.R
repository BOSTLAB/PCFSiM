#' Makes a boxplot comparing the R2 of different Pcf fitted model
#'
#' @param list_results A list containing the results of different fitted models
#' @return NULL This function does not return a value; it displays a plot.
#' @export

Model_comparison_boxplot = function(list_results=list(Results_power_law,Results_exponential)) {
  if(is.null(names)) names = if(!is.null(names(list_results))) names(list_results) else paste0("Model ", seq_along(list_results))
  par(las=1,bty='l')
  boxplot(lapply(list_results, function(x) x$R2), ylim=c(0.4,1),
          xaxs='i',yaxs='i',names=names,
          xlab="Model",ylab="R2",cex.lab=1.3,col=brewer.pal(length(list_results),"Spectral"),cex.axis=0.7)
  return(NULL)
}