---
title: "eu-connect-2025-phuseR"
author: "Konrad Pagacz (konrad.pagacz@gmail.com)"
date: "2025-08-01"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Foreword

This is a draft of the workshops for the PHUSE EU Connect 2025 event.

The workshops lasts for 90 minutes, is intended for statistical programmers
as well as everyone else interested in learning about how `teal`
can help them with interactive data visualization for clinical trials.

All the code samples mentioned in the draft should be available via
the POSIT Cloud project.

## Draft

### Topic 1: Introduction to `teal` (5 minutes)

> TODO

* What is `teal`?
* What `teal` can be used for?
* What is the `teal` framework - other packages from the `teal` family.

### Topic 2: How to install the `teal` framework? (2 minutes)

> TODO

* Installation of `teal` and its dependencies - code samples

### Topic 3: Launching a simple `teal` application (7 minutes)

> ✅

* Launching a simple `teal` application - code samples
* Anatomy of a `teal` application - code samples:
  * `teal` data
  * `teal`

### Topic 4: Introduction to `teal.modules.clinical` and anatomy of a module (15 minutes)

> ✅

* What is `teal.modules.clinical`?
* Launching a simple `teal.modules.clinical` application - code samples
* Anatomy of a `teal.modules.clinical` module:
  * main output
  * encoding panel
  * filter panel
  * Show R Code button

### Topic 5: Deeper dive into how to provide and pre-process data in `teal.modules.clinical` (15 minutes)

> Partially covered (3 of the bullet points)

* How to provide data to a `teal` application? - code samples
* Introduction to `teal.data` in the context of the CDISC data standard
* Introduction to the concept of keys in `teal.data`
* Creating a custom `teal.data` object with custom user-defined keys - code samples
* Preprocessing data - code samples

Code samples should reuse the application code from the previous topic
to put the new information in the context of something already familiar.

We want to support the following scenarios that app developers face:
* providing custom non-CDISC data to a `teal.modules.clinical` application
* pre-processing data to create new variables, filter data or make summaries

### Topic 6: Deeper dive into customizing the parameters of `teal.modules.clinical` modules (10 minutes)

> TODO @averissimo -- But first rethink on this topic

* Introduction to `choices_selected` - code samples
* Parametrising `choices_selected` for different results:
  * `choices_selected` with `variable_choices` - code samples
  * `choices_selected` with delayed evaluation - code samples
  * `choices_selected` with eager evaluation and limited values - code samples
(* Introduction to `data_extract_spec` - I am hesitant on this one because
I received information the `data_extract_spec` will be reworked in the coming
months and also it's not widely used inside `teal.modules.clinical`).

Code samples should reuse the application code from the previous topic
to put the new information in the context of something already familiar.

We want to cover the following scenarios that app developers face:
* limiting the choices of variables in an input to a module
* providing choices to an input inside a module without knowing the dataset
(simulating dataset being downloaded from somewhere interactively)
* changing the dataset that is used by a module

### Topic 7: Creating custom `teal` modules (20 minutes)

> TODO @averissimo

* When to create a custom `teal` module?
* Creating a custom `teal` module:
  * UI function
  * Server function
  * Custom `teal` module arguments - `data`, `reporter`, filtering API

### Topic 8: Discussion and QA (what's left)

