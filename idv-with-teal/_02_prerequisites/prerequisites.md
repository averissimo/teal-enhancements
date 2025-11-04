# Installation & setup

## Step 1: Install core packages

```{webr}
#| eval: false
# Install the main teal package
install.packages("teal")

# Install commonly used module packages
install.packages(c(
  "teal.modules.general",    # General-purpose analysis modules
  "teal.modules.clinical",   # Clinical trial specific modules
  "teal.data",              # Data management utilities
  "teal.reporter"           # Report generation capabilities
))
```

## Step 2: Load required libraries

```{webr}
# Load core teal framework
library(teal)
library(teal.modules.general)
library(teal.data)

# For demonstration data
library(pharmaverseadam)

# Verify installation
cat("✅ teal framework loaded successfully!\n")
cat("📦 Available packages:\n")
cat("   - teal version:", as.character(packageVersion("teal")), "\n")
cat("   - teal.modules.general version:", as.character(packageVersion("teal.modules.general")), "\n")
cat("   - teal.data version:", as.character(packageVersion("teal.data")), "\n")
```

## Step 3: Verify installation with an example

```{webr}
# Create a simple test application
test_data <- teal_data()
test_data <- within(test_data, {
  IRIS <- iris
  MTCARS <- mtcars
})

# Simple test app
test_app <- teal::init(
  data = test_data,
  modules = teal::modules(
    tm_data_table(
      label = "Data Explorer",
      dataname = "IRIS"
    )
  )
) |> teal::modify_title("Installation Verification")

cat("✅ Test application created successfully!\n")
cat("🚀 Ready to start building teal applications!\n")
```
