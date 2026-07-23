'''
╔══════════════════════════════════════════════════════════════════════════════╗
║ Instituição   :  Faculdade de Tecnologia de São Paulo                        ║
║ Departamento  :  Tecnologia da Informação                                    ║
║ Curso         :  Análise e Desenvolvimento de Sistemas                       ║
║ Autor         :  Lucio Nunes de Lira                                         ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Palestra      :  Ordenação: Conceitos & Algoritmos                           ║
║ Programa      :  Algoritmos de ordenação por comparação                      ║
║ Linguagem     :  Python 3                                                    ║
║ Compilador    :  CPython (3.6.5)                                             ║
║ Versão        :  A (Rev. 1)                                                  ║
╚══════════════════════════════════════════════════════════════════════════════╝
'''

import random
random.seed()

'''───────────────────────────────────────────────
 Funções auxiliares
───────────────────────────────────────────────'''
def aleatorio(i, f):
    return random.randint(i, f)

def crescente(v, n):
    i = 1
    while i < n and v[i-1] <= v[i]: i += 1
    return i == n

def troca(v, i, j):
    v[i],v[j] = v[j],v[i]

'''───────────────────────────────────────────────
 Bubble Sort
───────────────────────────────────────────────'''
def empurra(v, n):
    for i in range(n-1):
        if v[i] > v[i+1]: troca(v, i, i+1)

def bubble_sort(v, n):
    for i in range(n, 1, -1): empurra(v, i)

'''───────────────────────────────────────────────
 Selection Sort
───────────────────────────────────────────────'''
def seleciona(v, n):
    m = 0
    for i in range(1, n):
        if v[i] > v[m]: m = i
    return m

def selection_sort(v, n):
    for i in range(n, 1, -1):
        m = seleciona(v, i)
        troca(v, i-1, m)
        
'''───────────────────────────────────────────────
 Insertion Sort
───────────────────────────────────────────────'''
def insere(x, v, n):
    i = n-2
    while i>=0 and x<v[i]:
        v[i+1] = v[i]
        i -= 1
    v[i+1] = x

def insertion_sort(v, n):
    for i in range(1, n): insere(v[i], v, i+1)

'''───────────────────────────────────────────────
 Heap Sort
───────────────────────────────────────────────'''
def desce(i, v, n):
    while 2*i + 1 < n: # enquanto há filho a esquerda
        j = 2*i + 1    # guarda o índice do filho da esquerda
        if j+1 < n and v[j+1] > v[j]: j += 1 # se há filho da direita e ele é maior que o da esquerda, guarda o índice dele 
        if v[i] >= v[j]: break # se o pai é maior ou igual ao índice do maior filho, não há o que corrigir
        troca(v, i, j) # troca-se o pai e o filho de posição (o pai é rebaixado)
        i = j          # agora corrigiremos o pai a partir de sua nova posição (antigo índice do filho)

def amontoa(v):
    n = len(v)
    for i in reversed(range(0, n//2)): # parte do último pai e vai voltando
        desce(i, v, n) # ajusta o pai na posição correta

def heap_sort(v):
    amontoa(v) # transforma o vetor em um heap
    n = len(v) # guarda o tamanho do heap
    for i in reversed(range(1, n)): # para cada posição do heap (começando da última)
        troca(v, 0, i) # troca o item máximo com o último do vetor
        desce(0, v, i) # corrigi o item do topo

'''───────────────────────────────────────────────
 Tree Sort
───────────────────────────────────────────────'''
def insere_arvore(x, a):
    if a == None: return (None, x, None)
    if x <= a[1]: return (insere_arvore(x, a[0]), a[1], a[2])
    return (a[0], a[1], insere_arvore(x, a[2]))

def lista_para_arvore(v):
    a = None
    for x in v: a = insere_arvore(x, a)
    return a

def arvore_para_lista(a):
    if a == None: return []
    return arvore_para_lista(a[0]) + [a[1]] + arvore_para_lista(a[2])

def tree_sort(v):
    w = arvore_para_lista(lista_para_arvore(v))
    for i in range(len(w)): v[i] = w[i]

'''───────────────────────────────────────────────
 Merge Sort
───────────────────────────────────────────────'''
def intercala(v, i, m, f):
    a = i
    b = m+1
    w = []
    while a <= m and b <= f:
        if v[a] <= v[b]:
            w.append(v[a])
            a += 1
        else:
            w.append(v[b])
            b += 1
    while a <= m:
        w.append(v[a])
        a += 1
    while b <= f:
        w.append(v[b])
        b += 1
    for e in w:
        v[i] = e
        i += 1

def merge_sort(v, i, f):
    if i == f: return
    m = (i + f) // 2
    merge_sort(v, i, m)
    merge_sort(v, m+1, f)
    intercala(v, i, m, f)

'''───────────────────────────────────────────────
 Quick Sort (determinístico/probabilístico)
───────────────────────────────────────────────'''
def particiona(v, i, f):
    #troca(v, i, aleatorio(i, f))
    e = i+1
    d = f
    while e <= d:
        while e <= d and v[e] <= v[i]: e += 1
        while v[d] > v[i]: d -= 1
        if e < d:
            troca(v, e, d)
            e += 1
            d -= 1
    troca(v, i, d)
    return d

def quick_sort(v, i, f):
    if i >= f: return
    p = particiona(v, i, f)
    quick_sort(v, i, p-1)
    quick_sort(v, p+1, f)

'''───────────────────────────────────────────────
 Da própria linguagem
───────────────────────────────────────────────'''
v = [aleatorio(1,2**32) for i in range(10**5)]

# Feito no próprio vetor.
v.sort()
v.sort(reverse=True)
v.sort(key=lambda x: x[0])

# Feito em uma cópia do vetor original.
w = sorted(v)
w = sorted(v, reverse=True)
w = sorted(v, key=lambda x: x[0])
