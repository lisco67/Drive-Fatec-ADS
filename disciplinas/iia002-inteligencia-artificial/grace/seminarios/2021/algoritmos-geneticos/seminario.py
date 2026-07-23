import random
# Números de indivíduos a cada geração
POPULATION_SIZE = 100
# Genes Válidos
GENES = '''abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOP
QRSTUVWXYZ 1234567890, .-;:_!"#%&/()=?@${[]}'''
# Estado Meta
TARGET = "ALGORITMOS GENETICOS"
#Essa classe representa o individuo em uma população
class Individual(object):
    def __init__(self, chromosome):
        self.chromosome = chromosome 
        self.fitness = self.cal_fitness()
    @classmethod
#Cria genes aleatorios para a mutação
    def mutated_genes(self):
        global GENES
        gene = random.choice(GENES)
        return gene
    @classmethod
#Cria cromossomos(string de genes)
    def create_gnome(self):
        global TARGET
        gnome_len = len(TARGET)
        return [self.mutated_genes() for _ in range(gnome_len)]
#Realiza o cruzamento(crossover)
    def mate(self, par2):
# cromossomo para descendência
        child_chromosome = []
        for gp1, gp2 in zip(self.chromosome, par2.chromosome):
            prob = random.random()
# Se a probabilidade for menor que 45%, insere um gene para o primeiro genitor
            if prob < 0.45:
                child_chromosome.append(gp1)
# Se a probabilidade for entre 45% e 90%, insere um gene para o segundo genitor
            elif prob < 0.90:
                child_chromosome.append(gp2)
# Se não for nenhum nem outro insere um gene mutável para manter a diversidade
            else:
                child_chromosome.append(self.mutated_genes())
# Cria um novo indivíduo usando os cromossomo da prole
        return Individual(child_chromosome)
#Calcula a aptidão, que nesse caso é o número de caracteres na string que diferem da string de destino.
    def cal_fitness(self):
        global TARGET
        fitness = 0
        for gs, gt in zip(self.chromosome, TARGET):
            if gs != gt: fitness+= 1
        return fitness
def main():
    global POPULATION_SIZE
#Numero da geração
    generation = 1
    found = False
    population = []
#Cria a primeira população
    for _ in range(POPULATION_SIZE):
                gnome = Individual.create_gnome()
                population.append(Individual(gnome))
    while not found:
# classifica a população em ordem crescente de pontuação de aptidão
        population = sorted(population, key = lambda x:x.fitness)
# Se um indivíduo tem uma baixa aptidão, quer dizer que chegamos ao resultado e podemos parar o programa 
        if population[0].fitness <= 0:
            found = True
            break
# Se não,criamos a nova geração
        new_generation = []
# Seleciona 10% da população mais apta para a nova geração
        s = int((10*POPULATION_SIZE)/100)
        new_generation.extend(population[:s])
# Para 90% dos indivíduos aptos, executa cruzamento
        s = int((90*POPULATION_SIZE)/100)
        for _ in range(s):
            parent1 = random.choice(population[:50])
            parent2 = random.choice(population[:50])
            child = parent1.mate(parent2)
            new_generation.append(child)
        population = new_generation
        print("Generation: {}\tString: {}\tFitness: {}".\
              format(generation,
              "".join(population[0].chromosome),
              population[0].fitness))
        generation += 1
    print("Generation: {}\tString: {}\tFitness: {}".\
          format(generation,
          "".join(population[0].chromosome),
          population[0].fitness))

if __name__ == '__main__':
    main()
