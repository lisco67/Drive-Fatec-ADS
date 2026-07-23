flag = False
Q,X=input().split()
X=int(X)
if Q == "V":
    flag=True
V=0
A=0
for i in range(X):
    money=int(input())
    if flag:
        flag=False
        A=A+money
    else:
        flag=True
        V=V+money

print("VOCE: %d AMIGO: %d"%(A,V))


