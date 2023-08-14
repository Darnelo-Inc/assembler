.8086
code SEGMENT
  ASSUME CS:code, DS:code, SS:code
  ORG 100h
  START:
    mov ax, 10
    push ax

    mov ax, 5
    mov bx, 11
    push bx
    push ax

    call sum

    mov cx, ax
    pop ax

    int 20h

    sum proc
      push bp
      mov bp, sp
      ; sub sp, 4
      ; mov [bp-2], ax
      ; mov [bp-4], bx

      mov ax, [bp+4]
      mov bx, [bp+6]
      add ax, bx

      pop bp
      retn 4
    sum endp    
code ends
end START


--- 
Tutorial

.8086
code SEGMENT
  ASSUME CS:code, DS:code, SS:code
  ORG 100h
  START:
    mov ax, 10 ; имитируем, что в регистре ax хранятся данные
    push ax ; нужно поработать с регистром ax, но информация в нём нужная - временно сохраним её в регистр

    mov ax, 5 ; поместим будущие параметры для функции сложения двух 16-битных чисел
    mov bx, 11
    push bx ; помещаем параметры в стек(напрямую значения в стек помещать нельзя)
    push ax

    call sum ; вызываем процедуру sum(команда call сама сохранит адрес возврата в стек и перейдёт к коду процедуры)

    mov cx, ax ; сохраним результат процедуры в другой регистр, чтобы "вернуть на место" значение из ax
    pop ax ; возвращаем значени из стека

    int 20h

    sum proc ; объявляем процедуру sum
      push bp ; запоминаем адрес текущего bp - формируем фрейм вызова
      mov bp, sp ; поднимаем bp на уровень sp
      ; sub sp, 4 ; вариант формирование локальных переменных - через стек
      ; mov [bp-2], ax
      ; mov [bp-4], bx

      mov ax, [bp+4] ; переданные параметры передаём в регистры
      mov bx, [bp+6]
      add ax, bx ; складываем числа
      
      pop bp ; bp перемещаем на предыдущее место
      retn 4 ; возвращаемся по адресу из стека и смещаем sp на 4
    sum endp ; процедура закончилась
code ends
end START