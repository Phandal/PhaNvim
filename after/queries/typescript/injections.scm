; extends
(lexical_declaration
  (variable_declarator 
    (comment) @comment (#eq? @comment "/*sql*/")
    (template_string) @injection.content (#set! injection.language "sql")))

(return_statement
  (comment) @comment (#eq? @comment "/*sql*/")
  (template_string) @injection.content (#set! injection.language "sql"))

(lexical_declaration
  (variable_declarator 
    (comment) @comment (#eq? @comment "/* sql */")
    (template_string) @injection.content (#set! injection.language "sql")))

(return_statement
  (comment) @comment (#eq? @comment "/* sql */")
  (template_string) @injection.content (#set! injection.language "sql"))

(lexical_declaration
  (variable_declarator 
    (comment) @comment (#eq? @comment "/*html*/")
    (template_string) @injection.content (#set! injection.language "html")))

(return_statement
  (comment) @comment (#eq? @comment "/*html*/")
  (template_string) @injection.content (#set! injection.language "html"))
