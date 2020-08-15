#' Read in metadata from Redcap project via Redcap API
#'
#' @param uri A link to a Redcap server.
#' @param token A string that stores the API key which grants access to a REDCAP project.
#' @param fields A string or a vector of strings. Indicates desired fields to query from REDCAP project.
#' @param forms A string or a vector of strings. Indicates desired forms to query from REDCAP project.
#'
#' @return A data frame containing metadata for a Redcap project. Four columns are returned:
#' field_name, form_name, field_label, and select_choices_or_calculations.
#' @export
#'
#' @examples read_redcap_metadata(uri = "path/to/Redcap/API/Server", token = "NAME_OF_TOKEN_IN_RENVIRON")
#' mapply(read_redcap_metadata, token = get_environment_vars("^REDCAP"), uri = "path/to/Redcap/API/Server")
read_redcap_metadata <- function(uri,
                                 token_name,
                                 fields = NULL,
                                 forms = NULL) {

  redcap_server_name <- Sys.getenv(uri)
  api_token <- Sys.getenv(token_name)

  output <- tryCatch({
    print(
      paste(
        token_name,
        "metadata requested at:",
        Sys.time()
      )
    )

    # Read metadata
    REDCapR::redcap_metadata_read(
      redcap_uri = redcap_server_name,
      token = api_token,
      fields = fields,
      forms = forms
    )$data[, c("field_name", "form_name", "field_label", "select_choices_or_calculations")]
  },

  error = function(e){
    print(paste("There is an error: ", e))
    # Print the name of the redcap project associated with the errors
    print(
      paste(
        "Unable to load data dictionary from:",
        token_name
      )
    )
  })
  return(output)
}
