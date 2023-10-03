; extends
(lexical_declaration
  (variable_declarator 
    (comment) @comment (#eq? @comment "/*sql*/")
    (template_string) @injection.content (#offset! @injection.content 1 0 0 0)))

(lexical_declaration
  (variable_declarator 
    (comment) @comment (#eq? @comment "/*html*/")
    (template_string) @injection.content (#offset! @injection.content 1 0 0 0)))
