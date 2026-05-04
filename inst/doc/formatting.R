## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  message = FALSE,
  warning = FALSE
)
library(DT2)

## -----------------------------------------------------------------------------
df <- data.frame(
  item   = c("Widget A", "Widget B", "Widget C"),
  price  = c(1234.5, 99999.99, 450.0),
  volume = c(1500000, 230000, 85000)
)

opts <- list(columns = names(df))
opts <- dt2_format_number(opts, "price",  thousands = ".", decimal = ",",
                           digits = 2, prefix = "R$ ")
opts <- dt2_format_number(opts, "volume", thousands = ",", digits = 0)
dt2(df, options = opts)

## -----------------------------------------------------------------------------
df <- data.frame(
  metric = c("Users", "Revenue", "Transactions", "API Calls"),
  value  = c(2.1e6, 850e3, 12.5e6, 3.7e9)
)
opts <- list(columns = names(df))
opts <- dt2_format_number_abbrev(opts, "value", digits = 1)
dt2(df, options = opts)

## -----------------------------------------------------------------------------
df <- data.frame(
  event = c("Launch", "Update", "Sunset"),
  date  = c("2025-01-15", "2025-06-20", "2025-12-31")
)
opts <- list(columns = names(df))
opts <- dt2_format_datetime(opts, "date", to = "DD/MM/YYYY")
dt2(df, options = opts)

## -----------------------------------------------------------------------------
df <- data.frame(
  action  = c("Login", "Upload", "Export", "Logout"),
  when    = format(Sys.time() - c(60, 3600*3, 86400*2, 15), "%Y-%m-%d %H:%M:%S")
)
opts <- list(columns = names(df))
opts <- dt2_format_time_relative(opts, "when", locale = "en")
dt2(df, options = opts)

## -----------------------------------------------------------------------------
# Traffic light renderer
traffic_light <- htmlwidgets::JS("
  function(data, type, row, meta) {
    if (type !== 'display') return data;
    var v = parseFloat(data);
    var color = v >= 80 ? '#198754' : (v >= 50 ? '#ffc107' : '#dc3545');
    return '<span style=\"display:inline-block;width:12px;height:12px;' +
           'border-radius:50%;background:' + color + ';margin-right:6px\">' +
           '</span>' + data + '%';
  }
")

df <- data.frame(
  server = c("web-01", "web-02", "db-01", "cache-01"),
  uptime = c(99.9, 87.3, 45.2, 100.0)
)
opts <- list(columns = names(df))
opts <- dt2_cols_render_js(opts, "uptime", traffic_light)
dt2(df, options = opts)

## -----------------------------------------------------------------------------
df <- data.frame(
  name   = c("Alice", "Bob", "Carol"),
  email  = c("alice@example.com", "bob@example.com", "carol@example.com"),
  score  = c(95, 82, 91)
)
opts <- list(columns = names(df))
opts <- dt2_col_template(opts, "email",
  '<a href="mailto:{{VAL}}">{{VAL}}</a>')
dt2(df, options = opts)

## ----eval=FALSE---------------------------------------------------------------
# opts <- dt2_cols_render_orthogonal(opts, "price",
#   display = htmlwidgets::JS("function(d) { return '$' + d.toFixed(2); }"),
#   sort    = htmlwidgets::JS("function(d) { return parseFloat(d); }")
# )

## -----------------------------------------------------------------------------
dt2_register_renderer("pct_bar", htmlwidgets::JS("
  function(data, type) {
    if (type !== 'display') return data;
    var pct = Math.min(100, Math.max(0, parseFloat(data)));
    return '<div style=\"background:#e9ecef;border-radius:3px;margin:6px\">' +
           '<div style=\"width:' + pct + '%;background:#0d6efd;height:10px;' +
           'border-radius:3px\"></div></div>';
  }
"))

df <- data.frame(task = c("A", "B", "C"), done = c(75, 40, 95))
opts <- list(columns = names(df))
opts <- dt2_use_renderer(opts, "done", "pct_bar")
dt2(df, options = opts)

