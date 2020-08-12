
#' Convert a factor type to a numeric type
#' levels() gets the factor levels as characters
#' as.numeric() converts the factor levels to numeric
#' subsetting the factor column by as.numeric(levels()) gives the numeric form of the factor column
#'
#' CAREFUL: THERE IS NO "INTUITIVE" CONVERSION FROM FACTOR TO NUMERIC. For example, as.numeric(as.factor(x)) gives unexpected results.
#'
#' @param x a column of factor type
#'
#' @return a column of numeric type
#'
#' @examples
convert_factor_to_numeric <- function(x) {
  as.numeric(levels(x))[x]
}
