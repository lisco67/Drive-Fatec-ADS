'''════════════════════════════════════════════════════════════════════════════╗
║ Instituição   :  Faculdade de Tecnologia de São Paulo                        ║
║ Solucionador  :  Lucio Nunes de Lira                                         ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Competição    :  InterFatecs 2019 - 1ª fase                                  ║
║ Programa      :  Problema H - Nakitomon Cards                                ║
║ Linguagem     :  Python 3                                                    ║
║ Compilador    :  CPython (3.7.2)                                             ║
║ Versão        :  A (Rev. 0)                                                  ║
╚════════════════════════════════════════════════════════════════════════════'''

def quem_ganhou(a, b):
    for i in range(4):
        if a[i] > b[i]:
            return 'a'
        elif b[i] > a[i]:
            return 'b'
    return 'e'

n = int(input())
jog_a = []
jog_b = []

for i in range(n):
    carta = [int(x) for x in input().split()]
    jog_a.append(carta)

for i in range(n):
    carta = [int(x) for x in input().split()]
    jog_b.append(carta)

jog_a.sort(key=lambda x: x[3], reverse=True)
jog_a.sort(key=lambda x: x[2], reverse=True)
jog_a.sort(key=lambda x: x[1], reverse=True)
jog_a.sort(key=lambda x: x[0], reverse=True)

jog_b.sort(key=lambda x: x[3], reverse=True)
jog_b.sort(key=lambda x: x[2], reverse=True)
jog_b.sort(key=lambda x: x[1], reverse=True)
jog_b.sort(key=lambda x: x[0], reverse=True)

a_ganhou = 0
b_ganhou = 0
empates = 0

for i in range(n):
    resultado = quem_ganhou(jog_a[i], jog_b[i])
    if resultado == 'a':
        a_ganhou += 1
    elif resultado == 'b':
        b_ganhou += 1
    else:
        empates += 1
print('danette venceu:', a_ganhou)
print('silvio venceu:', b_ganhou)
print('empates:', empates)
