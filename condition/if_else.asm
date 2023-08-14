.8086
code SEGMENT
  ASSUME CS:code, DS:code, SS:code
  ORG 100h
  START:
    mov ax, 5
    mov bx, 4
    cmp ax, bx
    
    jne T
      mov ah, 9h
      mov dx, offset msg1
      int 21h
      jmp E
    T:
      mov ah, 9h
      mov dx, offset msg2
      int 21h  

    E:
    int 20h

    msg1 db 'Values are equal!$'
    msg2 db 'Values are not equal!$'
code ends
end START


--- 
Tutorial

.8086
code SEGMENT
  ASSUME CS:code, DS:code, SS:code
  ORG 100h
  START:
    mov ax, 5
    mov bx, 4
    cmp ax, bx ; команда cmp вычитает из первого операнда второй, нигде не сохраняет результат, а только выставляет флаги в регистре FLAGS
    
    jne T ; jnp == jump if not equal - переход к участку кода по метки(операнду), если операнды последней выполненной команды cmp не равны
      mov ah, 9h ; эта часть кода до метки T выполняется, если условие не выполнено(блок кода else)
      mov dx, offset msg1
      int 21h
      jmp E ; переход по метке, чтобы не выполнять блок кода if
    T: ; блок кода if
      mov ah, 9h
      mov dx, offset msg2
      int 21h  

    E: ; сюда перейдём после блока кода else
    int 20h

    msg1 db 'Values are equal!$'
    msg2 db 'Values are not equal!$'
code ends
end START