FROM rocker/shiny:4.2.1
RUN install2.r rsconnect tibble dplyr stringr rtweet htmltools lubridate bslib reactable readxl
WORKDIR /home/shinytweet
COPY app.R app.R
COPY data.xlsx data.xlsx
COPY deploy.R deploy.R
CMD Rscript deploy.R