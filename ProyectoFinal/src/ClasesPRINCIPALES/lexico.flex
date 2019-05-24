package practica1compi_200815565;

import java_cup.runtime.Symbol;
import java.util.LinkedList;
import JFlex.sym;
import javax.swing.DefaultListModel;

             
%%

%class lexico
%unicode
%cup
%line
%char
%column
%cupsym Symbol
%public
%full

%{
    
    StringBuffer string = new StringBuffer();
    
    private Symbol symbol(int type){

    return new Symbol(type, yyline, yycolumn);
    
    }
    
    private Symbol symbol(int type, Object value){
    
    return new Symbol(type, yyline, yycolumn);

    }
%}
    TerminacionLinea = \r|\n|\r\n
    caracter = [^\r\n]
    espacio = {TerminacionLinea}|[\t\f]

    

    Bloque = "/*" [^*] ~"*/" | "/*" "*"+ "/"
    ComentarioLinea  = "//" {caracter}*{TerminacionLinea}

    Identificador = [:jletter:]|[:jletter:][:jletterdigit:]*
    Entero = 0|[1-9][0-9]*
    Decimal = Entero"."Entero
    Cadenas = "\"" .+ "\""
 
%%

//<YYINITIAL> {espacio}          {/*no hace nada, aumenta una columna*/yychar++; }

<YYINITIAL> {TerminacionLinea}     {yychar=0; yyline=0}
<YYINITIAL>"int"		{  return new Symbol(Simbolo.INT, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"double"		{  return new Symbol(Simbolo.DOUBLE, yyline, yychar,  new String(yytext()));}		
<YYINITIAL>"String"		{  return new Symbol(Simbolo.STRING, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"if"                 {  return new Symbol(Simbolo.IF, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"switch"		{  return new Symbol(Simbolo.SWITCH, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"for"		{  return new Symbol(Simbolo.FOR, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"while"		{  return new Symbol(Simbolo.WHILE, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"do while"		{  return new Symbol(Simbolo.DWHILE, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"repeat"		{  return new Symbol(Simbolo.REPEAT, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"ConsoleWrite.line"  {  return new Symbol(Simbolo.CONSOLE, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"this"		{  return new Symbol(Simbolo.THIS, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"return"		{  return new Symbol(Simbolo.RETURN, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"break"		{  return new Symbol(Simbolo.BREAK, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"Public"		{  return new Symbol(Simbolo.PUBLIC, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"class"		{  return new Symbol(Simbolo.CLASS, yyline, yychar,  new String(yytext()));}


<YYINITIAL>"+"          	{  return new Symbol(Simbolo.MAS, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"-"                  {  return new Symbol(Simbolo.MENOS, yyline, yychar,  new String(yytext()));}		
<YYINITIAL>"*"                  {  return new Symbol(Simbolo.POR, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"/"                  {  return new Symbol(Simbolo.DIAGONAL, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"%"                  {  return new Symbol(Simbolo.DMODULAR, yyline, yychar,  new String(yytext()));}

<YYINITIAL>"=="                 {  return new Symbol(Simbolo.IGUALACION, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"!="                 {  return new Symbol(Simbolo.NEGACION, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"<"                  {  return new Symbol(Simbolo.MENORQ, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"<="                 {  return new Symbol(Simbolo.MENORIQ, yyline, yychar,  new String(yytext()));}
<YYINITIAL>">"                  {  return new Symbol(Simbolo.MAYORQ, yyline, yychar,  new String(yytext()));}
<YYINITIAL>">="                 {  return new Symbol(Simbolo.MAYORIQ, yyline, yychar,  new String(yytext()));}


<YYINITIAL>"&&"                 {  return new Symbol(Simbolo.AND, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"||"                 {  return new Symbol(Simbolo.OR, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"!"                  {  return new Symbol(Simbolo.ADMI, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"="                  {  return new Symbol(Simbolo.IGUAL, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"{"                  {  return new Symbol(Simbolo.LLAVEA, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"}"                  {  return new Symbol(Simbolo.LLAVEC, yyline, yychar,  new String(yytext()));}
<YYINITIAL>"("                  {  return new Symbol(Simbolo.PARA, yyline, yychar,  new String(yytext()));}
<YYINITIAL>")"                  {  return new Symbol(Simbolo.PARC, yyline, yychar,  new String(yytext()));}
<YYINITIAL>";"                  {  return new Symbol(Simbolo.PCOMA, yyline, yychar,  new String(yytext()));}

<YYINITIAL> {
{ComentarioLinea}               {  return new Symbol(Simbolo.COMENTARIOL, yyline, yychar,  new String(yytext()));}
{Bloque}                        {  return new Symbol(Simbolo.COMENTARIOB, yyline, yychar,  new String(yytext()));}
{Identificador}                 {  return new Symbol(Simbolo.IDENTIFICADOR, yyline, yychar,  new String(yytext()));}
{Entero}                        {  return new Symbol(Simbolo.ENTERO, yyline, yychar,  new String(yytext()));}
{Decimal}                       {  return new Symbol(Simbolo.DECIMAL, yyline, yychar,  new String(yytext()));}
{Cadenas}                       {  return new Symbol(Simbolo.CADENAS, yyline, yychar,  new String(yytext()));}
}
[\r]                            { return new Symbol(Simbolo.espacio, yyline, yychar,  new String(yytext()));}
[\n]                            { return new Symbol(Simbolo.linea, yyline, yychar,  new String(yytext()));}
[ \t\r\f\n]+                    {"son ignorados"}

.		        {

              System.out.println("error lexico en la fila "+yyline +" y en la columna " + yychar);
                DefaultListModel filas = new DefaultListModel();
              DefaultListModel columnas = new DefaultListModel();
            DefaultListModel carac = new DefaultListModel();
                filas.addElement(yyline);
                errores.jList2.setModel(filas);
                columnas.addElement(yychar);
                errores.jList3.setModel(columnas);
                carac.addElement(yytext());
                errores.jList1.setModel(carac);
                
//interfaz.rotular("error lexico :"+  yytext()+" en la fila "+yyline +" y en la columna " + yycolumn);

	          	}