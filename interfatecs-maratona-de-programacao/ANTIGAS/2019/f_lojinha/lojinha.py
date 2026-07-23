'''════════════════════════════════════════════════════════════════════════════╗
║ Instituição   :  Faculdade de Tecnologia de São Paulo                        ║
║ Solucionador  :  Lucio Nunes de Lira                                         ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Competição    :  InterFatecs 2019 - 1ª fase                                  ║
║ Programa      :  Problema F - Lojinha                                        ║
║ Linguagem     :  Python 3                                                    ║
║ Compilador    :  CPython (3.7.2)                                             ║
║ Versão        :  A (Rev. 0)                                                  ║
╚════════════════════════════════════════════════════════════════════════════'''

nv = int(input())
t  = 0
for i in range(nv):
    q, v = input().split()
    q = int(q)
    v = float(v)
    t += v * q
print("%.2f" % t)
