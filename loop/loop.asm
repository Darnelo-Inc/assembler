.8086
code SEGMENT
  ASSUME CS:code, DS:code, SS:code
  ORG 100h
  START:
    mov cx, len
    mov ah, 02h
    mov si, offset msg
    mov bx, 0

    L:
      mov dl, [si+bx]
      inc bx
      int 21h

      dec cx
      cmp cx, 0
      jne L

    int 20h

    msg db 'hello'
    len equ $ - msg
code ends
end START


--- 
Tutorial

.8086
code SEGMENT
  ASSUME CS:code, DS:code, SS:code
  ORG 100h
  START:
    mov cx, len ; сохраняем в регистр счётчика длину строки, буквы которой выведем через цикл
    mov ah, 02h ; сохраним в старший регистр ah регистра ax функция для вывода символов на экран
    mov si, offset msg ; в регистр si помещаем адрес начала переменной msg
    mov bx, 0 ; в регистре bx будем хранить индекс выводимой буквы

    L: ; метка для циклического выполнения блока кода
      mov dl, [si+bx] ; функция вывода символов на экран возьмёт из регистра dl данные для вывода - в данном случае букву под адресу si со смещением bx
      inc bx ; смещаем индекс на следующую букву
      int 21h ; вызываем функцию 21-го прерывания
        ; следующие три строки можно заменить на loop L
      dec cx ; уменьшаем счётчик на единицу
      cmp cx, 0 ; сравниваем счётчик с нулём
      jne L ; переходим на метку L, если операнды прошлой команды cmp не равны - счётчик больше нуля

    int 20h ; заканчиваем выполнение программы

    msg db 'hello' ; определили строку без доллара, так как больше пяти символом выведено не будет
    len equ $ - msg ; определили константу len, знак доллара указывает на текущий адрес(на адрес ячейки, следующий после буквы 'o' переменной msg)
code ends
end START