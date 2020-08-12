
#' Subset a data frame row-wise by matching row values to a regex pattern
#'
#' @param df A data frame
#' @param pattern A regex pattern.
#' @param x Column name to search through. Only specify 1 column name
#'
#' @return A data frame with row values which match the pattern. All columns in the data frame are returned.
#' @export
#'
#' @examples
#' subset_row(who_data, pattern = "^A", "country_name")
subset_row <- function(df, pattern, x){
  return(df[grepl(pattern, df[[x]]), ])
}
