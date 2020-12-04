; highlights.scm

(preprocessor_directive) @preprocessor

"struct" @keyword
"if" @keyword
"else" @keyword
"switch" @keyword
"case" @keyword
(do_start) @keyword
"while" @keyword
"break" @keyword
"for" @keyword
(return) @keyword

(comment) @comment

(type_specifier) @type.builtin

(identifier) @identifier

(float) @number
(integer) @number
(hex) @number

(string_const) @string

"[" @punctuation.bracket
"]" @punctuation.bracket
"{" @punctuation.bracket
"}" @punctuation.bracket
"(" @punctuation.bracket
")" @punctuation.bracket

"=" @operator
"*" @operator
"/" @operator
"%" @operator
"+" @operator
"-" @operator
(sl) @operator
(sr) @operator
(usr) @operator
"<" @operator
">" @operator
(gteq) @operator
(lteq) @operator
(eq) @operator
(noteq) @operator
"&" @operator
"^" @operator
"|" @operator
(andand) @operator
(oror) @operator
"?" @operator
":" @operator
(assignment_operator) @operator
