#' Impute a specified value to a replacement value if values of the rest of the row is NA
#'
#' @param data a data frame
#' @param impute_col column in data to perform imputation on. supply as character string
#' @param var_prefix character vector of shared variable name
#' @param vars_indices integer indices attached to var_prefix. Used to subset columns when
#' checking for NA values.
#'
#' @return a data frame. impute_col will have imputed values
#'
#' @examples
#' impute_value(m1_cesd, m1_cesd_sum_score, var_prefix = "m1_cesd", indices = cesd_indices, replacement = NA)
impute_value <- function(data,
                         impute_col,
                         var_prefix,
                         indices,
                         replacement = NA) {

  similar_vars <- generateSimilarVars(var_prefix, indices)

  impute_col <- enquo(impute_col)

  # check if all values in a row are NA
  data <-
    data %>%
    rowwise() %>%
    mutate(
      # create column of booleans. True if all entries in a row are NA. False otherwise.
      row_all_NA = all(is.na(c_across(matches(similar_vars)))),
      # Replace column based on value of row_all_NA column
      !!impute_col := ifelse(row_all_NA, replacement, !!impute_col)
    )

  return(data)
}

