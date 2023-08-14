.8086
code SEGMENT
  ASSUME CS:code, DS:code, SS:code
  ORG 100h
  START:
    mov ax, 36
    mov bx, 48

    B:
    push bx
    push ax
    call gcd

    push ax
    mov bx, 10
    xor cx, cx

    digits_to_stack:
      xor dx, dx
      div bx
      add dl, '0'
      push dx
      inc cx
      test ax, ax
      jnz digits_to_stack

    print_digits:
      pop dx
      mov ah, 02h
      int 21h
      dec cx
      cmp cx, 0
      jnz print_digits
    
    pop ax

    int 20h

    gcd proc
      push bp
      mov bp, sp
      mov ax, [bp+4]
      mov bx, [bp+6]

      cmp bx, 0
      je E

      xor dx, dx
      div bx
      mov ax, bx
      mov bx, dx
      jmp B

      E:
      pop bp
      retn 4
      gcd endp
code ends
end START


--- 
Tutorial

.8086
code SEGMENT
  ASSUME CS:code, DS:code, SS:code
  ORG 100h
  START:
    mov ax, 36 ; поместим будущие параметры для функции нахождения НОД двух 16-битных чисел
    mov bx, 48

    B: ; метка для рекурсивного вызова функции
    push bx ; передаём параметры через стек
    push ax
    call gcd ; вызываем процедуоу gcd

    push ax ; сохраняем результат в стек
    mov bx, 10 ; основание СС, в которой хотим напечатать результат - для получения цифр числа будем делить его на 10, пока число не ноль
    xor cx, cx ; обнуляем счётчик цифр числа на печать

    digits_to_stack: ; метка для циклического наполнения стека цифрами числа
      xor dx, dx ; обнуляем регистр, в который поместится остаток от деления
      div bx ; целочисленное деление - ax делится на bx, неполное частное будет в ax, остаток в dx
      add dl, '0' ; смещаем цифру на бинарный код той же цифры в ASCII
      push dx ; сохраняем цифру(уже как код символа цифры) в стек
      inc cx ; увеличиваем счётчик цифр
      test ax, ax ; проверяем, что число не ноль
      jnz digits_to_stack ; повторяем действия, пока не сохраним в стек все символы цифр числа

    print_digits: ; метка для печати символов цифр на экран
      pop dx ; в регистр dx помещаем символ цифры из стека
      mov ah, 02h
      int 21h
      dec cx ; уменьшаем счётчик на единицу
      cmp cx, 0 ; сравниваем счётчик с нулём
      jnz print_digits ; выводим символы цифр, пока они есть в стеке
    
    pop ax ; очищаем стек от результат процедуры

    int 20h ; завершаем программу

    gcd proc ; начало процедуры gcd - алгоритм Евклида (https://en.wikipedia.org/wiki/Euclidean_algorithm)
      push bp ; формируем пролог процедуры - настраиваем указатель bp 
      mov bp, sp
      mov ax, [bp+4] ; перемещаем параметры в регистры
      mov bx, [bp+6]

      cmp bx, 0 ; продолжаем алгоритм Евклида, пока второе число не ноль
      je E ; переходим к завершению, если bx == 0

      xor dx, dx ; обнуляем регистр, в который поместится остаток от деления
      div bx ; целочисленное деление - ax делится на bx, неполное частное будет в ax, остаток в dx
      mov ax, bx ; первым числом становится второе
      mov bx, dx ; вторым числом становится остаток от деления первого числа на второе предыдущей пары
      jmp B ; начинаем процедуру gcd с другими параметрами
      
      E: ; метка для перехода, если нашли gcd
      pop bp ; bp перемещаем на предыдущее место
      retn 4  ; возвращаемся по адресу из стека и смещаем sp на 4
      gcd endp ; процедура закончилась 
code ends
end START