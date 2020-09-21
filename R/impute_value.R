#' Impute values to a replacement value if a condition is true
#'
#' @param df A data frame
#' @param impute_col A character vector specifying the column to perform imputation.
#' @param condition A logical condition.
#' @param replacement The replacement value if condition is true.
#'
#' @return A data frame. The selected columns subsetted by var_affix contain changed values
#' given the condition and replacement values.
#' @export
#'
#' @examples
#' impute_value(df = iris, impute_col = "Species", condition = iris$species == "setosa", replacement = "Setosa")
impute_value <- function(df,
                         impute_col,
                         condition,
                         replacement) {

  # Handle case when column is a factor column and replacement is not a factor level.
  df[[impute_col]] <- as.character(df[[impute_col]])

  df[[impute_col]][eval(quote(condition))] <- replacement

  return(df)
}

