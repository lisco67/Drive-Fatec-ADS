'''
IEEE754 2.0
'''
def converter_hex(tamanho):
    n=0
    expoente=3
    for i in range(1,tamanho+1):
        n=n+((2**expoente)*IEEE754[(i-1)])
        expoente=expoente-1
        if(i%4==0 and i>0):
            if n>9:
                valores_hex(n)
            else:
                HEX.append(n)
            n=0
            expoente=3
            
def valores_hex(n):
    if n==10:HEX.append("A")
    elif n==11:HEX.append("B")
    elif n==12:HEX.append("C")
    elif n==13:HEX.append("D")
    elif n==14:HEX.append("E")
    else:HEX.append("F")
    
def tamanho_lista(n):
    x=[]
    for i in range(n):
        x.append(0)
    return x
        
def checar_tamanho_inteiro(n):
    tamanho=0
    while n>=(2**tamanho):
        tamanho=tamanho+1
    return tamanho

def converter_inteiro(n):
    for i in range(len(inteiroo),0,-1):
        if((n%2)==0):
            inteiroo[i-1]=0
        else:
            inteiroo[i-1]=1  
        n=n//2

def converter_decimal(n,flag):
    if flag:
        for i in range(len(decimall)):
            n=n*2
            if n>=1:
                n=n-1
                decimall[i]=1
            else:
                decimall[i]=0
    else:
        norm=0
        for i in range(len(decimall)):
            n=n*2
            norm=norm-1
            if n>=1:
                flag=True
                n=n-1
                converte_exp(norm,len(expoente))
                converter_decimal(n,flag)
                break
        
def converte_exp(n,exp):
    n=n+((2**(exp-1)-1))
    for i in range(exp,0,-1):
        if(n%2==0):
            expoente[i-1]=0
        else:
            expoente[i-1]=1
        n=n//2

if(int(input("Digite 64 para 64 bits e 32 para 32bits:"))==64):
    man,exp=52,11
else:
    man,exp=23,8

HEX=[]
sinal=[]
expoente=tamanho_lista(exp)
flag=True
numero=float(input("Escreva um número:"))

if numero<0:
    sinal.append(1)
    numero=-numero
else:sinal.append(0)
      
inteiro=numero//1
tamanho_inteiro=checar_tamanho_inteiro(inteiro)
inteiroo=tamanho_lista(tamanho_inteiro)
decimal=numero-inteiro
decimall=tamanho_lista(man-(tamanho_inteiro-1))

if tamanho_inteiro==0:
    flag=False

if flag:
    converte_exp(tamanho_inteiro-1,len(expoente))#
    converter_inteiro(inteiro)
    converter_decimal(decimal,flag)
    mantissa=inteiroo[1:]+decimall
else:
    converter_decimal(decimal,flag)
    decimall=decimall[:len(decimall)-1:]
    mantissa=decimall

IEEE754=sinal+expoente+mantissa
print(IEEE754,len(IEEE754))
converter_hex(len(IEEE754))
print(HEX)
