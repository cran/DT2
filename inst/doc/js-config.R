## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE,
  warning = FALSE
)
library(DT2)

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  pageLength = 25,
  ordering   = TRUE,
  language   = list(
    search     = "Filter:",
    lengthMenu = "Show _MENU_ entries"
  ),
  columnDefs = list(
    list(targets = 0, visible = FALSE),
    list(targets = c(1, 2), className = "text-center")
  )
))

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  pageLength = 5,
  layout = list(
    topStart = list(search = list(placeholder = "Filter...")),
    topEnd   = "pageLength"
  )
))

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  pageLength = 10,
  searching = FALSE,
  layout = list(
    topStart  = NULL,      # no page length selector
    topEnd    = NULL,      # no search box
    bottomStart = NULL,    # no info
    bottomEnd = "paging"   # only pagination
  )
))

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  pageLength = 5,
  layout = list(
    topStart  = list("pageLength", "info"),
    topEnd    = "search",
    bottomEnd = "paging"
  )
))

## -----------------------------------------------------------------------------
# Buttons on the left
dt2(iris[1:15, ], options = list(
  buttons = list("copy", "csv", "excel"),
  layout = list(
    topStart  = "buttons",
    topEnd    = "search",
    bottomEnd = "paging"
  )
))

## -----------------------------------------------------------------------------
# Buttons on the bottom
dt2(iris[1:15, ], options = list(
  buttons = list("copy", "csv"),
  layout = list(
    topEnd      = "search",
    bottomStart = "buttons",
    bottomEnd   = "paging"
  )
))

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  pageLength = 5,
  layout = list(
    topEnd = list(search = list(
      placeholder = "Type to filter...",
      text = "Search:"
    ))
  )
))

## -----------------------------------------------------------------------------
dt2(mtcars[1:20, ], options = list(
  pageLength = 10,
  buttons = list(
    list(extend = "collection", text = "Export \u25BC",
         buttons = list("copyHtml5", "csvHtml5", "excelHtml5")),
    list(extend = "colvis", text = "Columns")
  ),
  layout = list(
    topStart    = "buttons",
    topEnd      = list(search = list(placeholder = "Filter...")),
    bottomStart = "info",
    bottomEnd   = "paging"
  )
))

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  pageLength = 5,
  createdRow = htmlwidgets::JS("
    function(row, data, dataIndex) {
      if (data['Sepal.Length'] > 5) {
        row.style.backgroundColor = '#fff3cd';
      }
    }
  ")
))

## -----------------------------------------------------------------------------
dt2(mtcars[1:10, c("mpg", "hp", "wt")], options = list(
  columnDefs = list(
    list(
      targets = 0,
      render = htmlwidgets::JS("DataTable.render.number('.', ',', 1, '', ' mpg')")
    ),
    list(
      targets = 1,
      render = htmlwidgets::JS("DataTable.render.number(',', '.', 0, '', ' hp')")
    )
  )
))

## -----------------------------------------------------------------------------
progress_render <- htmlwidgets::JS("
  function(data, type, row, meta) {
    if (type !== 'display') return data;
    var pct = Math.min(100, Math.max(0, parseFloat(data)));
    var color = pct > 70 ? '#198754' : (pct > 40 ? '#ffc107' : '#dc3545');
    return '<div style=\"background:#eee;border-radius:4px;overflow:hidden\">' +
           '<div style=\"width:' + pct + '%;background:' + color +
           ';height:14px;border-radius:4px\"></div></div>';
  }
")

df <- data.frame(
  task     = c("Design", "Backend", "Testing", "Deploy"),
  progress = c(85, 60, 30, 95)
)

dt2(df, options = list(
  pageLength = 10,
  columnDefs = list(
    list(targets = 1, render = progress_render)
  )
))

## -----------------------------------------------------------------------------
dt2(iris[1:10, ], options = list(
  pageLength = 5,
  language = list(
    search       = "Buscar:",
    lengthMenu   = "Mostrar _MENU_ registros",
    info         = "Mostrando _START_ a _END_ de _TOTAL_",
    paginate     = list(
      first    = "<<",
      previous = "<",
      `next`   = ">",
      last     = ">>"
    ),
    zeroRecords  = "Nenhum registro encontrado",
    emptyTable   = "Tabela vazia"
  )
))

