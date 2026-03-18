(macro_invocation
  macro: (scoped_identifier
    path: (identifier) @s (#eq? @s "sqlx")
    name: (identifier) @n (#match? @n "^query"))
  (token_tree
    (_
      (string_content) @injection.content (#set! injection.language "sql"))))
