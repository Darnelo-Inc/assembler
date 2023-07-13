.8086
code SEGMENT para USE16 PUBLIC 'code'
    ASSUME CS:code, DS:code, SS:code, ES:code
    ORG 100h
    START:
      mov ah, 9h
      mov dx, offset message
      int 21h
      ret
      message db 'Hello, World!$'
code ends
end START


--- 
Tutorial

.8086 // модель процессора по умолчанию                             
code SEGMENT para USE16 PUBLIC 'code' // объявили единственный сегмент программы, который назвали code и передали дефолтные параметры: смещение, разрядность сегмента, тип, класс
    ASSUME CS:code, DS:code, SS:code, ES:code // связываем сегментные регистры с единственным сегментом программы
    ORG 100h // сдвинаем программу на её начало
    START: // метка, обозначающая начало программы
      mov ah, 9h // перемещение прерывания в регистр прерывания. Конкретно функция под номером 9 выводит строку на экран
      mov dx, offset message // передаем параметр для функции прерывания в регистр параметра
      int 21h // вызов прерывания, которое вызовет функцию из регистра ah со значением регистра dx
      ret // возвращаем управление на dos
      message db 'Hello world!$' // объявление переменной message со значением "Hello world!"
code ends // закрыли сегмент code
end START // закрыли метку, которая сообщает компилятору о завершении всей программы
