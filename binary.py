print("\033c\033[43;30m\n")

class buffers:
    def __init__(self):
        self.bytes=b''
        self.returns=b''
        self.sizes=0
        self.names="file.dat"
        self.chars=0
    def sets(self):
        cc=self.chars
        print(cc)
        c=bytes(chr(cc), 'utf-8')
        self.bytes=c*self.sizes
    def writes(self):
        names=self.names
        
        f1=open(names,"wb")
        
            
            
        f1.write(self.bytes)
        f1.close()

class bins:
    def __init__(self):
        self.bytes=b'\0'*4096
        self.returns=b''
        self.sizes=0
        self.names="file.dat"
    def writes(self):
        names=self.names
        sizes1=int(self.sizes//4096)
        print(sizes1)
        sizes2=int(self.sizes-(sizes1*4096))
        print(sizes2)
        self.returns=self.bytes[:sizes2]
        f1=open(names,"wb")
        if sizes1>0:
            for n in range(sizes1):
            
                f1.write(self.bytes)
        if sizes2>0:
            f1.write(self.returns)
        f1.close()

c=input("give me file name ? ")
a=input("give me size in bytes ? ")
v=0x20 
b=buffers()
b.sizes=int(a)
b.chars=v

b.sets()
b.names=c


b.writes()