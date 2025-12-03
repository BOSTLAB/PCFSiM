Fit_parametric_pcf_model = function(List_pcf,model="Generalized_gamma") {
  
  N_pcf = length(List_pcf$List_pcf)
  Table_fitted_parameters = c()
  
  if (model=="Power_law") {
    for (k in 1:N_pcf) {
      print(k)
      temp_fit = try(Fit_power_law(x = List_pcf$List_r[[k]],y = List_pcf$List_pcf[[k]],show_plot = FALSE))
      if (class(temp_fit)=="try-error") {
        temp_fit = rep(NA,3)
      }
      Table_fitted_parameters = rbind(Table_fitted_parameters,temp_fit)
    }
    rownames(Table_fitted_parameters) = 1:nrow(Table_fitted_parameters)
  }
  
  
  if (model=="Generalized_gamma") {
    for (k in 1:N_pcf) {
      print(k)
      temp_fit = try(Fit_generalized_gamma(x = List_pcf$List_r[[k]],y = List_pcf$List_pcf[[k]],show_plot = FALSE))
      if (class(temp_fit)=="try-error") {
        temp_fit = rep(NA,6)
      }
      Table_fitted_parameters = rbind(Table_fitted_parameters,temp_fit)
    }
    rownames(Table_fitted_parameters) = 1:nrow(Table_fitted_parameters)
  }
  
  if (model=="Exponential") {
    for (k in 1:N_pcf) {
      print(k)
      temp_fit = try(Fit_exponential(x = List_pcf$List_r[[k]],y = List_pcf$List_pcf[[k]],show_plot = FALSE))
      if (class(temp_fit)=="try-error") {
        temp_fit = rep(NA,4)
      }
      Table_fitted_parameters = rbind(Table_fitted_parameters,temp_fit)
    }
    rownames(Table_fitted_parameters) = 1:nrow(Table_fitted_parameters)
  }
  
  
  
  if (model=="Beta_prime") {
    for (k in 1:N_pcf) {
      temp_fit = try(Fit_beta_prime(x = List_pcf$List_r[[k]],y = List_pcf$List_pcf[[k]],show_plot = FALSE))
      if (class(temp_fit)=="try-error") {
        temp_fit = rep(NA,5)
      }
      Table_fitted_parameters = rbind(Table_fitted_parameters,temp_fit)
    }
    rownames(Table_fitted_parameters) = 1:nrow(Table_fitted_parameters)
  }
  
  if (model=="Log_Cauchy") {
    for (k in 1:N_pcf) {
      temp_fit = Fit_log_cauchy(x = List_pcf$List_r[[k]],y = List_pcf$List_pcf[[k]],show_plot = FALSE)
      Table_fitted_parameters = rbind(Table_fitted_parameters,temp_fit)
    }
    rownames(Table_fitted_parameters) = 1:nrow(Table_fitted_parameters)
  }
  
  
  if (model=="Generalized_beta_prime") {
    for (k in 1:N_pcf) {
      print(k)
      temp_fit = try(Fit_generalized_beta_prime(x = List_pcf$List_r[[k]],y = List_pcf$List_pcf[[k]],show_plot = FALSE))
      if (class(temp_fit)=="try-error") {
        temp_fit = rep(NA,7)
      }
      Table_fitted_parameters = rbind(Table_fitted_parameters,temp_fit)
    }
    rownames(Table_fitted_parameters) = 1:nrow(Table_fitted_parameters)
  }
  
  if (model=="Dagum") {
    for (k in 1:N_pcf) {
      temp_fit = try(Fit_Dagum(x = List_pcf$List_r[[k]],y = List_pcf$List_pcf[[k]],show_plot = FALSE))
      if (class(temp_fit)=="try-error") {
        temp_fit = rep(NA,5)
      }
      Table_fitted_parameters = rbind(Table_fitted_parameters,temp_fit)
    }
    rownames(Table_fitted_parameters) = 1:nrow(Table_fitted_parameters)
  }
  
  
  if (model=="Gamma") {
    for (k in 1:N_pcf) {
      temp_fit = try(Fit_gamma(x = List_pcf$List_r[[k]],y = List_pcf$List_pcf[[k]],show_plot = FALSE))
      if (class(temp_fit)=="try-error") {
        temp_fit = rep(NA,6)
      }
      Table_fitted_parameters = rbind(Table_fitted_parameters,temp_fit)
    }
    rownames(Table_fitted_parameters) = 1:nrow(Table_fitted_parameters)
  }
  
  if (model=="Sigmoid") {
    for (k in 1:N_pcf) {
      print(k)
      temp_fit = try(Fit_sigmoid(x = List_pcf$List_r[[k]],y = List_pcf$List_pcf[[k]],show_plot = FALSE))
      if (class(temp_fit)=="try-error") {
        temp_fit = rep(NA,5)
      }
      Table_fitted_parameters = rbind(Table_fitted_parameters,temp_fit)
    }
    rownames(Table_fitted_parameters) = 1:nrow(Table_fitted_parameters)
  }
  
  if (model=="Log_Laplace") {
    for (k in 1:N_pcf) {
      temp_fit = Fit_log_Laplace(x = List_pcf$List_r[[k]],y = List_pcf$List_pcf[[k]],show_plot = FALSE)
      Table_fitted_parameters = rbind(Table_fitted_parameters,temp_fit)
    }
    rownames(Table_fitted_parameters) = 1:nrow(Table_fitted_parameters)
  }
  
  
  Table_fitted_parameters = as.data.frame(Table_fitted_parameters)
  return(Table_fitted_parameters)
  
}

