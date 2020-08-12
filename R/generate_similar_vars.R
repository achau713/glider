
#' Generate a vector of variable names suffixed by a numerical index
#'
#' @param var_name a string containing the base variable phrase
#' @param num_indices a vector of numerical indices. This number will be appended to var_name
#'
#' @return a vector of variable names with appended numeric suffixes
#'
#' @examples generate_similar_vars(varName = "m18_stai", num_indices = c(1, 3, 5))
#' @examples generate_similar_vars(varName = "t0_dem", num_indices = seq(1:10))
generate_similar_vars <- function(var_name, num_indices){

  return(paste0(var_name, num_indices))
}
