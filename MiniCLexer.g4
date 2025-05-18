lexer grammar MiniCLexer;

// -------------------- Palabras clave --------------------
CLASS       : 'class';
VOID        : 'void';
IF          : 'if';
ELSE        : 'else';
WHILE       : 'while';
FOR         : 'for';
BREAK       : 'break';
RETURN      : 'return';
READ        : 'read';
WRITE       : 'write';
NEW         : 'new';
TRUE        : 'true';
FALSE       : 'false';

// -------------------- Tipos de datos --------------------
INT         : 'int';
CHAR        : 'char';
DOUBLE      : 'double';
BOOL        : 'bool';
STRING      : 'string';

// -------------------- Operadores --------------------
ASSIGN      : '=';
EQEQ        : '==';
NOTEQ       : '!=';
LESS        : '<';
LESSEQ      : '<=';
GREATER     : '>';
GREATEREQ   : '>=';

ADD         : '+';
SUB         : '-';
MUL         : '*';
DIV         : '/';
MOD         : '%';

INCREMENT   : '++';
DECREMENT   : '--';

OR      : '||';
AND     : '&&';

// -------------------- Puntuación --------------------
LPAREN      : '(';
RPAREN      : ')';
LBRACE      : '{';
RBRACE      : '}';
LBRACK      : '[';
RBRACK      : ']';
SEMICOLON   : ';';
COMMA       : ',';
DOT         : '.';

// -------------------- Literales --------------------
fragment DIGIT      : [0-9];
fragment LETTER     : [a-zA-Z];
fragment ESC_SEQ    : '\\' ( ['"\\ntbr] );

INTCONST    : DIGIT+;
DOUBLECONST : DIGIT+ '.' DIGIT+;
CHARCONST   : '\'' ( ~['\\\r\n] | ESC_SEQ ) '\'';
STRINGCONST : '"' ( ~["\\] | ESC_SEQ )* '"';

// -------------------- Identificadores --------------------
ID          : LETTER (LETTER | DIGIT | '_')*;

// -------------------- Comentarios y Espacios --------------------
COMMENT         : '/*' .*? '*/' -> skip;
LINE_COMMENT    : '//' ~[\r\n]* -> skip;
WS              : [ \t\r\n]+ -> skip;