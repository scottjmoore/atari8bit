Cursor      equ $40
Cursor.X    equ Cursor
Cursor.Y    equ Cursor+1

GTIA        equ $d000
POKEY       equ $d200
PIA         equ $d300
ANTIC       equ $d400
DMACTL      equ $d400

COLPF0      equ $d016
COLPF1      equ $d017
COLPF2      equ $d018
COLPF3      equ $d019
COLBK       equ $d01a

DLISTL      equ $d402
DLISTH      equ $d403
CHBASE      equ $d409

    org     $a000
Start:
    sei 
    lda #<DisplayList
    sta DLISTL
    lda #>DisplayList
    sta DLISTH
    lda #$e0
    sta CHBASE
    lda #%00100010
    sta DMACTL
    lda #$60
    sta COLPF0
    lda #$60
    sta COLPF1
    lda #$0f
    sta COLPF2
    lda #$0f
    sta COLPF3
    lda #$98
    sta COLBK
.DrawCharacterSet
    ldx #$00
.Loop
    txa 
    sta $1800,x
    inx 
    bne .Loop
    jmp .DrawCharacterSet
.Exit
    rts 

DisplayList:
    db $70,$70,$70
    db $42
    dw $1800

    db $02,$02,$02,$02,$02,$02
    db $02,$02,$02,$02,$02,$02
    db $02,$02,$02,$02,$02,$02
    db $02,$02,$02,$02,$02

    db $41
    dw DisplayList

    org $bffd
    
    db $ff
    dw Start

