.8086
.model tiny
.code
ORG 100h
    START:
      mov ah, 9h
      mov dx, offset message
      int 21h
      ret
      message db 'Hello world!$'
end START


--- 
Tutorial (многое совпадает с hello_SEGMENT_com)

.8086
.model tiny // объявили модель памяти со значением tiny
.code // объявили единственный сегмент кода
ORG 100h
    START:
      mov ah, 9h
      mov dx, offset message
      int 21h
      ret
      message db 'Hello world!$'
end START