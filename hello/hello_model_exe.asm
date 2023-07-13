.8086
model small
.code
  START:
    mov ax, DGROUP
    mov ds, ax
    mov ah, 9h
    mov dx, offset message
    int 21h
    mov ax, 4C00h
    int 21h

  .data
    message db 'Hello world!$'

  .stack 100h
end START


--- 
Tutorial  (многое совпадает с hello_SEGMENT_exe)

.8086
model small // объявили модель памяти small
.code // объявили сегмент code
  START:
    mov ax, DGROUP // в данной модели данных сегмент данных и сегмент стека объединены в группу DGROUP
    mov ds, ax
    mov ah, 9h
    mov dx, offset message
    int 21h
    mov ax, 4C00h
    int 21h

  .data // объявили сегмент data
    message db 'Hello world!$'

  .stack 100h // объявили сегмент stack с размером 100h(==256 байт)
end START