
library(rsconnect)

# a function to stop the script when one of the variables cannot be found
# and to strip quotation marks from the secrets when you supplied them
error_on_missing_name <- function(name) {
  var <- Sys.getenv(name, unset = NA)
  if(is.na(var)) {
    stop(paste0("cannot find ", name, " !"), call. = FALSE)
  }
  gsub("\"", "", var)
}

# Authenticate
rsconnect::setAccountInfo(name = error_on_missing_name("SHINY_ACC_NAME"),
               token = error_on_missing_name("AD0BBA3BCE373F69750D8230A9EB725F"),
               secret = error_on_missing_name("pThl9VZJg1nuKeyxB68VKfNvk1IqhjiO3ySMFp/d"))

#SHINY_ACC_NAME
#TOKEN
#SECRET

# Deploy
rsconnect::deployApp(appFiles = c("app.R", "data.xlsx"))













