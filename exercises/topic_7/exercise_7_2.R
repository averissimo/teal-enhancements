library(teal)
library(dplyr)
library(ggplot2)

my_custom_module_ui <- function(id) {
  ns <- NS(id)
  tags$div(
    # Exercise 7.2: Add reporter UI for binwidth ------------------------------

    # -------------------------------------------------------------------------
    selectInput( # variable selector
      inputId = ns("variable"),
      label = "Select variable",
      choices = NULL # initialize empty - to be updated from within server
    ),
    sliderInput(
      inputId = ns("binwidth"),
      label = "binwidth",
      min = 1,
      max = 10,
      step = 1,
      value = 3
    ),
    plotOutput(ns("plot")) # Output for the plot
  )
}
# Exercise 7.2: Add slider UI for binwidth ------------------------------------
#  - Update server arguments with reporter and filter_panel_api
#  - check if filter_panel_api is provided
my_custom_module_srv <- function(id, data) {
  moduleServer(id, function(input, output, session) {

# -----------------------------------------------------------------------------
    updateSelectInput( # update variable selector by names of data
      inputId = "variable",
      choices = data()[["ADSL"]] |> select(where(is.numeric)) |> names()
    )

    # add plot call to qenv
    result <- reactive({
      req(input$variable)
      req(input$binwidth)
      within(
        data(),
        {
          plot <- ggplot(ADSL, aes(x = input_var)) +
            geom_histogram(binwidth = input_binwidth)
          plot
        },
        input_var = as.name(input$variable), # Pass the selected variable as a symbol
        input_binwidth = input$binwidth
      )
    })

    # render to output the object from qenv
    output$plot <- renderPlot(result()[["plot"]])

    # Exercise 7.2: Add report generation -------------------------------------
    #  - Create `card_fun` function that is used to add card to reporter
    #  - Call `simple_reporter_srv`
    card_fun <- function(card = teal.reporter::ReportCard$new(), comment) {
      card$set_name("My custom module")
      card$append_text(filter_panel_api$get_filter_state(), "verbatim")
      card$append_text(paste("Selected var:", input$variable))
      card$append_text(paste("Selected binwidth:", input$binwidth))
      card$append_plot(result()$plot)
    }
    teal.reporter::simple_reporter_srv(
      id = "reporter",
      reporter = reporter,
      card_fun = card_fun
    )
    # -------------------------------------------------------------------------

    result
  })
}

my_custom_module <- module(
  label = "My Custom Module",
  ui = my_custom_module_ui,
  server = my_custom_module_srv
)

data <- teal_data()
data <- within(data, {
  ADSL <- pharmaverseadam::adsl
})

app <- init(
  data = data,
  modules = list(my_custom_module)
)

shinyApp(app$ui, app$server)
