N=int(input())

minH = 24
minM= 60
maxH = -1
maxM = -1

for i in range(N):
    HE,ME,HS,MS=input().split()
    HE,ME,HS,MS=int(HE),int(ME),int(HS),int(MS)

    if HE <= minH:
        minH = HE
        if ME <= minM:
            minM = ME

    if HS > maxH:
        maxH = HS
        maxM = MS
        
    if HS >= maxH:
        maxH = HS
        if MS >= maxM:
            maxM = MS
            
conta = ((maxH - minH)*60) + (maxM-minM)
print(conta)
