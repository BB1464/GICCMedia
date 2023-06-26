# Authenticate
setAccountInfo(name = Sys.getenv("SHINY_ACC_NAME"),
               token = Sys.getenv("TOKEN"),
               secret = Sys.getenv("SECRET"))
# Deploy
deployApp(appFiles = c("app.R", "data.xlsx"))




rsconnect::setAccountInfo(name='oluwafemioyedele',
                          token='AD0BBA3BCE373F69750D8230A9EB725F',
                          secret='pThl9VZJg1nuKeyxB68VKfNvk1IqhjiO3ySMFp/d')