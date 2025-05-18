parser grammar MiniCParser;

options {
    tokenVocab = MiniCLexer;
}

// -------------------- Programa --------------------
program         : classDecl+ EOF;

// -------------------- Clases --------------------
classDecl       : CLASS ID LBRACE classBody RBRACE;
classBody       : classMember*;

classMember     : varDecl
                | methodDecl;

// -------------------- Declaraciones --------------------
varDecl         : type ID (ASSIGN expr)? SEMICOLON;
methodDecl      : (type | VOID) ID LPAREN paramList? RPAREN block;

// -------------------- Parámetros --------------------
paramList       : param (COMMA param)*;
param           : type ID;

// -------------------- Tipos --------------------
type            : INT
                | DOUBLE
                | CHAR
                | BOOL
                | STRING
                | ID; // tipos definidos por el usuario (clases)

// -------------------- Sentencias --------------------
stmt            : block
                | varDecl
                | exprStmt
                | ifStmt
                | whileStmt
                | forStmt
                | returnStmt
                | breakStmt
                | readStmt
                | writeStmt;

block           : LBRACE stmt* RBRACE;

exprStmt        : expr? SEMICOLON;
ifStmt          : IF LPAREN expr RPAREN stmt (ELSE stmt)?;
whileStmt       : WHILE LPAREN expr RPAREN stmt;
forStmt         : FOR LPAREN exprStmt exprStmt expr? RPAREN stmt;
returnStmt      : RETURN expr? SEMICOLON;
breakStmt       : BREAK SEMICOLON;
readStmt        : READ LPAREN location RPAREN SEMICOLON;
writeStmt       : WRITE LPAREN expr RPAREN SEMICOLON;

// -------------------- Expresiones --------------------
expr            : assignExpr;

assignExpr      : location ASSIGN expr
                | orExpr;

orExpr          : andExpr ( '||' andExpr )*;
andExpr         : eqExpr ( '&&' eqExpr )*;
eqExpr          : relExpr ( (EQEQ | NOTEQ) relExpr )*;
relExpr         : addExpr ( (LESS | LESSEQ | GREATER | GREATEREQ) addExpr )*;
addExpr         : mulExpr ( (ADD | SUB) mulExpr )*;
mulExpr         : unaryExpr ( (MUL | DIV | MOD) unaryExpr )*;

unaryExpr       : (ADD | SUB | INCREMENT | DECREMENT) unaryExpr
                | primary;

primary         : literal
                | location
                | methodCall
                | LPAREN expr RPAREN;

// -------------------- Accesos y llamadas --------------------
location        : ID (LBRACK expr RBRACK)*;
methodCall      : ID LPAREN argList? RPAREN;
argList         : expr (COMMA expr)*;

// -------------------- Literales --------------------
literal         : INTCONST
                | DOUBLECONST
                | CHARCONST
                | STRINGCONST
                | TRUE
                | FALSE;