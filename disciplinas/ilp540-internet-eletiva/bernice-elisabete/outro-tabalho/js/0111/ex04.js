function aluno(nome, mat, curso){
  class Aluno {
    constructor() {
      this.nome = null; 
      this.curso = null;
      this.matricula = null;
    }
  }

  let aluno1 = new Aluno(); 
  aluno1.nome = document.getElementById('nome').value;
  aluno1.curso = document.getElementById('curso').value;
  aluno1.matricula = document.getElementById('mat').value;

  document.write(aluno1.nome + "<br>");
  document.write(aluno1.curso + "<br>");
  document.write(aluno1.matricula + "<br>");
}
