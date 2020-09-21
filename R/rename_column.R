#' Rename column
#'
#' @param df A data frame
#' @param old_name Original column name. Single element character vector.
#' @param new_name New column name. Single element character vector.
#'
#' @return A data frame with renamed column.
#' @export
#'
#' @examples
#' rename_column(iris, "Species", "species")
rename_column <- function(df, old_name, new_name){
  names(df)[names(df) == old_name] <- new_name
  return(df)
}


# colnames(redcap_data$REDCAP_ECHO_EARLY_CHILDHOOD)[which(names(redcap_data$REDCAP_ECHO_EARLY_CHILDHOOD) == "record_id")] <- "idmaternal"
