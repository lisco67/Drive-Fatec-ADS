'''════════════════════════════════════════════════════════════════════════════╗
║ Instituição   :  Faculdade de Tecnologia de São Paulo                        ║
║ Solucionador  :  Lucio Nunes de Lira                                         ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Competição    :  InterFatecs 2019 - 1ª fase                                  ║
║ Programa      :  Problema D - Taylor                                         ║
║ Linguagem     :  Python 3                                                    ║
║ Compilador    :  CPython (3.7.2)                                             ║
║ Versão        :  A (Rev. 0)                                                  ║
╚════════════════════════════════════════════════════════════════════════════'''

from math import factorial

def ar(n):
    return n if int(n * 10000) % 10 <= 6 else n + 0.001

def radiano(graus, pi=3.1415):
    return graus * pi / 180

def taylor(R):
    return ar(sum([((-1)**n) * (R**(2*n) / factorial(2*n)) for n in range(6)]))

x = int(input())
t = taylor(radiano(x))
print('%d.%03d' % (int(t), int(t*1000)%1000))
