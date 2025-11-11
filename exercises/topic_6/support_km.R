library(teal.data)
library(teal.modules.clinical)
library(teal.transform)

data_km <- teal_data() |>
  within({
  ADSL <- pharmaverseadam::adsl

  ADSL$ARM <- as.factor(ADSL$ARM)
  ADSL$ARMCD <- as.factor(ADSL$ARMCD)
  ADSL$SEX <- as.factor(ADSL$SEX)
  ADSL$RACE <- as.factor(ADSL$RACE)

  ADTTE <- pharmaverseadam::adtte_onco
  ADTTE$ARM <- as.factor(ADTTE$ARM)
  ADTTE$ARMCD <- as.factor(ADTTE$ARMCD)
  ADTTE$AVALU = as.factor("DAYS")
})
join_keys(data_km) <- default_cdisc_join_keys[names(data_km)]

arm_ref_comp <- list(
  ACTARMCD = list(
    ref = "Pbo",
    comp = c("Xan_Hi", "Xan_Lo")
  ),
  ARM = list(
    ref = "Placebo",
    comp = c("Xanomeline High Dose", "Xanomeline Low Dose")
  )
)

app <- init(
  data = data_km,
  modules = modules(
    tm_g_km(
      label = "Kaplan-Meier Plot",
      dataname = "ADTTE",
      arm_var = choices_selected(
        variable_choices("ADSL", c("ARM", "ARMCD", "ACTARMCD")),
        "ARM"
      ),
      paramcd = choices_selected(
        value_choices("ADTTE", "PARAMCD", "PARAM"),
        "OS"
      ),
      arm_ref_comp = arm_ref_comp,
      strata_var = choices_selected(
        variable_choices("ADSL", c("SEX", "RACE")),
        "RACE"
      ),
      facet_var = choices_selected(
        variable_choices(ADSL, c("SEX", "RACE")),
        NULL
      )
    )
  )
)

shinyApp(ui = app$ui, server = app$server)