;*****************************************************************
;*                                                               *
;*         Maths Subroutines for the 8051 microcontroller        *
;*                      W.G.Marshall 2002                        *
;*                                                               *
;*****************************************************************

; All parameters in Register bank 0, (r0 to r7)
; Bits 21H and 22H reserved for sign bits

;=================================================================
; subroutine Cr0
; 8-Bit 2's Complement -> magnitude / Sign Bit Conversion
;
; input:     r0 = signed byte
;
; output:    r0 = magnitude
;            Bit 21H = sign (21H is set if r0 is a negative number)
;
; alters:    acc
;=================================================================

Cr0:           mov     a, r0           ; read X into accumulator
               jb      acc.7, Cr0a     ; X is negative if bit 7 is 1
               clr     21H             ; clear sign bit if 'positive'
               ret                     ; done

Cr0a:          cpl     a               ; X negative, find abs value
               inc     a               ; XA = complement(XT)+1
               mov     r0, a           ; save magnitude
               setb    21H             ; set sign bit if 'negative'
               ret


;=================================================================
; subroutine Cr1
; 8-Bit 2's Complement -> magnitude / Sign Bit Conversion
;
; input:     r1 = signed byte
;
; output:    r1 = magnitude
;            Bit 22H = sign (22H is set if r1 is a negative number)
;
; alters:    acc
;=================================================================

Cr1:           mov     a, r1           ; read X into accumulator
               jb      acc.7, Cr1a     ; X is negative if bit 7 is 1
               clr     22H             ; clear sign bit if 'positive'
               ret                     ; done

Cr1a:          cpl     a               ; X negative, find abs value
               inc     a               ; XA = complement(XT)+1
               mov     r1, a           ; save magnitude
               setb    22H             ; set sign bit if 'negative'
               ret


;===================================================================
; subroutine Cr0r1
; 16-Bit 2's Complement -> magnitude / Sign Bit Conversion
;
; input:    r1, r0 = signed word
;
; output:   r1, r0 = magnitude
;           Bit 21H = sign (21H is set if negative number)
;
; alters:   acc, C
;===================================================================

Cr0r1:         mov     a, r1           ; high byte into accumulator
               jb      acc.7, c0a      ; negative if bit 7 is 1
               clr     21H             ; clear sign bit if 'positive'
               ret                     ; done

c0a:           setb    21H             ; set sign flag
               mov     a, r0           ; number is negative
               cpl     a               ; complement
               add     a, #1           ; and add +1
               mov     r0, a 
               mov     a, r1           ; get next byte
               cpl     a               ; complement
               addc    a, #0
               mov     r1, a
               ret


;====================================================================
; subroutine Cr2r3
; 16-Bit 2's Complement -> magnitude / Sign Bit Conversion
;
; input:    r3, r2 = signed word
;
; output:   r3, r2 = magnitude
;           Bit 22H = sign (22H is set if negative number)
;
; alters:   acc, C
;====================================================================

Cr2r3:         mov     a, r3           ; read high into accumulator
               jb      acc.7, c1a      ; negative if bit 7 is 1
               clr     22H             ; clear sign bit if 'positive'
               ret                     ; done

c1a:           setb    22H             ; set sign flag
               mov     a, r2           ; number is negative
               cpl     a               ; complement
               add     a, #1           ; and add +1
               mov     r2, a 
               mov     a, r3           ; get next byte
               cpl     a               ; complement
               addc    a, #0
               mov     r3, a
               ret


;====================================================================
; subroutine Cr4r5
; 16-Bit 2's Complement -> magnitude / Sign Bit Conversion
;
; input:    r5, r4 = signed word
;
; output:   r5, r4 = magnitude
;           Bit 22H = sign (22H is set if negative number)
;
; alters:   acc, C
;====================================================================

Cr4r5:         mov     a, r5           ; read high into accumulator
               jb      acc.7, c3a      ; negative if bit 7 is 1
               clr     22H             ; clear sign bit if 'positive'
               ret                     ; done

c3a:           setb    22H             ; set sign flag
               mov     a, r4           ; number is negative
               cpl     a               ; complement
               add     a, #1           ; and add +1
               mov     r4, a 
               mov     a, r5           ; get next byte
               cpl     a               ; complement
               addc    a, #0
               mov     r5, a
               ret


;====================================================================
; subroutine Cr0r3
; 32-Bit 2's Complement -> magnitude / Sign Bit Conversion
;
; input:    r3, r2, r1, r0 = signed word
;
; output:   r3, r2, r1, r0 = magnitude
;           Bit 21H = sign (21H is set if negative number)
;
; alters:   acc
;====================================================================

Cr0r3:         mov     a, r3           ; read high into accumulator
               jb      acc.7, c2a      ; negative if bit 7 is 1
               clr     21H             ; clear sign flag if 'positive'
               ret                     ; done

c2a:           setb    21H             ; set sign flag
               mov     a, r0           ; number is negative
               cpl     a               ; complement
               add     a, #1           ; and add +1
               mov     r0, a 
               mov     a, r1           ; get next byte
               cpl     a               ; complement
               addc    a, #0
               mov     r1,a
               mov     a, r2           ; get next byte
               cpl     a               ; complement
               addc    a, #0
               mov     r2,a
               mov     a, r3           ; get next byte
               cpl     a               ; complement
               addc    a, #0
               mov     r3, a
               ret                     ; done


;==================================================================
; subroutine Mr0
; 8-Bit magnitude / Sign Bit -> 2's Complement Conversion
;
; input:    r0 = magnitude
;           Bits 21H & 22H = sign bits of operands X and Y
;           (set if negative)
;
; output:   r0 = signed byte
;
; alters:   acc
;==================================================================

Mr0:           jb      21H, Mr0b       ; test X sign
               jb      22H, Mr0a       ; test Y sign
               ret

Mr0b:          jnb     22H, Mr0a
               ret

Mr0a:          mov     a, r0           ; if r0 negative, get abs value
               cpl     a               ; complement magnitude of X
               inc     a               ; r0 = complement(r0)+1
               mov     r0, a           ; save in 2's complement
               ret                     ; done


;====================================================================
; subroutine Mr0r1
; 16-Bit magnitude / Sign Bit -> 2's Complement Conversion
;
; input:    r1, r0 = magnitude
;           Bits 21H & 22H = sign bits of operands X and Y
;           (set if negative)
;
; output:   r1, r0 = signed word
;
; alters:   acc, C
;====================================================================

Mr0r1:         jb      21H, Mr0r1b     ; test X sign
               jb      22H, Mr0r1a     ; test Y sign
               ret

Mr0r1b:        jnb     22H, Mr0r1a
               ret

Mr0r1a:        mov     a, r0           ; negate number
               cpl     a               ; complement
               add     a, #1           ; and add +1
               mov     r0, a 
               mov     a, r1           ; get next byte
               cpl     a               ; complement
               addc    a, #0
               mov     r1, a
               ret


;====================================================================
; subroutine Mr0r3
; 32-Bit magnitude / Sign Bit -> 2's Complement Conversion
;
; input:    r3, r2, r1, r0 = magnitude
;           Bits 21H & 22H = sign bits of operands X and Y
;           (set if negative)
;
; output:   r3, r2, r1, r0 = signed word
;
; alters:   acc, C
;====================================================================

Mr0r3:         jb      21H, Mr0r3b     ; test X sign
               jb      22H, Mr0r3a     ; test Y sign
               ret

Mr0r3b:        jnb     22H, Mr0r3a
               ret

Mr0r3a:        mov     a, r0           ; negate number
               cpl     a               ; complement
               add     a, #1           ; and add +1
               mov     r0, a 
               mov     a, r1           ; get next byte
               cpl     a               ; complement
               addc    a, #0
               mov     r1, a
               mov     a, r2           ; get next byte
               cpl     a               ; complement
               addc    a, #0
               mov     r2, a
               mov     a, r3           ; get next byte
               cpl     a               ; complement
               addc    a, #0
               mov     r3, a
               ret                     ; done


;====================================================================
; subroutine CONV816
; 8-bit Signed number to 16-Bit Signed number conversion
;
; input:     r0 = X
;
; output:    r1, r0 = X with sign extended to 16 bits
;
; alters:    acc
;====================================================================

CONV816:       mov    A, r0
               jnb    acc.7, Pos
               mov    r1, #0FFH
               ret

Pos:           mov    r1, #0
               ret


;====================================================================
; subroutine ADD16
; 16-Bit Signed (2's Complement) Addition
;
; input:     r1, r0 = X
;            r3, r2 = Y
;
; output:    r1, r0 = signed sum S = X + Y
;            Carry C is set if the result (S) is out of range
;
; alters:    acc, C, OV
;====================================================================

ADD16:         anl    PSW, #0E7H       ; Register Bank 0
               mov     a, r0           ; load X low byte into acc
               add     a, r2           ; add Y low byte
               mov     r0, a           ; put result in Z low byte
               mov     a, r1           ; load X high byte into acc
               addc    a, r3           ; add Y high byte with carry
               mov     r1, a           ; save result in Z high byte
               mov     C, OV
               ret


;====================================================================
; subroutine ADD32
; 32-Bit Signed (2's Complement) Addition
;
; input:     r3, r2, r1, r0 = X
;            r7, r6, r5, r4 = Y
;
; output:    r3, r2, r1, r0 = signed sum S = X + Y
;            Carry C is set if the result (S) is out of range
;
; alters:    acc, C, OV
;====================================================================

ADD32:         anl    PSW, #0E7H       ; Register Bank 0
               mov     a, r0           ; load X low byte into acc
               add     a, r4           ; add Y low byte
               mov     r0, a           ; save result
               mov     a, r1           ; load X next byte into acc
               addc    a, r5           ; add Y next byte with carry
               mov     r1, a           ; save result
               mov     a, r2           ; load X next byte into acc
               addc    a, r6           ; add Y next byte
               mov     r2, a           ; save result
               mov     a, r3           ; load X high byte into acc
               addc    a, r7           ; add Y high byte with carry
               mov     r3, a
               mov     C, OV
               ret


;====================================================================
; subroutine SUB16
; 16-Bit Signed (2's Complement) Subtraction
;
; input:     r1, r0 = X
;            r3, r2 = Y
;
; output:    r1, r0 = signed difference D = X - Y
;            Carry C is set if the result (D) is out of range.
;
; alters:    acc, C, OV
;====================================================================

SUB16:         anl    PSW, #0E7H       ; Register Bank 0
               mov     a, r0           ; load X low byte into acc
               clr     C               ; clear carry flag
               subb    a, r2           ; subract Y low byte
               mov     r0, a           ; put result in Z low byte
               mov     a, r1           ; load X high into accumulator
               subb    a, r3           ; subtract Y high with borrow
               mov     r1, a           ; save result in Z high byte
               mov     C, OV
               ret


;====================================================================
; subroutine SUB32
; 32-Bit Signed (2's Complement) subtraction
;
; input:     r3, r2, r1, r0 = X
;            r7, r6, r5, r4 = Y
;
; output:    r3, r2, r1, r0 = signed difference D = X - Y
;            Carry C is set if the result (D) is out of range.
;
; alters:    acc, C, OV
;====================================================================

SUB32:         anl    PSW, #0E7H       ; Register Bank 0
               mov     a, r0           ; load X low byte into acc
               clr     C               ; clear carry flag
               subb    a, r4           ; subract Y low byte
               mov     r0, a           ; put result in Z low byte
               mov     a, r1           ; repeat with other bytes...
               subb    a, r5
               mov     r1, a
               mov     a, r2
               subb    a, r6
               mov     r2, a
               mov     a, r3
               subb    a, r7
               mov     r3, a
               mov     C, OV           ; set C if external borrow
               ret


;==================================================================
; subroutine MUL8
; 8-Bit x 8-Bit to 16-Bit Product Signed Multiply
; 2's Complement format
;
; input:    r0 = multiplicand X
;           r1 = multiplier Y
;
; output:   r1, r0 = product P = X x Y.
;           
; calls:    UMUL8, Cr0, Cr1, Mr0r1
;
; alters:   acc, C, Bits 21H & 22H
;==================================================================

MUL8:          anl     PSW, #0E7H      ; Register Bank 0
               acall   Cr0             ; 2's comp -> Mag/Sign
               acall   Cr1             ; 2's comp -> Mag/Sign
               acall   UMUL8
               acall   Mr0r1           ; Mag/Sign -> 2's Comp
               ret


;==================================================================
; subroutine UMUL8
; 8-Bit x 8-Bit to 16-Bit Product Unsigned Multiply
;
; input:    r0 = multiplicand X
;           r1 = multiplier Y
;
; output:   r1, r0 = product P = X x Y.
;
; alters:   acc
;==================================================================

UMUL8:         push    b
               mov     a, r0           ; read X and ...
               mov     b, r1           ; ... Y
               mul     ab              ; multiply X and Y
               mov     r1, b           ; save result high ...
               mov     r0, a           ; ... and low
               pop     b
               ret


;====================================================================
; subroutine MUL816
; 8-Bit x 16-Bit to 32-Bit Product signed Multiply
; 2's Complement format
;
; input:    r0 = multiplicand X
;           r3, r2 = multiplier Y
;
; output:   r3, r2, r1, r0 = product P = X x Y (r3 = sign extension)
;
; calls:    Cr0, Cr2r3, Mr0r3
;
; alters:   acc, C, Bits 21H & 22H
;====================================================================

MUL816:        push    b
               anl     PSW, #0E7H      ; Register Bank 0
               acall   Cr0             ; 2's comp -> Mag/Sign
               acall   Cr2r3           ; 2's comp -> Mag/Sign
               mov     a, r0           ; load X low byte into acc
               mov     b, r2           ; load Y low byte into B
               mul     ab              ; multiply
               push    acc             ; stack result low byte
               push    b               ; stack result high byte
               mov     a, r0           ; load X into acc again
               mov     b, r3           ; load Y high byte into B
               mul     ab              ; multiply
               pop     00H             ; recall X*YL high byte
               add     a, r0           ; add X*YL high and X*YH low
               mov     r1, a           ; save result
               clr     a               ; clear accumulator
               addc    a, b            ; a = b + carry flag
               mov     r2, a           ; save result
               pop     00H             ; get low result
               mov     r3, #0
               acall   Mr0r3           ; Mag/Sign -> 2's Comp
               pop     b
               ret


;====================================================================
; subroutine MUL16
; 16-Bit x 16-Bit to 32-Bit Product Signed Multiply
; 2's Complement format
;
; input:    r1, r0 = multiplicand X
;           r3, r2 = multiplier Y
;
; output:   r3, r2, r1, r0 = product P = X x Y
;
; calls:    UMUL16, Cr0r1, Cr2r3, Mr0r3
;
; alters:   acc, C, Bits 21H & 22H
;====================================================================

MUL16:         anl     PSW, #0E7H      ; Register Bank 0
               acall   Cr0r1           ; 2's comp -> Mag/Sign
               acall   Cr2r3           ; 2's comp -> Mag/Sign
               acall   UMUL16
               acall   Mr0r3           ; Mag/Sign -> 2's Comp
               ret


;====================================================================
; subroutine UMUL16
; 16-Bit x 16-Bit to 32-Bit Product Unsigned Multiply
;
; input:    r1, r0 = multiplicand X
;           r3, r2 = multiplier Y
;
; output:   r3, r2, r1, r0 = product P = X x Y
;
; alters:   acc, C
;====================================================================

UMUL16:        push    B
               push    dpl
               mov     a, r0
               mov     b, r2
               mul     ab              ; multiply XL x YL
               push    acc             ; stack result low byte
               push    b               ; stack result high byte
               mov     a, r0
               mov     b, r3
               mul     ab              ; multiply XL x YH
               pop     00H
               add     a, r0
               mov     r0, a
               clr     a
               addc    a, b
               mov     dpl, a
               mov     a, r2
               mov     b, r1
               mul     ab              ; multiply XH x YL
               add     a, r0
               mov     r0, a
               mov     a, dpl
               addc    a, b
               mov     dpl, a
               clr     a
               addc    a, #0
               push    acc             ; save intermediate carry
               mov     a, r3
               mov     b, r1
               mul     ab              ; multiply XH x YH
               add     a, dpl
               mov     r2, a
               pop     acc             ; retrieve carry
               addc    a, b
               mov     r3, a
               mov     r1, 00H
               pop     00H             ; retrieve result low byte
               pop     dpl
               pop     B
               ret


;====================================================================
; subroutine MAC16
; 16-Bit x 16-Bit to 32-Bit Product signed Multiply-Accumulate
; 2's Complement format
;
; input:    r1, r0 = multiplicand X
;           r3, r2 = multiplier Y
;           r7, r6, r5, r4 = 32-bit accumulator Ar
;
; output:   r7, r6, r5, r4 = accumulated result Ar =  Ar + (X x Y)
;           r3, r2, r1, r0 = multiply result M = X x Y
;           Carry C set if overflow
;
; calls:    MUL16
;
; alters:   acc, C, Bits 21H & 22H
;====================================================================

MAC16:         anl    PSW, #0E7H       ; Register Bank 0
               acall  MUL16+3
               mov    A, r4
               add    A, r0
               mov    r4, A
               mov    A, r5
               addc   A, r1
               mov    r5, A
               mov    A, r6
               addc   A, r2
               mov    r6, A
               mov    A, r7
               addc   A, r3
               mov    r7, A
               mov    C, OV
               ret


;===============================================================
; subroutine DIV8
; 8-Bit / 8-Bit to 8-Bit Quotient & Remainder signed Divide
; 2's Complement Format
;
; input:    r0 = Dividend X
;           r1 = Divisor Y
;
; output:   r0 = quotient Q of division Q = X / Y
;           r1 = remainder 
;           
; calls:    Cr0, Cr1, Mr0
;
; alters:   acc, C, Bits 21H & 22H
;===============================================================

DIV8:          anl     PSW, #0E7H      ; Register Bank 0
               acall   Cr0             ; 2's comp -> Mag/Sign
               acall   Cr1             ; 2's comp -> Mag/Sign
               acall   UDIV8
               acall   Mr0             ; Mag/Sign -> 2's Comp
               ret


;===============================================================
; subroutine UDIV8
; 8-Bit / 8-Bit to 8-Bit Quotient & Remainder Unsigned Divide
;
; input:    r0 = Dividend X
;           r1 = Divisor Y
;
; output:   r0 = quotient Q of division Q = X / Y
;           r1 = remainder 
;           ;
; alters:   acc, C
;===============================================================

UDIV8:         push    b
               mov     a, r0           ; read X and ...
               mov     b, r1           ; ... Y
               div     ab              ; divide X and Y
               mov     r0, a           ; save result quotient
               mov     r1, b           ; save remainder
               pop     b
               ret


;====================================================================
; subroutine DIV16
; 16-Bit / 16-Bit to 16-Bit Quotient & remainder signed Divide
; 2's Complement Format
;
; input:    r1, r0 = Dividend X
;           r3, r2 = Divisor Y
;
; output:   r1, r0 = quotient Q of division Q = X / Y
;           r3, r2 = remainder 
;           Carry C is set if Y = 0, i.e. divide by 0 attempted
;
; calls:    UDIV16, Cr0r1, Cr2r3, Mr0r1
;
; alters:   acc, r4, r5, r6, r7, flags, Bits 21H & 22H
;====================================================================

DIV16:         anl     PSW, #0E7H      ; Register Bank 0
               mov     a, r3           ; get divisor high byte
               orl     a, r2           ; OR with low byte
               jnz     div_OK          ; divisor OK if not 0
               setb    C               ; else, overflow
               ret

div_OK:        push    dpl
               push    dph
               push    b
               acall   Cr0r1           ; 2's comp -> Mag/Sign
               acall   Cr2r3           ; 2's comp -> Mag/Sign
               acall   UDIV16
               acall   Mr0r1           ; Mag/Sign -> 2's Comp
               clr     C
               pop     b
               pop     dph
               pop     dpl
               ret                     ; done


;====================================================================
; subroutine UDIV16
; 16-Bit / 16-Bit to 16-Bit Quotient & Remainder Unsigned Divide
;
; input:    r1, r0 = Dividend X
;           r3, r2 = Divisor Y
;
; output:   r1, r0 = quotient Q of division Q = X / Y
;           r3, r2 = remainder 
;
; alters:   acc, B, dpl, dph, r4, r5, r6, r7, flags
;====================================================================

UDIV16:        mov     r7, #0          ; clear partial remainder
               mov     r6, #0
               mov     B, #16          ; set loop count

div_loop:      clr     C               ; clear carry flag
               mov     a, r0           ; shift the highest bit of
               rlc     a               ; the dividend into...
               mov     r0, a
               mov     a, r1
               rlc     a
               mov     r1, a
               mov     a, r6           ; ... the lowest bit of the
               rlc     a               ; partial remainder
               mov     r6, a
               mov     a, r7
               rlc     a
               mov     r7, a
               mov     a, r6           ; trial subtract divisor
               clr     C               ; from partial remainder
               subb    a, r2
               mov     dpl, a
               mov     a, r7
               subb    a, r3
               mov     dph, a
               cpl     C               ; complement external borrow
               jnc     div_1           ; update partial remainder if
                                       ; borrow
               mov     r7, dph         ; update partial remainder
               mov     r6, dpl
div_1:         mov     a, r4           ; shift result bit into partial
               rlc     a               ; quotient
               mov     r4, a
               mov     a, r5
               rlc     a
               mov     r5, a
               djnz    B, div_loop
               mov     a, r5           ; put quotient in r0, and r1
               mov     r1, a
               mov     a, r4
               mov     r0, a
               mov     a, r7           ; get remainder, saved before the
               mov     r3, a           ; last subtraction
               mov     a, r6
               mov     r2, a
               ret


;====================================================================
; subroutine DIV32
; 32-Bit / 16-Bit to 32-Bit Quotient & remainder signed Divide
; 2's Complement Format
;
; input:    r3, r2, r1, r0 = Dividend X
;           r5, r4 = Divisor Y
;
; output:   r3, r2, r1, r0 = quotient Q of division Q = X / Y
;           r7, r6, r5, r4 = remainder
;           Carry C is set if Y = 0, i.e. divide by 0 attempted
;
; calls:    UDIV32, Cr0r3, Cr4r5, Mr0r3
;
; alters:   acc, flags, Bits 21H & 22H
;====================================================================

DIV32:         anl     PSW, #0E7H      ; Register Bank 0
               mov     a, r4           ; get divisor high byte
               orl     a, r5           ; OR with low byte
               jnz     div32_OK        ; divisor OK if not 0
               setb    C               ; else, overflow
               ret

div32_OK:      acall   Cr0r3           ; 2's comp -> Mag/Sign
               acall   Cr4r5           ; 2's comp -> Mag/Sign
               acall   UDIV32
               acall   Mr0r3           ; Mag/Sign -> 2's Comp
               clr     C               ; divisor is not 0
               ret                     ; done


;====================================================================
; subroutine UDIV32
; 32-Bit / 16-Bit to 32-Bit Quotient & Remainder Unsigned Divide
;
; input:    r3, r2, r1, r0 = Dividend X
;           r5, r4 = Divisor Y
;
; output:   r3, r2, r1, r0 = quotient Q of division Q = X / Y
;           r7, r6, r5, r4 = remainder
;;
; alters:   acc, flags
;====================================================================

UDIV32:        push    08              ; Save Register Bank 1
               push    09
               push    0AH
               push    0BH
               push    0CH
               push    0DH
               push    0EH
               push    0FH
               push    dpl
               push    dph
               push    B
               setb    RS0             ; Select Register Bank 1
               mov     r7, #0          ; clear partial remainder
               mov     r6, #0
               mov     r5, #0          
               mov     r4, #0
               mov     B, #32          ; set loop count

div_lp32:      clr     RS0             ; Select Register Bank 0
               clr     C               ; clear carry flag
               mov     a, r0           ; shift the highest bit of the
               rlc     a               ; dividend into...
               mov     r0, a
               mov     a, r1
               rlc     a
               mov     r1, a
               mov     a, r2
               rlc     a
               mov     r2, a
               mov     a, r3
               rlc     a
               mov     r3, a
               setb    RS0             ; Select Register Bank 1
               mov     a, r4           ; ... the lowest bit of the
               rlc     a               ; partial remainder
               mov     r4, a
               mov     a, r5
               rlc     a
               mov     r5, a
               mov     a, r6
               rlc     a
               mov     r6, a
               mov     a, r7
               rlc     a
               mov     r7, a
               mov     a, r4           ; trial subtract divisor from
               clr     C               ; partial remainder
               subb    a, 04
               mov     dpl, a
               mov     a, r5
               subb    a, 05
               mov     dph, a
               mov     a, r6
               subb    a, #0
               mov     06, a
               mov     a, r7
               subb    a, #0
               mov     07, a
               cpl     C               ; complement external borrow
               jnc     div_321         ; update partial remainder if
                                       ; borrow
               mov     r7, 07          ; update partial remainder
               mov     r6, 06
               mov     r5, dph
               mov     r4, dpl
div_321:       mov     a, r0           ; shift result bit into partial
               rlc     a               ; quotient
               mov     r0, a
               mov     a, r1
               rlc     a
               mov     r1, a
               mov     a, r2
               rlc     a
               mov     r2, a
               mov     a, r3
               rlc     a
               mov     r3, a
               djnz    B, div_lp32

               mov     07, r7          ; put remainder, saved before the
               mov     06, r6          ; last subtraction, in bank 0
               mov     05, r5
               mov     04, r4
               mov     03, r3          ; put quotient in bank 0
               mov     02, r2
               mov     01, r1
               mov     00, r0
               clr     RS0
               pop     B
               pop     dph
               pop     dpl
               pop     0FH             ; Retrieve Register Bank 1
               pop     0EH
               pop     0DH
               pop     0CH
               pop     0BH
               pop     0AH
               pop     09
               pop     08
               ret


;====================================================================
; subroutine MULDIV
; 16-Bit x 16-Bit to 32-Bit Product Signed Multiply followed by
; 32-Bit / 16-Bit to 32-Bit Quotient & remainder signed Divide
; 2's Complement Format
;
; input:    r1, r0 = multiplicand X
;           r3, r2 = multiplier Y
;           r5, r4 = divisor Z
;
; output:   r3, r2, r1, r0 = quotient Q of division Q = (X x Y) / Z
;           r7, r6, r5, r4 = remainder
;           Carry C is set if Z = 0, i.e. divide by 0 attempted
;
; calls:    UMUL16, UDIV32, Cr0r1, Cr2r3, Cr4r5, Mr0r3
;
; alters:   acc, flags, Bits 21H & 22H
;====================================================================

MULDIV:        anl     PSW, #0E7H      ; Register Bank 0
               mov     a, r4           ; get divisor high byte
               orl     a, r5           ; OR with low byte
               jnz     muld_OK         ; divisor OK if not 0
               setb    C               ; else, overflow
               ret

muld_OK:       lcall   Cr0r1           ; 2's comp -> Mag/Sign
               lcall   Cr2r3           ; 2's comp -> Mag/Sign
               lcall   UMUL16
               jb      21H, divn1      ; test X sign
divn:          lcall   Cr4r5           ; 2's comp -> Mag/Sign
               lcall   UDIV32
               lcall   Mr0r3           ; Mag/Sign -> 2's Comp
               clr     C               ; divisor is not 0
               ret

divn1:         jbc     22H, divn       ; test Y sign
               setb    22H
               sjmp    divn


;====================================================================
; subroutine MACD16
; 16-Bit x 16-Bit to 32-Bit Product signed Multiply-Accumulate
; with table data and data move.
; y(n) = x(n)*h0 + x(n-1)*h1 + x(n-2)*h2 + ......
; Note: Assumes shared program/data space. i.e. PSEN and RD are OR-ed
; together on the board.
; 2's Complement format
;
; input:    B = No. of 16-bit data items in tables (max 63)
;           DPTR --> New Input data (e.g. from ADC)
;           DPTR+2 --> Base of Data Table (x)
;           DPTR+128 --> Base of Multiplier Table (h)
;
; output:   r7, r6, r5, r4 = 32-bit accumulated result
;
; calls:    MUL16
;
; alters:   acc, flags, Bits 21H & 22H
;====================================================================

MACD16:        anl    PSW, #0E7H
               mov    r4, #0           ; Clear Accumulator
               mov    r5, #0
               mov    r6, #0
               mov    r7, #0

               movx   a, @DPTR
               push   acc              ; Save XNEWL
               inc    DPTR
               movx   a, @DPTR
               push   acc              ; Save XNEWH
               inc    DPTR

Macd1:         movx   a, @DPTR         ; Get x(n)L
               mov    r0, a
               push   acc              ; Save x(n)L
               mov    a, #80H
               movc   a, @a+DPTR       ; Get h(n)L
               mov    r2, a
               inc    DPTR
               movx   a, @DPTR         ; Get x(n)H
               mov    r1, a
               push   acc              ; Save x(n)H
               mov    a, #80H
               movc   a, @a+DPTR       ; Get h(n)H
               mov    r3, a
               lcall  MUL16+3          ; Do Multiply...
               mov    A, r4            ; then Accumulate..
               add    A, r0
               mov    r4, A
               mov    A, r5
               addc   A, r1
               mov    r5, A
               mov    A, r6
               addc   A, r2
               mov    r6, A
               mov    A, r7
               addc   A, r3
               mov    r7, A
               pop    01               ; Now move x data
               pop    00
               pop    03
               pop    02
               push   00
               push   01
               mov    a, r3            ; Move up x(n)H
               movx   @DPTR, a
               mov    a, #0FFH
               add    a, dpl
               mov    dpl, a
               mov    a, #0FFH
               addc   a, dph
               mov    dph, a
               mov    a, r2            ; Move up x(n)L
               movx   @DPTR, a
               inc    DPTR
               inc    DPTR
               djnz   b, Macd1         ; Whole table processed?
               dec    SP
               dec    SP
               ret


;==================================================================
; subroutine DELAY
;
; input:    r0, r1, r2 = delay loop constants, r0 = coarse loop
;==================================================================

DELAY:         push   dpl
               push   dph
               mov    dpl, r1
               mov    dph, r2
Delay1:        mov    r1, dpl
Delay2:        mov    r2, dph
               djnz   r2, $
               djnz   r1, Delay2
               djnz   r0, Delay1
               pop    dph
               pop    dpl
               ret


end

