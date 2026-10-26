import 'package:flutter_test/flutter_test.dart';

abstract class Pessoa{
  late int _id;
  String nome;
  Pessoa(this.nome);
  int get id => _id;
  set id(int id) {
    if(id>0){_id=id;}else{throw ArgumentError('Identificador deve ser não negativo.');}
  }
}
mixin Ano{
  late int _ano;
  int get ano => _ano;
  set ano(int ano) {
    if(ano>0){_ano=ano;}else{throw ArgumentError('Ano deve ser não negativo.');}
  }
}
class Aluno extends Pessoa with Ano{
  Aluno(super.nome,int ano){this.ano=ano;}
}
class Disciplina{String nome;Disciplina(this.nome);}
class Professor extends Pessoa{Professor(super.nome);}

class Turma with Ano{
  Disciplina disciplina;
  Professor professor;
  final List<Aluno> _alunos=[];
  Turma(this.disciplina,this.professor,int ano){this.ano=ano;}
  void matricular(Aluno aluno){
    if(aluno.ano==ano){_alunos.add(aluno);}else{throw ArgumentError('Ano deve ser mesmo.');}
  }
}
class Historico extends Turma{
  Map<Aluno,List<double>> notas={};
  Historico(super.disciplina,super.professor,super.ano);
  @override
  void matricular(Aluno aluno){super.matricular(aluno);notas[aluno]=[];}
  double media(Aluno aluno){
    if(notas[aluno]!.isEmpty) return 0;
    double m=0; for(var n in notas[aluno]!){m+=n;}
    return m/notas[aluno]!.length;
  }
  bool isAprovado(Aluno aluno){return media(aluno) > 6;}
}

void main(){
  test('Testar matrícula de alunos',(){
    var d=Disciplina('Flutter');
    var p=Professor('Walber'); p.id=1;
    var h=Historico(d,p,2023);
    var a1=Aluno('Maria',2023); a1.id=1; h.matricular(a1);
    expect(h.media(a1),0.0);
    h.notas[a1]=[7,8,9];
    expect(h.isAprovado(a1),true);
    var a2=Aluno('Paula',2022);
    expect(()=>h.matricular(a2),throwsArgumentError);
  });
}
