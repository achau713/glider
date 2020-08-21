
#' Checks for any NaN values in each column of a data frame
#'
#' Meant for use with logical subsetting to convert all NaN values in a data
#' frame to NA
#'
#' @param x A data frame
#'
#' @return A matrix of logical indicating if a entry is NaN
#' @export
#' @examples
#' df <- data.frame(a = c(NaN, 1, 2), b = c(1, 2, NaN))
#' is_nan(df)
is_nan <- function(x){
  do.call(cbind, lapply(x, is.nan))
}
