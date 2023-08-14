.8086
code SEGMENT
  ASSUME CS:code, DS:code, SS:code
  ORG 100h
  START:
    int 20h

    num dw 255
    empt dw ?
    nums dw 1,2,3,4
    msg db 'Hello world!$'
    same_msg db 'H','e','l','l','o',' ','w','o','r','l','d','!','$'
    nums_dup db 3 DUP (5)
    emp_dup db 3 DUP (?)
code ends
end START


--- 
Tutorial

.8086
code SEGMENT
  ASSUME CS:code, DS:code, SS:code
  ORG 100h
  START:
    int 20h

    num dw 255 ; выделяем 2 байта на число 255, адрес на начало выделенной памяти в виде метки num
    empt dw ? ; выделяем два пустых байта
    nums dw 1,2,3,4 ; выделяем непрерывную часть памяти и заполняем данными, метка nums указывает на первый элемент
    msg db 'Hello world!$' ; выделяем часть памяти под символы - в каждый байт по символу
    same_msg db 'H','e','l','l','o',' ','w','o','r','l','d','!','$' ; длинный вариант предыдущей строчки - вручную заполняем байты
    nums_dup db 3 DUP (5) ; выделяем три байта, которые заполняем пятёрками
    emp_dup db 3 DUP (?) ; выделяем три пустых байта
code ends
end START