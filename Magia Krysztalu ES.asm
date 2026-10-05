;MatoSimi 2026

	opt h-
	ins "Magia Krysztalu FNT.xex",0,.FileSize("Magia Krysztalu FNT.xex")-6
	opt h+

;3d33 L400 - title screen + winning screen
;4664 - object table - not needed
;4699-4896 L200 - object texts, each is 17 characters

	org $3d33
;	dta d'SCORE 000%             LIVES: 3 __        MAGIA KRYSZTALU       '
	dta d'PROG. 000%             VIDAS: 3 __      LA MAGIA DEL CRISTAL    '
; RESULT/SCORE  [life wish?]     CRYSTAL MAGIC
	dta d'                                     EDITOR   ASF s.c.          '
; PUBLISHER  ASF [?]
; AUTHOR  PIOTR KULIKIEWICZ
	dta d'                                       IDEA   BART',$3e,d'OMIEJ TROKOWIC'
; IDEA  BARTLOMIEJ TROKOWIC
	dta d'Z GRAFICOS   ALEKSANDER AST         MUSICA   STANIS',$3e,d'AW SKWIOT   '
; BY GRAPHICS  ALEKSANDER [?]  MUSIC  STANISLAW SKWIOT
	;dta d'   ESPANOL   MARTIN SIMECEK 2026 '
	dta d'   ESPA*OL   MatoSimi / AsCrNet  '
	dta d'                              '
	dta d'   GDA',$06,d'SK 1992      (C) ASF s.c.'
; GDANSK [?]    CITY  ASF [?]
	;ta d'                                  PROGRAM TEN ZOSTA_ NAPISANY PR'
	dta d'                                 '; ENGLISH VERSION   MATOSIMI 202'
	; PROGRAM THIS WAS WRITTEN USING COMPUTER AMIGA [?]
	;dta d'ZYPOMOCY KOMPUTERA  AMIGA ____                                  '
	dta d' JUEGO ESCRITO USANDO AMIGA 500.                                '
; WITH HELP OF COMPUTER AMIGA [?]
	dta d'          PULSA  BOTON !!!                                      '
; PRESS  FIRE  [button]
	dta d'                                  EL AMULETO Y LA POCION MAGICA '
; AMULET AND MAGICAL DRINK WILL FULFILL
	dta d'      HAN CUMPLIDO SU MISION                                    '
; YOUR TASK
	dta d'        DEMONIO DERROTADO !!!                                   '
; DEMON DEFEATED
	dta d'    TANNATOS CUMPLE PROMESA DE    VENGARSE DE SYRYLAK, GOBERNADO'
; TANNATOS FULFILLS PROMISE  TO TAKE REVENGE ON SYRYLAK [?]
	dta d'R   DEL ABISMO Y EL CIRCULO DEL   INFIERNO. AHORA, CON EL ROSTRO'
; MASTER OF HELL AND CIRCLE [?] OF HELL [?]  NOW WITH CALM FACE
	dta d'  SERENO, PUEDE REGRESAR A LA YA   OLVIDADA TORRE DE GRANITO ...'
; RETURNS TO FORGOTTEN  GRANITE TOWER [?]
	dta d'                                                                '
	dta d'                                               FIN              '
; THE END

	org $4699
	dta d'ABUELO DEL BOSQUE'
; FOREST GRANDFATHER / WOODLAND GRANDFATHER
	dta d'    CALDERO      '
; CAULDRON
	dta d'  TRANSFORMADOR  '
; TRANSFORMER
	dta d'   CAVERNICOLA   '
; CAVEMAN / CAVE DWELLER
	dta d'     PUERTA      '	
; DOORS TO CASTLE
	dta d'  MURO DE HIELO  '
; ICE WALL
	dta d' POBRE CABALLERO '
; POOR KNIGHT
	dta d'   CARRO*A       ' ;CARROÑA
; CARRION / CORPSE
	dta d'TROZO DE HORMIGON'	
; CONCRETE STAGE / STEP
	dta d'VARIOS ESCOMBROS '
; HEAP OF RUBBLE
	dta d'   MARTILLO      '
; HAMMER
	dta d'    ZAFIRO       '
; SAPPHIRE
	dta d'     PALA        '
; SPADE / SHOVEL
	dta d'    HUESO        '
; BONE
	dta d'    RATON        '
; MOUSE
	dta d' TERRON DE SAL   '
; BLOCK / LUMP OF SALT
	dta d'    MANZANA      '
; APPLE
	dta d'    PIEDRA       '
; STONE
	dta d' BOTELLA VACIA   '
; EMPTY BOTTLE
	dta d' BOTELLA LLENA   '
; FULL BOTTLE
	dta d'    MONEDA       '
; COIN
	dta d'    LLAVE        '
; KEY
	dta d' PI*A DE PINO    '
; PINE CONE
	dta d'    RUBI         '
; RUBY
	dta d'   AMULETO       '
; AMULET
	dta d'   ESCOMBROS     '
; RUBBLE / DEBRIS
	dta d'  ESPADA VIEJA   '
; OLD SWORD
	dta d'ANTIGUA ORACION  '
; PRAYER BOOK
	dta d'    CERILLAS     '
; MATCHES
	dta d'                 '
; (empty / spacing)
;	dta d'__'
; (extra data)

	org $48e4
	dta d'  PUEDES COLOCAR UN OBJETO AQUI!'

	run $0634
	
;to trigger ending: r pc 20e4
