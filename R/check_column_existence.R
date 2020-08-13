
#' Check if columns exist in a data frame
#'
#' @param df A data frame
#' @param col_names A vector of column names
#' @param list_df_name The name of a data frame when a list of data frames is supplied
#'
#' @return Boolean indicating if all column names exist in the data frame.
#' Otherwise, a message ascertaining non-existence of columns is displayed
#' @export
#'
#' @examples
#' check_column_existence(pedimet, c("BPM", "Average_IBI_(ms)"))
#' check_column_existence(pedimet, "...10")
#' purrr::walk2(pedimet_list, names(pedimet_list), ~checkColumnExistence(df = .x, list_df_name = .y))
check_column_existence <- function(df, col_names, list_df_name = NULL){

  # handle case when list of data frame is supplied
  if(!is.null(list_df_name)){
    df_name <- list_df_name
    # single data frame supplied
  } else{
    df_name <- deparse(substitute(df))
  }

  # logical vector indicating if column name exists in the data frame
  col_exists <- col_names %in% colnames(df)

  # display which column names do not exist in the data frame
  if(!all(col_exists)){
    cat(paste(col_names[!col_exists], "is not a column in", df_name, "\n"))
  }

  return(invisible(all(col_exists)))
}
