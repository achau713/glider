#' Subset a data frame column-wise by matching column names to a regex pattern
#'
#' @param df A data frame
#' @param pattern A regex pattern. A character vector.
#'
#' @return A data frame with column names which match the pattern. All rows in the data framr are returned.
#' @export
#'
#' @examples
#' subset_column(exercise, pattern = "blood")
subset_column <- function(df, pattern){
  return(df[grepl(pattern, colnames(df))])
}
