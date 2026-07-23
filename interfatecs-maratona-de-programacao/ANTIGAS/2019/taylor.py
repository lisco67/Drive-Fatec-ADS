def fatorial(n):
    fat=1
    for i in range(1,n+1):
        fat*=i
    return fat

X=int(input())
taylor=0
pi=3.1415
R=(X*pi)/180
for n in range(5):
    taylor+=((-1)**n)*(((R)**(2*n))/(fatorial(2*n)))
taylor=10000*taylor
taylor=taylor//1
talor=taylor%10
if talor>6 and talor<10:
    taylor=taylor+10
taylor=taylor/10000
taylor=1000*taylor
taylor=taylor//1
taylor=taylor/1000
print("%.3f"%(taylor))

