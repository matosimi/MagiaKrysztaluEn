;MatoSimi 2026

	opt h-
	ins "Magia Krysztalu.xex",0,.FileSize("Magia Krysztalu.xex")-6
	opt h+

;3d33 L400 - title screen + winning screen
;4664 - object table - not needed
;4699-4896 L200 - object texts, each is 17 characters

	org $3d33
;	dta d'SCORE 000%             LIVES: 3 __        MAGIA KRYSZTALU       '
	dta d'SCORE 000%             LIVES: 3 __       MAGIC OF THE CRYSTAL   '
; RESULT/SCORE  [life wish?]     CRYSTAL MAGIC
	dta d'                                  PUBLISHER   ASF s.c.          '
; PUBLISHER  ASF [?]
	dta d'                                     AUTHOR   PIOTR KULIKIEWICZ '
; AUTHOR  PIOTR KULIKIEWICZ
	dta d'                                       IDEA   BART',$3e,d'OMIEJ TROKOWIC'
; IDEA  BARTLOMIEJ TROKOWIC
	dta d'Z GRAPHICS   ALEKSANDER AST          MUSIC   STANIS',$3e,d'AW SKWIOT   '
; BY GRAPHICS  ALEKSANDER [?]  MUSIC  STANISLAW SKWIOT
	dta d'   ENGLISH   MARTIN SIMECEK 2026 '
	dta d'                              '
	dta d'   GDA',$06,d'SK 1992      (C) ASF s.c.'
; GDANSK [?]    CITY  ASF [?]
	;ta d'                                  PROGRAM TEN ZOSTA_ NAPISANY PR'
	dta d'                                 '; ENGLISH VERSION   MATOSIMI 202'
	; PROGRAM THIS WAS WRITTEN USING COMPUTER AMIGA [?]
	;dta d'ZYPOMOCY KOMPUTERA  AMIGA ____                                  '
	dta d'   GAME WRITTEN USING AMIGA 500.                                '
; WITH HELP OF COMPUTER AMIGA [?]
	dta d'          PRESS  FIRE  !!!                                     '
; PRESS  FIRE  [button]
	dta d'                                     AMULET AND MAGICAL DRINK   '
; AMULET AND MAGICAL DRINK WILL FULFILL
	dta d'        FULFILLED YOUR TASK!                                    '
; YOUR TASK
	dta d'         DEMON DEFEATED !!!                                     '
; DEMON DEFEATED
	dta d'   TANNATOS FULFILLS PROMISE TO   TAKE REVENGE ON SYRYLAK, RULER'
; TANNATOS FULFILLS PROMISE  TO TAKE REVENGE ON SYRYLAK [?]
	dta d'  OF ABYSS AND THE CIRCLE OF HELL.  NOW WITH A CALM FACE HE CAN '
; MASTER OF HELL AND CIRCLE [?] OF HELL [?]  NOW WITH CALM FACE
	dta d'    RETURN TO LONG-FORGOTTEN             GRANITE TOWER ...      '
; RETURNS TO FORGOTTEN  GRANITE TOWER [?]
	dta d'                                             THE END            '
; THE END

	org $4699
	dta d' FOREST GRANDPA  '
; FOREST GRANDFATHER / WOODLAND GRANDFATHER
	dta d'   CAULDRON      '
; CAULDRON
	dta d'  TRANSFORMER    '
; TRANSFORMER
	dta d'    CAVEMAN      '
; CAVEMAN / CAVE DWELLER
	dta d' DOORS TO CASTLE '
; DOORS TO CASTLE
	dta d'    ICE WALL     '
; ICE WALL
	dta d'   POOR KNIGHT   '
; POOR KNIGHT
	dta d'    CARRION      '
; CARRION / CORPSE
	dta d'  CONCRETE STEP  '
; CONCRETE STAGE / STEP
	dta d' HEAP OF RUBBLE  '
; HEAP OF RUBBLE
	dta d'    HAMMER       '
; HAMMER
	dta d'   SAPPHIRE      '
; SAPPHIRE
	dta d'    SHOVEL       '
; SPADE / SHOVEL
	dta d'     BONE        '
; BONE
	dta d'    MOUSE        '
; MOUSE
	dta d'  LUMP OF SALT   '
; BLOCK / LUMP OF SALT
	dta d'    APPLE        '
; APPLE
	dta d'    STONE        '
; STONE
	dta d' EMPTY BOTTLE    '
; EMPTY BOTTLE
	dta d'  FULL BOTTLE    '
; FULL BOTTLE
	dta d'     COIN        '
; COIN
	dta d'      KEY        '
; KEY
	dta d'   PINE CONE     '
; PINE CONE
	dta d'     RUBY        '
; RUBY
	dta d'    AMULET       '
; AMULET
	dta d'    DEBRIS       '
; RUBBLE / DEBRIS
	dta d'   OLD SWORD     '
; OLD SWORD
	dta d'   PRAYER BOOK   '
; PRAYER BOOK
	dta d'    MATCHES      '
; MATCHES
	dta d'                 '
; (empty / spacing)
;	dta d'__'
; (extra data)

	org $48e4
	dta d'   YOU CAN PLACE AN ITEM HERE!  '

	run $0634
	
;to trigger ending: r pc 20e4
