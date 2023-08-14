.8086
code SEGMENT
  ASSUME CS:code, DS:code, SS:code
  ORG 100h
  START:
    mov ax, 2
    mov ax, bx
    mov ax, ds:0001h
    mov ax, num
    mov ah, byte ptr num

    mov word ptr num, ax
    mov ax, offset num
    mov ax, [bp]
    mov ax, [bp+2]

  ; Errors
  ; mov ax, 65536
  ; mov ax, bh
  ; mov ds, cs
  ; mov ds, 5
  ; mov ax, num
  ; mov var1, var2

  int 20h
  
  num dw 0003h
  short_num db 3
  var1 db 1
  var2 db 2
code ends
end START


--- 
Tutorial

.8086
code SEGMENT
  ASSUME CS:code, DS:code, SS:code
  ORG 100h
  START:
    mov ax, 2 ; в регистр ax положили непосредственно значение
    mov ax, bx ; скопировали значение из регистра bx в регистр ax
    mov ax, ds:0001h ; вместо регистра можно указать логический адрес
    mov ax, num ; скопировали значение переменной в регистр
    mov ah, byte ptr num ; скопировали часть переменной в старший регистр ah регистра ax

    mov word ptr num, ax ; скопировали данные из регистра в переменную num
    mov ax, offset num ; адрес начала данных в num скопировали в регистр
    mov ax, [bp] ; в регистр ax поместили данные, которые расположены по адресу, хранимом в bp
    mov ax, [bp+2] ; по адресу, смещенному в сторону увеличения адресов на 2 байта

  ; Errors следующие примеры выдадут ошибки компиляции
  ; mov ax, 65536 ; в регистре будут нули, так как только часть из нулей поместится в 16 бит(число 17-битное)
  ; mov ax, bh ; ассемблер не знает, в старший или во младший регистр копировать
  ; mov ds, cs ; между сегментными регистрами данные не передаются
  ; mov ds, 5 ; в сегментные регистры можно только из других регистров
  ; mov ax, short_num ; размер переменной и регистра отличаются, нужно использовать ptr
  ; mov var1, var2 ; нельзя копировать данные из памяти в память

  int 20h
  
  num dw 0003h
  short_num db 3
  var1 db 1
  var2 db 2
code ends
end START