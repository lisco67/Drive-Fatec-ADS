'''
╔══════════════════════════════════════════════════════════════════════════════╗
║ Instituição   :  Faculdade de Tecnologia de São Paulo                        ║
║ Departamento  :  Tecnologia da Informação                                    ║
║ Curso         :  Análise e Desenvolvimento de Sistemas                       ║
║ Autor         :  Lucio Nunes de Lira                                         ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Palestra      :  Flood-fill: Preenchimento em Profundidade                   ║
║ Programa      :  Codificações de preenchimento em profundidade               ║
║ Linguagem     :  Python 3                                                    ║
║ Compilador    :  CPython (3.6.4)                                             ║
║ Versão        :  A (Rev. 0)                                                  ║
╚══════════════════════════════════════════════════════════════════════════════╝
'''

def exibe(p):
    for linha in p: print(linha)

def busca_1(p, l, c):
    if p[l][c] == 'S': return True
    if p[l][c] != 'L' and p[l][c] != 'E': return False
    p[l][c] = '!'
    exibe(p)
    print()
    return  busca_1(p,l-1,c) or \
            busca_1(p,l,c+1) or \
            busca_1(p,l+1,c) or \
            busca_1(p,l,c-1)

def busca_2(p, l, c):
    pilha = []
    pilha.append((l,c))
    while pilha != []:
        l,c = pilha.pop()
        if p[l][c] == 'S': return True
        if p[l][c] != 'L' and p[l][c] != 'E': continue
        p[l][c] = '!'
        pilha.append((l,c-1)) # esquerda
        pilha.append((l+1,c)) # baixo
        pilha.append((l,c+1)) # direita
        pilha.append((l-1,c)) # cima
    return False

(lin, col) = input().split()
(lin, col) = (int(lin), int(col))
p = []
for i in range(lin): p.append(input().split())
exibe(p)
print('Encontrou a saída: ', busca_1(p, 1, 1))
exibe(p)
