'''
Atividade 1 LAOC
Ler um numero decimal entre 0 e 1 ,5 atÃ© 20 bits mostrar Amenor Amaior e o Erro de cada um
'''
decimal=float(input("Digite um valor entre 0 e 1:   "))
valor=decimal #usado na conta do erro
binario=[]
Amenor=0
for i in range(20):
    decimal*=2
    if decimal>=1:
        decimal=decimal-1
        binario.append(1)
    else:
        binario.append(0)
    Amenor+=(2**(-(i+1)))*binario[i]
    
    if ((Amenor-valor)==0):             #quebra o for caso o erro seja nulo
        print("Com %d bit(s) o valor é exato"%(i+1))
        break        
    if(i>=4):
        print("Para %d bits"%(i+1))
        Amaior=Amenor+(2**(-(len(binario))))#Amenor + 1 no ultimo bit
        
        print("Erro do Amenor: %.2f%%   Valor do Amenor:%f"%((abs(Amenor-valor)/valor)*100,Amenor))
        print("Erro do Amaior: %.2f%%   Valor do Amaior:%f"%((abs(Amaior-valor)/valor)*100,Amaior))


