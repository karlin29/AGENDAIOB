CLEAR
CLEAR ALL 
SET TALK OFF && Elimina mensagens do sistema 

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

set sysmenu off
_screen.windowstate = 2
_screen.icon        = "C:\AGENDAIOB\icons\icon.ico"
_screen.closable    = .t.
_screen.minbutton   = .t.
_screen.maxbutton   = .f.
_screen.minheight   = 600
_screen.minwidth    = 800
_screen.addproperty( 'titulo', " Sistema de Agenda " )

_screen.addobject('imgfundo','image')
_screen.imgfundo.width = _screen.width
_screen.imgfundo.height = _screen.height
_screen.imgfundo.stretch = 2
_screen.imgfundo.picture = 'fundo.png'
_screen.imgfundo.visible = .t.
_screen.imgfundo.enabled = .t.

*Redimencionar
public ohandler, mredimencionar_tela
mredimencionar_tela = .t.
*ohandler = newobject('myhandler')
*bindevent(_screen,'Resize',ohandler,'myresize')

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
endfor

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

DO procs
DO json
DO menu.mpr 

read events

*!*	_SCREEN.Closable = .t.
*!*	_SCREEN.WINDOWSTATE = 2
*!*	_SCREEN.caption='Sitema de Agenda - Versão 1.0 Data: '+DTOC(DATE()) 
*!*	*DO "C:\ProjetosVFP\Vendas\menus\menuprincipal.mpr" && Executa o Menu
*!*	*_SCREEN.PICTURE = "C:\ProjetosVFP\Vendas\imgs\wallpaper.png"	
*!*	READ EVENTS
