# Launching `teal` applications.

## The Simplest `teal` Application

**Learning Objective:** Understand the minimal structure required to launch
a `teal` application and recognize the basic UI components.

The absolute simplest `teal` application requires just the `teal::init()` function
with just one module. This creates a `teal` application that demonstrates
the core UI structure without any additional functionality.

### The `teal` UI

When you launch this minimal application, you'll observe:

1. The `teal` header - displaying the application title
2. A main panel that shows our one empty module.
3. The filter panel on the left - ready to filter data (though no data is loaded yet)
4. The navigation structure - showing how `teal` organizes content

### Basic Structure

Every `teal` application follows this fundamental pattern:

- Initialization using `teal::init()`
- Data specification (must be specified)
- Modules definition (empty module in this case)
- Application launch using the usual Shiny API

### Code Example

```r
# Load the teal library
library(teal)

# Create the simplest possible teal application
app <- init(
  data = NULL,           # No data for this minimal example
  modules = modules()    # Empty modules list
)

# Launch the application
if (interactive()) {
  shiny::shinyApp(app$ui, app$server)
}
```

### What This Demonstrates

This minimal example shows you:

- The `teal` framework structure - even without modules, you can see how `teal` organizes the interface
- The filter panel - appears on the left side, ready to work with data when available
- The modular architecture - the list in the top left shows the module list (with just one module for now)
- The initialization pattern - `teal::init()` is the entry point for all `teal` applications

### Key Observations

1. The UI is responsive - the framework is fully functional even without much content.
2. This same pattern scales to complex applications - this training will use the same
   pattern throughout - passing data and modules to `teal::init`.

### Next Steps

While this minimal application doesn't do much, it establishes the foundation.
In the next section, we'll add a simple module to see how `teal` displays
content and how the different UI panels work together.

---

## Remaining Plan:

- `teal` application with a dummy module (`shinylive` example):
  - where the modules are shown in the UI
  - where is the filter panel.
- `teal::init` and its parts (complex topic):
  - the data argument
  - the modules argument.
- Additional modifiers for a `teal` application: adding footer, header, etc...
- Troubleshooting common launch issues.
