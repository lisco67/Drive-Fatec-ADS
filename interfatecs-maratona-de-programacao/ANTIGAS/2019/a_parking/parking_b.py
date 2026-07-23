'''════════════════════════════════════════════════════════════════════════════╗
║ Instituição   :  Faculdade de Tecnologia de São Paulo                        ║
║ Solucionador  :  Lucio Nunes de Lira                                         ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Competição    :  InterFatecs 2019 - 1ª fase                                  ║
║ Programa      :  Problema A - Parking Lot                                    ║
║ Linguagem     :  Python 3                                                    ║
║ Compilador    :  CPython (3.7.2)                                             ║
║ Versão        :  B (Rev. 0)                                                  ║
╚════════════════════════════════════════════════════════════════════════════'''

n     = int(input())
linha = [int(x) for x in input().split()]
emc   = linha[0]*60 + linha[1] # Entrada Mais Cedo
smt   = linha[2]*60 + linha[3] # Saída Mais Tarde
for i in range(n-1):
    linha   = [int(x) for x in input().split()]
    entrada = linha[0]*60 + linha[1]
    saida   = linha[2]*60 + linha[3]
    if entrada < emc: emc = entrada
    if saida   > smt: smt = saida
print(smt - emc)
