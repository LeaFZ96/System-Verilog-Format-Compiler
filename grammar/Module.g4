grammar Module;

module_instantiation
    : module_identifier (parameter_value_assignment)? module_instance (',' module_instance )* ';'
    ;

module_identifier : identifier ;

parameter_value_assignment
   : '#' '(' list_of_parameter_assignments ')'
   ;

list_of_parameter_assignments
   : ordered_parameter_assignment (',' ordered_parameter_assignment)*
   | named_parameter_assignment (',' named_parameter_assignment)*
   ;

ordered_parameter_assignment
   : expression
   ;

named_parameter_assignment
   : '.' parameter_identifier '(' (expression)? ')'
   ;

parameter_identifier
   : identifier
   ;

module_instance
    : name_of_instance '(' list_of_port_connections ')'
    ;

list_of_port_connections
   : ordered_port_connection (',' ordered_port_connection)*
   | named_port_connection (',' named_port_connection)*
   ;

ordered_port_connection
   : attribute_instance* (expression)?
   ;

named_port_connection
   : attribute_instance* '.' port_identifier '(' (expression)? ')'
   ;

attribute_instance
   : '(' '*' attr_spec (',' attr_spec)* '*' ')'
   ;

attr_spec
   : attr_name '=' constant_expression
   | attr_name
   ;

port_identifier
   : identifier
   ;

attr_name
   : identifier
   ;

name_of_instance
   : module_instance_identifier (range_)?
   ;

module_instance_identifier
   : arrayed_identifier
   ;

simple_arrayed_identifier
   : Simple_identifier (range_)?
   ;

arrayed_identifier
   : simple_arrayed_identifier
   | escaped_arrayed_identifier
   ;

escaped_arrayed_identifier
   : Escaped_identifier (range_)?
   ;

range_
   : '[' msb_constant_expression ':' lsb_constant_expression ']'
   ;

msb_constant_expression
   : constant_expression
   ;

lsb_constant_expression
   : constant_expression
   ;

constant_expression
   : expression
   ;

expression
   : term (binary_operator attribute_instance* term | '?' attribute_instance* expression ':' term)*
   ;

term
   : unary_operator attribute_instance* primary
   | primary
   | String
   ;

primary
   : number
   | hierarchical_identifier
   | hierarchical_identifier ('[' expression ']') +
   | hierarchical_identifier ('[' expression ']') + '[' range_expression ']'
   | hierarchical_identifier '[' range_expression ']'
   | concatenation
   | multiple_concatenation
   | function_call
   | system_function_call
   | constant_function_call
   | '(' mintypmax_expression ')'
   ;

mintypmax_expression
   : expression (':' expression ':' expression)?
   ;

constant_function_call
   : function_identifier attribute_instance* '(' (constant_expression (',' constant_expression)*)? ')'
   ;

function_identifier
   : identifier
   ;

system_function_call
   : system_function_identifier (expression (',' expression)*)?
   ;

system_function_identifier
   : Dollar_Identifier
   ;

concatenation
   : '{' expression (',' expression)* '}'
   ;

multiple_concatenation
   : '{' constant_expression concatenation '}'
   ;

function_call
   : hierarchical_function_identifier attribute_instance* '(' (expression (',' expression)*)? ')'
   ;

hierarchical_function_identifier
   : hierarchical_identifier
   ;

range_expression
   : expression
   | msb_constant_expression ':' lsb_constant_expression
   | base_expression '+:' width_constant_expression
   | base_expression '-:' width_constant_expression
   ;

base_expression
   : expression
   ;

width_constant_expression
   : constant_expression
   ;

hierarchical_identifier
   : simple_hierarchical_identifier
   | escaped_hierarchical_identifier
   ;

escaped_hierarchical_identifier
   : escaped_hierarchical_branch ('.' simple_hierarchical_branch | '.' escaped_hierarchical_branch)*
   ;

escaped_hierarchical_branch
   : Escaped_identifier ('[' Decimal_number ']')? ('.' Escaped_identifier ('[' Decimal_number ']')?)*
   ;

simple_hierarchical_identifier
   : simple_hierarchical_branch ('.' Escaped_identifier)?
   ;

simple_hierarchical_branch
   : Simple_identifier ('[' Decimal_number ']')? ('.' Simple_identifier ('[' Decimal_number ']')?)*
   ;

number
   : Decimal_number
   | Octal_number
   | Binary_number
   | Hex_number
   | Real_number
   ;

Real_number
   : Unsigned_number '.' Unsigned_number | Unsigned_number ('.' Unsigned_number)? [eE] ([+-])? Unsigned_number
   ;

Decimal_number
   : Unsigned_number | (Size)? Decimal_base Unsigned_number | (Size)? Decimal_base X_digit ('_')* | (Size)? Decimal_base Z_digit ('_')*
   ;

Binary_number
   : (Size)? Binary_base Binary_value
   ;

Octal_number
   : (Size)? Octal_base Octal_value
   ;

Hex_number
   : (Size)? Hex_base Hex_value
   ;

fragment Sign
   : [+-]
   ;

fragment Size
   : Non_zero_unsigned_number
   ;

fragment Non_zero_unsigned_number
   : Non_zero_decimal_digit ('_' | Decimal_digit)*
   ;


fragment Unsigned_number
   : Decimal_digit ('_' | Decimal_digit)*
   ;


fragment Binary_value
   : Binary_digit ('_' | Binary_digit)*
   ;


fragment Octal_value
   : Octal_digit ('_' | Octal_digit)*
   ;


fragment Hex_value
   : Hex_digit ('_' | Hex_digit)*
   ;


fragment Decimal_base
   : '\'' [sS]? [dD]
   ;

fragment Binary_base
   : '\'' [sS]? [bB]
   ;

fragment Octal_base
   : '\'' [sS]? [oO]
   ;

fragment Hex_base
   : '\'' [sS]? [hH]
   ;

fragment Non_zero_decimal_digit
   : [1-9]
   ;

fragment Decimal_digit
   : [0-9]
   ;

fragment Binary_digit
   : X_digit | Z_digit | [01]
   ;

fragment Octal_digit
   : X_digit | Z_digit | [0-7]
   ;

fragment Hex_digit
   : X_digit | Z_digit | [0-9a-fA-F]
   ;

fragment X_digit
   : [xX]
   ;

fragment Z_digit
   : [zZ?]
   ;

unary_operator
   : '+'
   | '-'
   | '!'
   | '~'
   | '&'
   | '~&'
   | '|'
   | '~|'
   | '^'
   | '~^'
   | '^~'
   ;

binary_operator
   : '+'
   | '-'
   | '*'
   | '/'
   | '%'
   | '=='
   | '!='
   | '==='
   | '!=='
   | '&&'
   | '||'
   | '**'
   | '<'
   | '<='
   | '>'
   | '>='
   | '&'
   | '|'
   | '^'
   | '^~'
   | '~^'
   | '>>'
   | '<<'
   | '>>>'
   | '<<<'
   ;

identifier 
    : Simple_identifier 
    | Escaped_identifier 
    ;

Simple_identifier 
    : [a-zA-Z_] [a-zA-Z0-9_$]* 
    ;

Escaped_identifier 
    : '\\' ('\u0021'..'\u007E')+ ~ [ \r\t\n]*
    ;

String
   : '"' (~ [\n\r])* '"'
   ;

Dollar_Identifier
   : '$' [a-zA-Z0-9_$] [a-zA-Z0-9_$]*
   ;

White_space
   : [ \t\n\r] + -> channel (HIDDEN)
   ;
   
One_line_comment
   : '//' .*? '\r'? '\n' -> channel (HIDDEN)
   ;

Block_comment
   : '/*' .*? '*/' -> channel (HIDDEN)
   ;