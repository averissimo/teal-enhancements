# Draft

## 1. Foreward

- What is this training about?
- A short description of the teal framework and its role in pharmaceutical and clinical research: exploratory data analysis and a foundation for reproducibility
- How `teal` fits with `shiny`

## 2. Prerequisites:

- a list of skills assumed to be available to the trainee: basic R proficiency, basic shiny proficiency

## 3. Launching `teal` applications.

- The simplest `teal` application to launch (`shinylive` example).
  `teal::init` with empty modules list.
- `teal` application with a dummy module (`shinylive` example):
  - where the modules are shown in the UI
  - where is the filter panel.
- `teal::init` and its parts (complex topic):
  - the data argument
  - the modules argument.
- Additional modifiers for a `teal` application: adding footer, header, etc...
- Troubleshooting common launch issues.

Learning objective: can launch and configure basic `teal` applications.

## 4. Understanding data in `teal`.

- `teal.data` as a vehicle for user data
- `cdisc_data` as a vehicle for structured ADaM data
- understanding `join_keys` (complex topic):
  - what is the purpose of `join_keys`
  - how to create `join_keys`
  - printing `join_keys` and seeing how the output
    matches what `join_keys` are supposed to do
  - how to pass `join_keys` to `teal.data`
  - recreating `join_keys` for a CDISC example
    (ADSL-ADAE)
- data preprocessing:
  - best practices
  - where should it happen - in separate functions or files
  - encapsulating data preprocessing in `teal.data`
- data flow in `teal` applications - from user's `teal.data`,
  through the filter panel, to the modules
- handling large datasets - performance considerations

Learning objectives: 
* understands `teal` data management and relationships
* can create their own `teal.data` objects with custom `join_keys`
  for CDISC data relationships

## 5. Understanding how to launch modules from `teal.modules.general` and `teal.modules.clinical`.

- example of launching a `teal.modules.general` module (`shinylive`)
- more heavy duty example with multiple nested modules (`shinylive`)
- understanding `data_extract_spec` objects in the input to the modules
  - the selecting role of `select_spec`
  - the filtering role of `filter_spec`
  - `data_extract_spec` dictates how `teal.modules.general` modules
    process data (`shinylive` example)

Learning objectives:
* can implement a `teal` application using pre-built modules
* can configure pre-built modules from `teal.modules.general`
  and `teal.modules.clinical`

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

Learning objectives:
* understands the relationship between the filter panel and data
  passed to modules
* can save and restore filtering states
* can launch a `teal` application with a custom filtering state

## 7. Report functionality.

- The structure of the UI:
  - Adding to the report
  - Previewing the report
  - Basic report edits: rearrange report cards
- Saving the report
- Investigating a saved `teal` report
- Importing the report

Learning objectives:
* Understands the role of the report in a `teal` application
* Can save and import a report

## 8. Bookmarking.

- What is bookmarking
- Bookmarking the state of the application:
  - What is bookmarked exactly
- Using the bookmark

Learning objectives:
* Understands what is bookmarked in a `teal` application

## 9. Creating custom `teal` modules.

- The most basic `teal` module (`shinylive` example)
- `teal` module arguments (must have and optional)
- Analyzing a `teal.modules.general` module:
  - Data processing inside the `qenv` objects
  - Data merging using `data_extract_spec` objects
  - Support for `teal` reporting
  - Support for the reproducibility using `teal.data`
    and show R code
- `qenv` objects as tools or reproducibility

Learning objectives:
* Can implement a basic custom `teal` module that integrates
  `teal.data` and `teal.code` objects for reproducibility