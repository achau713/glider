
#' Read in metadata from Redcap project via Redcap API
#'
#' @param uri A link to redcap server
#' @param token A string granting access to a REDCAP project via the REDCAP API
#' @param fields A string or a vector of strings. Indicates desired fields to query from REDCAP project.
#' @param forms A string or a vector of strings. Indicates desired forms to query from REDCAP project.
#' @param list_tokens A list of tokens granting accessing to multiple REDCAP projects via the REDCAP API
#'
#' @return A data frame containing metadata about a Redcap project. Four columns are returned:
#' field_name, form_name, field_label, and select_choices_or_calculations.
#' @export
#'
#' @examples pregnancy_metadata <- map(PregnancyTokens, ~ReadMetadata(token = .x, list_tokens = PregnancyTokens))
read_redcap_metadata <- function(uri,
                                 token,
                                 fields = NULL,
                                 forms = NULL,
                                 list_tokens = NULL) {

  # Exception Handling:
  # If API request successful, then no issue.
  # If API request unsuccessful, print error message but continue running the function (when using map function)
  output <- tryCatch({
    print(
      paste(
        names(Sys.getenv())[Sys.getenv() == token],
        "Metadata requested at:",
        Sys.time()
      )
    )

    # Read metadata
    REDCapR::redcap_metadata_read(
      redcap_uri = uri,
      token = token,
      fields = fields,
      forms = forms
    )$data  %>%
      select(field_name, form_name, field_label, select_choices_or_calculations)
  },

  error = function(e){
    print(paste("There is an error: ", e))
    # Print the name of the redcap project associated with the errors
    print(
      paste(
        "Unable to load data dictionary from:",
        names(list_tokens)[list_tokens == token]
      )
    )
  })
  return(output)
}
