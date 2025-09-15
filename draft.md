# Draft

## 1. Foreward

- what is this training about?
- a short description of the teal framework and its goals: exploratory data analysis

## 2. Prerequisites:

- a list of skills assumed to be available to the trainee: basic R proficiency, basic shiny proficiency

## 3. Launching `teal` applications.

- The simplest `teal` application to launch (`shinylive` example)
- `teal` application with a dummy module (`shinylive` example):
  - where the modules are shown in the UI
  - where is the filter panel
- `teal::init` and its parts (complex topic):
  - the data argument
  - the modules argument
  - additional modifiers for a `teal` application: adding footer, title, etc...

## 4. Understanding data in `teal`.

- `teal.data` as a vehicle for user data
- `cdisc_data` as a vehicle for structured ADaM data
- understanding `join_keys` (complex topic):
  - what is the purpose of `join_keys`
  - how to create `join_keys`
  - printing `join_keys` and seeing how the output
    matches what `join_keys` are supposed to do
  - how to pass `join_keys` to `teal.data`
- data preprocessing:
  - where should it happen - in separate functions or files
  - encapsulating data preprocessing in `teal.data`
- data flow in `teal` applications - from user's `teal.data`,
  through the filter panel, to the modules

## 5. Understanding how to launch modules from `teal.modules.general` and `teal.modules.clinical`.

- example of launching a `teal.modules.general` module (`shinylive`)
- more heavy duty example with multiple nested modules (`shinylive`)
- understanding `data_extract_spec` objects in the input to the modules
  - the selecting role of `select_spec`
  - the filtering role of `filter_spec`
  - `data_extract_spec` dictates how `teal.modules.general` modules
    process data (`shinylive` example)

## 6. Filter panel.

- the structure of the filter panel UI
- how do the filters in the filter panel work
- how to save filters and restore them
- providing filter state on the initial application launch
- understanding the coupled nature of filtering in the filter panel
  - filtering on a dataset filters out rows in datasets associated
    with it as well
  - hierarchical nature - filtering on a parent dataset filters out
    the child datasets as well

## 7. Report functionality.

- The structure of the UI:
  - Adding to the report
  - Previewing the report
  - Basic report edits: rearrange report cards
- Saving the report
- Importing the report

## 8. Bookmarking.

- What is bookmarking
- Bookmarking the state of the application:
  - What is bookmarked exactly
- Using the bookmark

## 9. Creating custom `teal` modules.

- The most basic `teal` module (`shinylive` example)
- `teal` module arguments (must have and optional)
- Analyzing a `teal.modules.general` module:
  - Data processing inside the `qenv` objects
  - Data merging using `data_extract_spec` objects
  - Support for `teal` reporting
  - Support for the reproducibility using `teal.data`
    and show R code
