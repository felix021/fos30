; hello-os
; TAB=4

		ORG		0x7c00			; このプログラムがどこに�iみ�zまれるのか

; 參和は���糞弔�FAT12フォ�`マットフロッピ�`ディスクのための��峰

		JMP		entry
		DB		0x90
		DB		"HELLOIPL"		; ブ�`トセクタの兆念を徭喇に��いてよい��8バイト��
		DW		512				; 1セクタの寄きさ��512にしなければいけない��
		DB		1				; クラスタの寄きさ��1セクタにしなければいけない��
		DW		1				; FATがどこから兵まるか��噸宥は1セクタ朕からにする��
		DB		2				; FATの��方��2にしなければいけない��
		DW		224				; ル�`トディレクトリ�I囃の寄きさ��噸宥は224エントリにする��
		DW		2880			; このドライブの寄きさ��2880セクタにしなければいけない��
		DB		0xf0			; メディアのタイプ��0xf0にしなければいけない��
		DW		9				; FAT�I囃の�Lさ��9セクタにしなければいけない��
		DW		18				; 1トラックにいくつのセクタがあるか��18にしなければいけない��
		DW		2				; ヘッドの方��2にしなければいけない��
		DD		0				; パ�`ティションを聞ってないのでここは駅ず0
		DD		2880			; このドライブ寄きさをもう匯業��く
		DB		0,0,0x29		; よくわからないけどこの�､砲靴討�くといいらしい
		DD		0xffffffff		; たぶんボリュ�`ムシリアル桑催
		DB		"HELLO-OS   "	; ディスクの兆念��11バイト��
		DB		"FAT12   "		; フォ�`マットの兆念��8バイト��
		RESB	18				; とりあえず18バイトあけておく

; プログラム云悶

entry:
		MOV		AX,0			; レジスタ兜豚晒
		MOV		SS,AX
		MOV		SP,0x7c00
		MOV		DS,AX
		MOV		ES,AX

		MOV		SI,msg
putloop:
		MOV		AL,[SI]
		ADD		SI,1			; SIに1を怎す
		CMP		AL,0
		JE		fin
		MOV		AH,0x0e			; 匯猟忖燕幣ファンクション
		MOV		BX,15			; カラ�`コ�`ド
		INT		0x10			; ビデオBIOS柵び竃し
		JMP		putloop
fin:
		HLT						; 採かあるまでCPUを唯峭させる
		JMP		fin				; �o�泪覃`プ

msg:
		DB		0x0a, 0x0a		; 個佩を2つ
		DB		"hello, world"
		DB		0x0a			; 個佩
		DB		0

		RESB	0x7dfe-$		; 0x7dfeまでを0x00で托める凋綜

		DB		0x55, 0xaa

; 參和はブ�`トセクタ參翌の何蛍の��峰

		DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		RESB	4600
		DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		RESB	1469432
