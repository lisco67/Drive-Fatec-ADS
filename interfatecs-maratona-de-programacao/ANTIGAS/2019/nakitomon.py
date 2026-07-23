n=int(input())
Z=0
X=0
Y=0
dan=[]
sil=[]
for x in range(n*2):
    a,b,c,d=input().split()
    a,b,c,d=int(a),int(b),int(c),int(d)
    if n>x:
        dan.append(a)
        dan.append(b)
        dan.append(c)
        dan.append(d)
    else:
        sil.append(a)
        sil.append(b)
        sil.append(c)
        sil.append(d)  

for i in range(0,(len(dan)-1),4):
    if dan[i]==sil[i]:
        if dan[i+1]==sil[i+1]:
            if dan[i+2]==sil[i+2]:
                if dan[i+3]==sil[i+3]:
                    Z+=1
                if dan[i+3]>sil[i+3]:
                    X+=1
                if dan[i+3]<sil[i+3]:
                    Y+=1
                    
            if dan[i+2]>sil[i+2]:
                X+=1
            if dan[i+2]<sil[i+2]:
                Y+=1    
        if dan[i+1]>sil[i+1]:
            X+=1
        if dan[i+1]<sil[i+1]:
            Y+=1
    if dan[i]>sil[i]:
        X+=1
    if dan[i]<sil[i]:
        Y+=1
print("danette venceu: %d"%X)
print("silvio venceu: %d"%Y)
print("empates: %d"%Z)
