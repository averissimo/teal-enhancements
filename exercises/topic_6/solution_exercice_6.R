library(dplyr)
library(forcats)
library(teal.transform)
library(teal.modules.clinical)

data <- teal_data()
data <- within(data, {
  ADSL <- pharmaverseadam::adsl

  ADSL$ARM <- as.factor(ADSL$ARM)
  ADSL$ARMCD <- as.factor(ADSL$ARMCD)
  ADSL$ACTARMCD <- as.factor(ADSL$ACTARMCD)

  ADLB <- pharmaverseadam::adlb %>%
    mutate(
      AVISIT = as.factor(AVISIT),
      AVISIT == fct_reorder(AVISIT, AVISITN, min),
      AVALU = "DAYS"
    )

  ADLB$ARM <- as.factor(ADLB$ARM)
  ADLB$ARMCD <- as.factor(ADLB$ARMCD)
  ADLB$ACTARMCD <- as.factor(ADLB$ACTARMCD)
})
join_keys(data) <- default_cdisc_join_keys[names(data)]

app <- init(
  data = data,
  modules = modules(
    tm_g_lineplot(
      label = "Line Plot",
      dataname = "ADLB",
      group_var = choices_selected(
        variable_choices("ADSL", c("ARM", "ARMCD", "ACTARMCD")),
        "ARM"
      ),
      y = choices_selected(
        variable_choices("ADLB", c("AVAL", "BASE", "CHG", "PCHG")),
        "AVAL"
      ),
      param = choices_selected(
        value_choices("ADLB", "PARAMCD", "PARAM"),
        "ALT"
      )
    )
  )
)
runApp(app)