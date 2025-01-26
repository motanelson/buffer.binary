print("\033c\033[43;30m\n")
a=b'hello world'
a=a+b'\n'
c=1
a=a+bytearray([c])
print (a.decode('ascii'))
f1=open("my.dat","wb")
f1.write(a)
f1.close()
