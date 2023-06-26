# load packages for shiny app
library(shiny)
library(dplyr)
library(reactable)
library(bslib)
library(htmltools)
library(lubridate)
library(readxl)

# ui <- fluidPage(
# #titlePanel('Grace Point International Christian Center'),
#   theme=bs_theme(version = 5,
#   bootswatch = "cerulean",
#   #primary = "#12a79d",
#   primary='#375a7f',
#   ),
# navbarPage(title = 'Grace Point International Christian Center',
# tabPanel(title = 'Video Recording',
# reactable::reactableOutput("table_output")),
# tabPanel(title = 'Audio Recording',
#   reactable::reactableOutput("audio"))))

# Define UI ----
ui <- navbarPage(

  # define title
  title = "Grace Point International Christian Center",

  # add theme
  theme = bs_theme(version = 5,
                   bootswatch = "cerulean",
                   primary = "#375a7f",
                   ),

  #"#12a79d"

  # add in table
  tabPanel("", reactable::reactableOutput("table_output"))

)



# Server

# read in data
#likes <- readRDS('likes.rds')
likes <- read_excel(here::here('data.xlsx')) %>%
  mutate(Date = rtweet:::format_date(Date),
         Date = as.Date(Date)) %>%
  group_by(Date) %>%
  arrange(desc(Date))


# Define server logic  ----
server <- function(input, output) {

  output$table_output = reactable::renderReactable({

    # create table
    reactable::reactable(likes,
                         columns = list(
                           # define date
                           Date = colDef(
                             align = "center",
                             minWidth = 60,),
                           # define user
                           Minister = colDef(align = 'center',minWidth = 60),
                             #cell = function(Minister) {
                              # htmltools::tags$a(href = paste0("https://twitter.com/", as.character(Minister)),
                               #                  target = "_blank", paste0("@",Minister))},
                             #minWidth = 60),
                           # define tweet text
                           `Title of the Message` = colDef(
                             align = "left",
                             minWidth = 120),
                           # define tweet url
                           YouTubeLink = colDef(
                             cell = function(YouTubeLink) {
                               htmltools::tags$a(href = as.character(YouTubeLink),
                                                 target = "_blank", as.character(YouTubeLink))})),
                           # define external link
                          # Link = colDef(
                            # cell = function(Link) {
                             #  htmltools::tags$a(href = as.character(Link),
                              #                   target = "_blank", as.character(Link))})
                        # ),
                         # additional table options
                         searchable = TRUE,
                         striped = TRUE,
                         defaultPageSize = 8)
  })
}


shinyApp(ui,server)
