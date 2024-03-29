***********************************************************************************************************************************************************
* Fun��o   : Executa()
* Objetivo : EXECUTAR COMANDO SQL E J� TRAZER O NOME DO CURSOR
***********************************************************************************************************************************************************
function executa
	lparameters comando, nomedest1, minuscula

	if type('minuscula') = "U"
		minuscula = .f.
	endif

	comando = strtran(comando, "CHAR(", "char(")
	comando = strtran(comando, "SMALLINT", "smallint")
	comando = strtran(comando, "(DD", "(dd")

	if type('nomedest1') = "C"
		m.retorno = sqlexec(handle, comando, nomedest1)
	else
		m.retorno = sqlexec(handle, comando)
	endif

	if m.retorno < 0
		return .f.
	else
		return .t.
	endif
ENDFUNC

***********************************************************************************************************************************************************
* Fun��o   : Aspas()
* Objetivo   : Colocar aspas(") no come�o e no final de uma string.
***********************************************************************************************************************************************************
function aspas
	param variavel

	if vartype(variavel) = "L"
		variavel = l2c(variavel)
	endif

	if isnull(variavel)
		return 'null'
	else
		if at("'",variavel) > 0
			variavel = strtran(alltrim(variavel),"'","''")
			return ['] + alltrim(variavel) + [']
		else
			return ['] + alltrim(variavel) + [']
		endif
	endif
ENDFUNC

***********************************************************************************************************************************************************
* Fun��o   : N2C()
* Objetivo   : Transformar n�mero em caracter para enviar ao SQL, evitando a repeti��o do comando ALLTRIM(STR()) - Number to Char
***********************************************************************************************************************************************************
function n2c
	para vnum
	if isnull(vnum) = .t.
		vnum = "NULL"
	else
		vnum = alltrim(str(vnum))
	endif
return vnum

*******************************************************************************************
* Fun��o   : logsql()
* Objetivo : Concatenar o objeto OPT c/ controlsource enviando ao SQL como 1(um) ou 0(zero)
*            ao inv�s de .t. e .f. .
*******************************************************************************************
function logsql
	param m.logico

	m.logico = iif(m.logico = .t.,'1','0')

	return m.logico
endfunc

*******************************************************************************************
* Fun��o   : busca_cep()
* Objetivo : Buscar CEP
*******************************************************************************************
function busca_cep
PARAM mcep
LOCAL loHTTP, lcResponse, lcUrl, loJson, oJSON, achoucep
	
	achoucep = .f.

	lcUrl = [https://viacep.com.br/ws/]+mcep+[/json/]

	loHTTP = CREATEOBJECT("Microsoft.XMLHTTP")
	oJSON = CREATEOBJECT("JSON")
	loHTTP.open("GET", lcUrl, .F.)
	loHTTP.send()

	lcResponse = loHTTP.responseText

	IF loHTTP.status = 200
		IF (AT(["erro": "true"],lcResponse)) < 1
			achoucep = .t.
	    	loJson =  oJSON.parse(lcResponse)
		endif
	endif
	
	RELEASE oJSON
	RELEASE loHTTP
	
	IF achoucep 
		RETURN loJson
	ELSE
		RETURN .f.
	endif
ENDFUNC

***************************************************************************************************************************
* Fun��o   : DHSQL()
* Objetivo   : tratar data/horas para o sql
***************************************************************************************************************************
function dhsql
param mdatahora

if set('century') != 'ON'
	set century on
endif
if !isnull(mdatahora)
	do case
		case type('mdatahora') = "C"
			mdatahora = alltrim(mdatahora)
			if empty(mdatahora)
				mdatahora = .null.
			else
				mdatahora = ctot(mdatahora)
				mdatahora = mdy(mdatahora) +' '+ subs(ttoc(mdatahora),12,5)
			endif
		case type('mdatahora') = "T"
			mdatahora = mdy(mdatahora) +' '+ subs(ttoc(mdatahora),12,5)
		case type('mdatahora') = "D"
			mdatahora = mdy(mdatahora)
	endcase
endif
return aspas(mdatahora)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	