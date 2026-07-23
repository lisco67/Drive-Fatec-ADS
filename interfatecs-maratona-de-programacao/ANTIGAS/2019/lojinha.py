soma=0
N=int(input())
for i in range(N):
    NV,V=input().split()
    NV,V=int(NV),float(V)
    soma+=NV*V
print("%.2f"%(soma))
