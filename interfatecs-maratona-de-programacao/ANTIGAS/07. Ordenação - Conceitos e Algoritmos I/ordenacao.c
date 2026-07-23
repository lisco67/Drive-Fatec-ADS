/*
╔══════════════════════════════════════════════════════════════════════════════╗
║ Instituição   :  Faculdade de Tecnologia de São Paulo                        ║
║ Departamento  :  Tecnologia da Informação                                    ║
║ Curso         :  Análise e Desenvolvimento de Sistemas                       ║
║ Autor         :  Lucio Nunes de Lira                                         ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Palestra      :  Ordenação: Conceitos & Algoritmos                           ║
║ Programa      :  Algoritmos de ordenação por comparação                      ║
║ Linguagem     :  C99                                                         ║
║ Compilador    :  Pelles C (8.00.60)                                          ║
║ Versão        :  A (Rev. 0)                                                  ║
╚══════════════════════════════════════════════════════════════════════════════╝
*/

#include <stdio.h>
#include <stdlib.h>

typedef int Tipo;

/*────────────────────────────────────────────────
 Funções auxiliares
────────────────────────────────────────────────*/
int aleatorio(int i, int f) {
    return rand() % (f - i + 1) + i;
}

int crescente(Tipo v[], int n) {
    int i = 1;
    while (i < n && v[i-1] <= v[i]) i++;
    return i == n;
}

void troca(Tipo v[], int i, int j) {
    Tipo x = v[i];
    v[i] = v[j];
    v[j] = x;
}

/*────────────────────────────────────────────────
 Bubble Sort
────────────────────────────────────────────────*/
void empurra(Tipo v[], int n) {
    for (int i = 0; i < n-1; i++)
        if (v[i] > v[i+1]) troca(v, i, i+1);
}

void bubble_sort(Tipo v[], int n) {
    for (int i = n; i > 1; i--) empurra(v, i);
}

/*────────────────────────────────────────────────
 Selection Sort
────────────────────────────────────────────────*/
int seleciona(Tipo v[], int n) {
    int m = 0;
    for (int i = 1; i < n; i++)
        if (v[i] > v[m]) m = i;
    return m;
}

void selection_sort(Tipo v[], int n) {
    for (int i = n; i > 1; i--) {
        int m = seleciona(v, i);
        troca(v, i-1, m);
    }
}

/*────────────────────────────────────────────────
 Insertion Sort
────────────────────────────────────────────────*/
void insere(Tipo x, Tipo v[], int n) {
    int i = n-2;
    while (i >= 0 && x < v[i]) {
        v[i+1] = v[i];
        i--;
    }
    v[i+1] = x;
}

void insertion_sort(Tipo v[], int n) {
    for (int i = 1; i < n; i++) insere(v[i], v, i+1);
}

/*────────────────────────────────────────────────
 Merge Sort
────────────────────────────────────────────────*/
void intercala(Tipo v[], int i, int m, int f) {
    int a = i, b = m+1, c = 0;
    Tipo *w = malloc((f-i+1) * sizeof(Tipo));
    while (a <= m && b <= f) w[c++] = v[a] <= v[b] ? v[a++] : v[b++];
    while (a <= m) w[c++] = v[a++];
    while (b <= f) w[c++] = v[b++];
	while (i <= f) v[f--] = w[--c];
    free(w);
}

void merge_sort(Tipo v[], int i, int f) {
    if (i == f) return;
    int m = (i + f) / 2;
    merge_sort(v, i, m);
    merge_sort(v, m+1, f);
    intercala(v, i, m, f);
}

/*────────────────────────────────────────────────
 Quick Sort (determinístico/probabilístico)
────────────────────────────────────────────────*/
int particiona(Tipo v[], int i, int f) {
    //troca(v, i, aleatorio(i, f));
    int e = i+1, d = f;
    while (e <= d) {
        while (e <= d && v[e] <= v[i]) e++;
        while (v[d] > v[i]) d--;
        if (e < d) {
            troca(v, e, d);
            e++;
            d--;
        }
    }
    troca(v, i, d);
    return d;
}

void quick_sort(Tipo v[], int i, int f) {
    if (i >= f) return;
    int p = particiona(v, i, f);
    quick_sort(v, i, p-1);
    quick_sort(v, p+1, f);
}

/*────────────────────────────────────────────────
 Testes
────────────────────────────────────────────────*/
int main(void) {
    int n = 10000;
    Tipo *v = malloc(n * sizeof(Tipo));
    Tipo *w = malloc(n * sizeof(Tipo));
    
    for (int i = 0; i < n; i++) w[i] = aleatorio(0, n-1);
    
    for (int i = 0; i < n; i++) v[i] = w[i];
    printf("crescente: %s\n", crescente(v, n) ? "sim" : "nao");
    
    bubble_sort(v, n);
    printf("crescente: %s\n", crescente(v, n) ? "sim" : "nao");
    
	for (int i = 0; i < n; i++) v[i] = w[i];
    selection_sort(v, n);
    printf("crescente: %s\n", crescente(v, n) ? "sim" : "nao");
    
	for (int i = 0; i < n; i++) v[i] = w[i];
    insertion_sort(v, n);
    printf("crescente: %s\n", crescente(v, n) ? "sim" : "nao");
 
    for (int i = 0; i < n; i++) v[i] = w[i];
    merge_sort(v, 0, n-1);
    printf("crescente: %s\n", crescente(v, n) ? "sim" : "nao");
 
    for (int i = 0; i < n; i++) v[i] = w[i];
    quick_sort(v, 0, n-1);
    printf("crescente: %s\n", crescente(v, n) ? "sim" : "nao");
    
	return 0;
}
