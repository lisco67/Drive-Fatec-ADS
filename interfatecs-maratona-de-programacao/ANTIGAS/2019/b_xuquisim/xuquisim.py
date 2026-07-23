'''════════════════════════════════════════════════════════════════════════════╗
║ Instituição   :  Faculdade de Tecnologia de São Paulo                        ║
║ Solucionador  :  Lucio Nunes de Lira                                         ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Competição    :  InterFatecs 2019 - 1ª fase                                  ║
║ Programa      :  Problema B - Xuquisim                                       ║
║ Linguagem     :  Python 3                                                    ║
║ Compilador    :  CPython (3.7.2)                                             ║
║ Versão        :  A (Rev. 0)                                                  ║
╚════════════════════════════════════════════════════════════════════════════'''

A, L = [int(x) for x in input().split()]
opcoes = {}

for i in range(L):
    num, D = input().split()
    opcoes[int(num)] = D

E = int(input())
decisao = 1

for i in range(E):
    resposta = input()
    decisao = decisao*2+1 if resposta=='true' else decisao*2

print(opcoes[decisao])
