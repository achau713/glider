
#' Subset a data frame by matching row values to a regex pattern
#'
#' @param df A data frame
#' @param pattern A regex pattern. A character
#' @param x A character vector whose matches are sought
#'
#' @return
#' @export
#'
#' @examples
#' subset_row(pregnancy_t0, "ces_d", "field_name")
subset_row <- function(df, pattern, x){
  return(df[grepl(pattern, df[[x]]), ])
}
