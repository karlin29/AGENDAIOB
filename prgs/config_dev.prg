CLEAR
CLEAR ALL 
SET TALK OFF && Elimina mensagens do sistema 
*SET DATE TO DMY  && Formato de Data para Dia/Mes/Ano
SET DATE TO BRITISH 
SET HOURS TO 24
SET SECONDS OFF
SET CENTURY ON
SET DELETED ON && Não apresenta os registros marcados para exclusão
SET CURRENCY TO "R$"
SET POINT TO ',' && Separador Decimal
SET SEPARATOR TO '.' && Separador do Milhar
SET EXACT ON
SET CONFIRM OFF
SET RESOURCE ON
SET EXCLUSIVE OFF
SET NEAR OFF
SET ANSI OFF
SET FIELDS OFF

caminho_arquivo = "C:\AGENDAIOB\config.txt"
cTexto = FILETOSTR(caminho_arquivo)

ALINES(aLinhas, cTexto)

for i = 1 to ALEN(aLinhas)
    cLinha = ALLTRIM(aLinhas[i])
    DO case
    	CASE i = 1
    		mdriver = SUBSTR(cLinha, 8, LEN(aLinhas[i]))
    	CASE i = 2
    		mserver = SUBSTR(cLinha, 8, LEN(aLinhas[i]))
    	CASE i = 3
    		mport = SUBSTR(cLinha, 6, LEN(aLinhas[i]))
    	CASE i = 4
    		mdatabase = SUBSTR(cLinha, 10, LEN(aLinhas[i]))
    	CASE i = 5
    		muser = SUBSTR(cLinha, 8, LEN(aLinhas[i]))
    	CASE i = 6
    		msenha = SUBSTR(cLinha, 7, LEN(aLinhas[i]))
    endcase
ENDFOR

PUBLIC connection, handle
connection=[DRIVER={]+mdriver+[};server=]+mserver+[;Port=]+mport+[;Database=]+mdatabase+[;Uid=]+muser+[;Pwd=]+msenha+[;]

handle = Sqlstringconnect(connection)

If handle < 0
   Aerror(laError)
   Messagebox(laError[1,2])
   = Messagebox('Falha na conexão com o banco de dados !', 16, 'Erro !')
   Close Databases
   Return
ENDIF

DO procs.prg
DO json.prg

