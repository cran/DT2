## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE,
  warning = FALSE
)
library(DT2)

## -----------------------------------------------------------------------------
# Just works — Bootstrap 5, Jost font, striped, compact
dt2(iris)

## -----------------------------------------------------------------------------
# Responsive is ON by default — table fills the container
dt2(mtcars[1:10, ])

## -----------------------------------------------------------------------------
dt2(iris, responsive = FALSE)

## -----------------------------------------------------------------------------
dt2(iris, striped = FALSE, hover = FALSE, font_scale = 1.0)

## -----------------------------------------------------------------------------
dt2(iris, theme = "minimal", options = list(pageLength = 5))

## -----------------------------------------------------------------------------
my_theme <- dt2_theme("clean", compact = TRUE, font_scale = 0.80)
my_theme

## -----------------------------------------------------------------------------
dt2(iris[1:10, ], theme = my_theme)

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  pageLength = 5,
  layout = list(
    topStart    = "search",
    topEnd      = "pageLength",
    bottomStart = "paging",
    bottomEnd   = "info"
  )
))

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  pageLength = 5,
  layout = list(
    topStart  = NULL,         # remove page length selector
    bottomEnd = "paging"      # keep only pagination
  )
))

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  pageLength = 5,
  layout = list(
    topStart = list("pageLength", "info"),
    topEnd   = "search",
    bottomEnd = "paging"
  )
))

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  pageLength = 5,
  layout = list(
    topEnd = list(search = list(placeholder = "Type to filter..."))
  )
))

## -----------------------------------------------------------------------------
dt2(mtcars[1:15, ], options = list(
  pageLength = 8,
  buttons = list("copy", "csv", "excel"),
  layout  = list(topEnd = "buttons")
))

## -----------------------------------------------------------------------------
opts <- dt2_use_buttons(
  buttons  = c("copy", "csv", "excel", "pdf", "print"),
  position = "topEnd"
)
dt2(iris[1:20, ], options = opts)

## -----------------------------------------------------------------------------
dt2(iris[1:20, ], options = list(
  pageLength = 10,
  buttons = list("copy", "csv", "excel"),
  layout = list(
    topStart = "buttons",
    topEnd   = list(search = list(placeholder = "Filter...")),
    bottomEnd = "paging"
  )
))

## -----------------------------------------------------------------------------
dt2(iris[1:20, ], options = list(
  pageLength = 10,
  layout = list(
    topEnd = list(
      buttons = list(
        list(extend = "collection", text = "Export",
             buttons = list("copyHtml5", "csvHtml5", "excelHtml5", "pdfHtml5")),
        list(extend = "spacer", style = "bar"),
        "print",
        list(extend = "spacer", style = "bar"),
        list(extend = "colvis", text = "Columns")
      )
    )
  )
))

## -----------------------------------------------------------------------------
dt2(iris[1:20, ], options = list(
  pageLength = 10,
  layout = list(
    topEnd = list(
      buttons = list(
        "copy", "csv", "excel",
        list(extend = "spacer", style = "bar"),
        list(extend = "colvis", text = "Columns")
      )
    )
  )
))

## -----------------------------------------------------------------------------
dt2(mtcars[1:10, ], options = list(
  buttons = list("copy", "csv"),
  layout  = list(
    topEnd      = "search",
    bottomStart = "buttons",
    bottomEnd   = "paging"
  )
))

## -----------------------------------------------------------------------------
# Primary blue buttons
dt2(iris[1:10, ],
    button_class = "btn btn-sm btn-primary",
    options = list(
      buttons = list("copy", "csv", "excel"),
      layout = list(topEnd = "buttons")
    ))

## -----------------------------------------------------------------------------
opts <- dt2_use_buttons(
  buttons = c("copy", "csv", "excel"),
  button_class = "btn btn-sm btn-outline-dark"
)
dt2(iris[1:10, ], options = opts)

## -----------------------------------------------------------------------------
# Default pagination — compact, themed by Bootstrap
dt2(iris)

## -----------------------------------------------------------------------------
dt2(iris[1:10, ], options = list(
  paging = FALSE
))

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  layout = list(
    bottomEnd = list(paging = list(
      type = "simple"
    ))
  )
))

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  layout = list(
    bottomEnd = list(paging = list(
      numbers   = FALSE,
      firstLast = TRUE
    ))
  )
))

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  layout = list(
    bottomEnd = list(paging = list(
      buttons = 3
    ))
  )
))

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  layout = list(
    bottomEnd = list(paging = list(
      boundaryNumbers = FALSE
    ))
  )
))

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  layout = list(
    bottomEnd = list(paging = list(
      firstLast    = TRUE,
      previousNext = TRUE,
      numbers      = TRUE
    ))
  )
))

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  layout = list(
    bottomStart = "paging",
    bottomEnd   = "info"
  )
))

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  scroller  = TRUE,
  scrollY   = 300,         # viewport height in pixels
  paging    = TRUE         # required for Scroller
))

## -----------------------------------------------------------------------------
big <- data.frame(
  id    = 1:5000,
  value = round(rnorm(5000), 3),
  group = sample(LETTERS[1:5], 5000, replace = TRUE)
)
dt2(big, options = list(
  scroller    = TRUE,
  scrollY     = 400,
  deferRender = TRUE     # improves performance: renders rows on demand
))

## -----------------------------------------------------------------------------
dt2(big, options = list(
  scroller    = TRUE,
  scrollY     = 350,
  deferRender = TRUE,
  buttons     = list("copy", "csv", "excel"),
  layout      = list(
    topEnd    = "buttons",
    topStart  = list(search = list(placeholder = "Search..."))
  )
))

## -----------------------------------------------------------------------------
opts <- list(columns = names(mtcars))
opts <- dt2_format_number(opts, "hp", thousands = ",", digits = 0)
opts <- dt2_format_number(opts, "wt", digits = 2, prefix_right = " tons")
dt2(mtcars[1:10, ], options = opts)

## -----------------------------------------------------------------------------
df <- data.frame(
  city   = c("São Paulo", "Recife", "NYC", "Tokyo"),
  pop    = c(12.33e6, 1.65e6, 8.34e6, 13.96e6),
  budget = c(6.5e10, 4.2e9, 1.07e11, 7.36e10)
)
opts <- list(columns = names(df))
opts <- dt2_format_number_abbrev(opts, c("pop", "budget"),
                                  digits = 1, locale = "pt-BR")
dt2(df, options = opts)

## -----------------------------------------------------------------------------
dt2(iris, options = list(
  pageLength = 5,
  searching  = TRUE,
  ordering   = TRUE,
  language   = list(search = "Filter:", info = "_TOTAL_ rows")
))

## -----------------------------------------------------------------------------
library(jsonlite)
library(dplyr)
library(tibble)
library(lubridate)
library(DT2)
library(htmlwidgets)

# ── Flag sprite CSS (carregado via dependency para garantir que entra no HTML) ──
flag_dep <- htmltools::htmlDependency(
  name = "world-flags-sprite",
  version = "0.0.1",
  head = '<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lafeber/world-flags-sprite/stylesheets/flags32-both.css">',
  src = c(href = ".")
)

# ── Dados ─────────────────────────────────────────────────────────────────────
json_txt <- '{
  "data": [
    {"name":"Tiger Nixon","position":"System Architect","salary":"320800","start_date":"2011-04-25","office":"Edinburgh","extn":"5421"},
    {"name":"Garrett Winters","position":"Accountant","salary":"170750","start_date":"2011-07-25","office":"Tokyo","extn":"8422"},
    {"name":"Ashton Cox","position":"Junior Technical Author","salary":"86000","start_date":"2009-01-12","office":"San Francisco","extn":"1562"},
    {"name":"Cedric Kelly","position":"Senior JavaScript Developer","salary":"433060","start_date":"2012-03-29","office":"Edinburgh","extn":"6224"},
    {"name":"Airi Satou","position":"Accountant","salary":"162700","start_date":"2008-11-28","office":"Tokyo","extn":"5407"},
    {"name":"Brielle Williamson","position":"Integration Specialist","salary":"372000","start_date":"2012-12-02","office":"New York","extn":"4804"},
    {"name":"Herrod Chandler","position":"Sales Assistant","salary":"137500","start_date":"2012-08-06","office":"San Francisco","extn":"9608"},
    {"name":"Rhona Davidson","position":"Integration Specialist","salary":"327900","start_date":"2010-10-14","office":"Tokyo","extn":"6200"},
    {"name":"Colleen Hurst","position":"JavaScript Developer","salary":"205500","start_date":"2009-09-15","office":"San Francisco","extn":"2360"},
    {"name":"Sonya Frost","position":"Software Engineer","salary":"103600","start_date":"2008-12-13","office":"Edinburgh","extn":"1667"}
  ]
}'

df <- fromJSON(json_txt, flatten = TRUE)$data %>%
  as_tibble() %>%
  mutate(
    salary     = as.numeric(salary),
    extn       = as.integer(extn),
    start_date = ymd(start_date)
  )

# ── JS Renderers ──────────────────────────────────────────────────────────────
office_js <- JS("
  function(data, type) {
    if (type !== 'display') return data;
    var cc = {Argentina:'ar', Edinburgh:'_Scotland', London:'_England',
              'New York':'us', 'San Francisco':'us', Sydney:'au', Tokyo:'jp'};
    return '<span class=\"flag ' + (cc[data]||'') + '\"></span> ' + data;
  }
")

salary_js <- JS("
  (function() {
    var nfmt = DataTable.render.number('.', ',', 2, 'R$ ');
    return function(data, type) {
      var txt = nfmt.display(data);
      if (type !== 'display') return txt;
      var c = data < 250000 ? 'red' : data < 500000 ? 'orange' : 'green';
      return '<span style=\"color:' + c + '\">' + txt + '</span>';
    };
  })()
")

extn_js <- JS("
  function(data, type) {
    return type === 'display'
      ? '<progress value=\"' + data + '\" max=\"9999\"></progress>'
      : data;
  }
")

# ── Tabela ────────────────────────────────────────────────────────────────────
w <- dt2(df,
  compact    = TRUE,
  striped    = TRUE,
  hover      = TRUE,
  font_scale = 0.85,
  responsive = FALSE,
  options    = list(
    pageLength = 10,
    lengthMenu = c(5, 10, 25, -1),
    columns    = names(df),
    scrollX = TRUE,  
    layout = list(
      topStart = "pageLength",
      topEnd   = list(
        buttons = list(
          list(extend = "copyHtml5", text = "Copiar"),
          list(extend = "csvHtml5"),
          list(extend = "excelHtml5"),
          list(extend = "spacer", style = "bar"),
          list(extend = "colvis", text = "Colunas")
        ),
        search = list(placeholder = "")
      ),
      bottomEnd = list(paging = list(numbers = FALSE))
    ),

    columnControl = list(
      target  = 0,
      content = list("order", "searchDropdown", list(
        list(extend = "orderAsc",       text = "Ordem crescente"),
        list(extend = "orderDesc",      text = "Ordem decrescente"),
        "spacer",
        list(extend = "colVisDropdown", text = "Selecionar colunas")
      ))
    ),
    ordering = list(indicators = FALSE, handler = FALSE),

    columnDefs = list(
      list(targets = which(names(df) == "office") - 1L,
           className = "f32", render = office_js),
      list(targets = which(names(df) == "salary") - 1L,
           className = "dt-body-right", render = salary_js),
      list(targets = which(names(df) == "extn") - 1L,
           render = extn_js)
    ),

    language = list(
      lengthMenu   = "Mostrar _MENU_",
      search       = "Buscar",
      info         = "Mostrando _START_ a _END_ de _TOTAL_ registros",
      infoEmpty    = "Nenhum registro",
      zeroRecords  = "Nenhum registro encontrado",
      emptyTable   = "Nenhum dado disponível",
      decimal      = ",", thousands = ".", infoThousands = ".",
      lengthLabels = list(`10` = "10", `25` = "25", `-1` = "Todas"),
      paginate     = list(first = "«", previous = "‹", `next` = "›", last = "»"),
      buttons = list(
        copyTitle   = "Copiado!",
        copySuccess = list(`_` = "%d linhas copiadas", `1` = "1 linha copiada")
      ),
      columnControl = list(
        orderAsc = "Crescente", orderDesc = "Decrescente",
        searchDropdown = "Pesquisar", colVisDropdown = "Colunas",
        searchClear = "Limpar",
        search = list(
          text   = list(contains = "Contém", starts = "Começa por",
                        ends = "Termina em", equal = "Igual a"),
          number = list(greater = "Maior que", less = "Menor que",
                        equal = "Igual a")
        )
      )
    )
  )
)

# Anexa a dependency do flag sprite ao widget
w$dependencies <- c(w$dependencies, list(flag_dep))
w

