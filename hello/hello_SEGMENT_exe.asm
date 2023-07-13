.8086
code SEGMENT para USE16 PUBLIC 'code'
  ASSUME CS: code, DS: data, SS:stack
  START:
    mov ax, data
    mov ds, ax
    mov ah, 9h
    mov dx, offset message
    int 21h
    mov ax, 4C00h
    int 21h
code ends

data SEGMENT para USE16 PUBLIC 'data'
  message db 'Hello world!$'
data ends

stack SEGMENT para USE16 STACK 'stack'
  db 256 DUP(?)
stack ends
end START


--- 
Tutorial

.8086 // модель процессора по умолчанию  
code SEGMENT para USE16 PUBLIC 'code' // объявили сегмент кода программы, который назвали code и передали дефолтные параметры: смещение, разрядность сегмента, тип, класс 
  ASSUME CS: code, DS: data, SS:stack // связываем сегментные регистры с соответствующими сегментами программы
  START: // метка, обозначающая начало программы
    mov ax, data // перемещаем адрес регистра данных в регистр ax, чтобы переместить потом в регистр сегмента данных ds(перемещать адреса сразу в сегментые регистры запрещено)
    mov ds, ax // перемещаем адрес регистра данных из ax в ds
    mov ah, 9h // перемещение прерывания в регистр прерывания. Конкретно функция под номером 9 выводит строку на экран
    mov dx, offset message // передаем параметр для функции прерывания в регистр параметра
    int 21h // вызов прерывания, которое вызовет функцию из регистра ah со значением регистра dx
    mov ax, 4C00h // особое завершение .exe программ
    int 21h // возвращаем управление на dos
code ends // закрыли сегмент code

data SEGMENT para USE16 PUBLIC 'data' // объявили сегмент данных программы, который назвали data и передали дефолтные параметры: смещение, разрядность сегмента, тип, класс 
  message db 'Hello world!$' // объявление переменной message со значением "Hello world!"
data ends // закрыли сегмент data

stack SEGMENT para USE16 STACK 'stack' // объявили сегмент стека программы, который назвали stack и передали дефолтные параметры: смещение, разрядность сегмента, тип, класс 
  db 256 DUP(?) // выделили под стек 256 пустых байт
stack ends // закрыли сегмент stack
end START // закрыли метку, которая сообщает компилятору о завершении всей программы