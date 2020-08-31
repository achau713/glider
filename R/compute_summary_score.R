#' Compute sum and average scores
#'
#' @param df A data frame
#' @param id_affix A character vector of column(s) that uniquely identify a row
#' @param var_affix A string forming the variable name pattern. Specifies which columns to use to compute a score
#' @param score_name The name of the score variable
#' @param score_type The name of the score type. Currently supports: {average, sum}
#' @param suffix Informative suffix to append to variable name.
#'
#' @return A data frame with new column of subscale scores. The new column name is concatanation of score_name and "_score"
#' @export
#' @examples compute_summary_score(stress_questionnaire, var_affix = "physical_stress", score_name = "physical_stress_sum")

compute_summary_score <- function(df,
                                  id_affix,
                                  var_affix,
                                  score_name,
                                  score_type = "average",
                                  suffix = "_score") {
  # Append with informative suffix
  score_name <- paste0(score_name, suffix)

  # Create regex of id columns and summary columns
  id_measurement_cols <- paste0(id_affix, "|", var_affix)

  # Subset data frame to include id columns and measurement columns
  df <- subset_column(df, id_measurement_cols)

  # Subset data frame to include measurement columns
  df_measurement <- subset_column(df, var_affix)

  # compute average score
  if (score_type == "average"){
    df[[score_name]] <- rowMeans(df_measurement, na.rm = TRUE)
  }

  # compute sum score
  if (score_type == "sum"){
    df[[score_name]] <- rowSums(df_measurement, na.rm = TRUE)
  }

  return(df)

}
