#' Mutate column given a condition
#'
#' @param df A data frame
#' @param condition An anonymous Function that evaluates to a boolean.
#' @param pattern_condition_col A regex pattern that specifies the column to test the condition. As of now, limit
#' to only one condition column
#' @param replacement_value Replacement value if condition is true.
#' @param pattern_replacement_cols A regex pattern that specifies the columns to perform replacement
#'
#' @return A data frame
#' @export
#'
#' @examples
#' replace_on_condition(psi, condition = function(x) x == 12, pattern_condition_col = "_count_row_missing$",
#' replacement_value = NA, pattern_replacement_cols = "sum$|average$)
replace_on_condition <- function(df, condition, pattern_condition_col, replacement_value, pattern_replacement_cols){

  # column to check condition
  condition_col <- names(df)[grepl(names(df), pattern = pattern_condition_col)]

  if(length(condition_col) > 1){
    stop("Can only specific 1 condition column")
  }

  condition_col <- as.vector(df[,condition_col])

  # columns to replace values if condition is satisfied
  replacement_cols <- names(df)[grepl(names(df), pattern = pattern_replacement_cols)]

  for (col in replacement_cols){
    df[[col]] <- ifelse(condition(condition_col), replacement_value, df[[col]])
  }
  return(df)
}
