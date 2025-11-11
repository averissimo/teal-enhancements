# Topic 5
#
# Task 1: Create a `teal_data` object
# * load `teal.data`
# * create a `teal_data` object named `basic_data` that bundles the built-in `iris` and `mtcars` datasets
# * inspect the resulting object with `print()` and `get_code()`


# Task 2:
# * use `teal_data()` together with `within()` (or an equivalent approach) to
#   construct an object named `tracked_data`.
# * make at least one transformation to each dataset (e.g., convert a column
#   to a factor, create a derived variable).
# * confirm that `get_code(tracked_data)` records the transformation steps.


# Task 3:
# Tasks:
# * generate synthetic CDISC-like `ADSL` and `ADAE` datasets (or reuse code
#   from Exercise 1/2 with CDISC-style column names).
# * build a `cdisc_data` object named `clinical_data`.
# * use `join_keys(clinical_data)` to inspect automatically inferred join keys.
# * verify that all `ADAE` subjects can be matched to `ADSL`.


# Task 4: Recreate CDISC join keys manually with `teal_data`
# * load the `pharmaverseadam` package and pull the datasets `adsl`, `adae`,
#   and `adtte`.
# * build a single `teal_data` object named `adam_manual` containing those
#   three datasets.
# * fefine custom join keys that mimic the automatic CDISC relationships:
#     - `ADSL` -> `ADAE` on `c("STUDYID", "USUBJID")`
#     - `ADSL` -> `ADTTE` on `c("STUDYID", "USUBJID")`
#     - Optionally add subject-level self keys for each table if helpful.
# * assign the custom keys with `join_keys(adam_manual) <- ...`.
# * confirm the structure by printing the join keys.
