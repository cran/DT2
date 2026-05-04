## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE,
  warning = FALSE
)
library(DT2)

## -----------------------------------------------------------------------------
dt2_extensions()

## -----------------------------------------------------------------------------
dt2(mtcars[1:15, ], extensions = "Buttons", options = list(
  pageLength = 8,
  layout = list(
    topEnd = list(
      buttons = list("copy", "csv", "excel", "pdf", "print")
    )
  )
))

## -----------------------------------------------------------------------------
dt2(iris[1:20, ], options = list(
  pageLength = 10,
  layout = list(
    topStart = "pageLength",
    topEnd = list(
      buttons = list(
        list(extend = "collection", text = "Export",
             buttons = list(
               list(extend = "copyHtml5", text = "Copy"),
               list(extend = "csvHtml5"),
               list(extend = "excelHtml5", title = "My Data"),
               list(extend = "pdfHtml5",   title = "My Data")
             )),
        list(extend = "colvis", text = "Columns")
      ),
      search = list(placeholder = "Filter...")
    ),
    bottomEnd = "paging"
  )
))

## -----------------------------------------------------------------------------
dt2(iris[1:20, ], options = list(
  select = list(style = "os", items = "row"),
  pageLength = 10
))

## -----------------------------------------------------------------------------
dt2(iris, responsive = FALSE, options = list(pageLength = 5))

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  pageLength = 8,
  columnControl = list("order", "searchDropdown",
    list(
      list(extend = "orderAsc",  text = "Sort Ascending"),
      list(extend = "orderDesc", text = "Sort Descending"),
      "spacer",
      list(extend = "colVisDropdown", text = "Toggle Columns")
    )
  ),
  ordering = list(indicators = FALSE, handler = FALSE)
))

## ----eval=FALSE---------------------------------------------------------------
# dt2(iris, options = list(fixedHeader = TRUE, pageLength = 50))

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  pageLength = 8,
  select = list(style = "multi", items = "row"),
  layout = list(
    topEnd = list(
      buttons = list(
        list(extend = "selected",  text = "Selected Only"),
        list(extend = "selectAll", text = "Select All"),
        list(extend = "selectNone", text = "Deselect"),
        "spacer",
        list(extend = "csvHtml5", exportOptions = list(modifier = list(selected = TRUE)))
      )
    )
  ),
  columnControl = list("order", "searchDropdown"),
  ordering = list(indicators = FALSE, handler = FALSE)
))

