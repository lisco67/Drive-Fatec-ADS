'''════════════════════════════════════════════════════════════════════════════╗
║ Instituição   :  Faculdade de Tecnologia de São Paulo                        ║
║ Solucionador  :  Lucio Nunes de Lira                                         ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Competição    :  InterFatecs 2019 - 1ª fase                                  ║
║ Programa      :  Problema K - Bochas                                         ║
║ Linguagem     :  Python 3                                                    ║
║ Compilador    :  CPython (3.7.2)                                             ║
║ Versão        :  A (Rev. 0)                                                  ║
╚════════════════════════════════════════════════════════════════════════════'''

from math import sqrt

def remove_iguais(b, v):
    while b != [] and b[0] == v[0]:
        del b[0]
        del v[0]

n, t = [int(x) for x in input().split()]

total_brancas = 0
total_vermelhas = 0

for i in range(t):
    x_bolim, y_bolim = [int(x) for x in input().split()]

    brancas = []
    vermelhas = []

    for j in range(n):
        x_branca, y_branca = [int(x) for x in input().split()]
        distancia = sqrt((x_branca-x_bolim)**2 + (y_branca-y_bolim)**2)
        brancas.append(distancia)

    for j in range(n):
        x_vermelha, y_vermelha = [int(x) for x in input().split()]
        distancia = sqrt((x_vermelha-x_bolim)**2 + (y_vermelha-y_bolim)**2)
        vermelhas.append(distancia)

    brancas.sort()
    vermelhas.sort()

    remove_iguais(brancas, vermelhas)

    pontos_brancas = 0
    pontos_vermelhas = 0

    if brancas != []:
        j = 0
        if brancas[0] < vermelhas[0]:
            while j < len(brancas) and brancas[j] < vermelhas[0]:
                pontos_brancas += 1
                j += 1
        else:
            while j < len(vermelhas) and vermelhas[j] < brancas[0]:
                pontos_vermelhas += 1
                j += 1

    total_brancas += pontos_brancas
    total_vermelhas += pontos_vermelhas

print('PONTOS DAS BOCHAS BRANCAS = %d' % total_brancas)
print('PONTOS DAS BOCHAS VERMELHAS = %d' % total_vermelhas)
print('VENCEDOR: BOCHAS', 'BRANCAS' if total_brancas > total_vermelhas else 'VERMELHAS')
