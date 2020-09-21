#' Sort a data frame by column name
#'
#' @param df A data frame
#' @param lead_vars A vector of variable names. Variables are put at the beginning
#' and not included in the sorting operation.
#'
#' @return A data frame, sorted by column names and prefixed by lead_vars.
#' @export
#'
#' @examples
#' order_columns(hospital, c("patient_id", "hospital_id"))
order_columns <- function(df, lead_vars){
  df[, c(lead_vars, sort(setdiff(names(df), lead_vars)))]
}
