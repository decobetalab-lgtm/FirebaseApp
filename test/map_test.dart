import 'package:flutter_test/flutter_test.dart';

// Declara um mapa (dicionário) global onde a chave é uma String (nome) 
// e o valor é uma lista de números decimais double (notas).
Map<String, List<double>> alunos = {
 'Maria': [8.0, 9.0],
 'Bruna': [7.0, 7.0],
 'Carla': [10.0, 9.0],
};

void main() {
 test('Adicionar elemento', () {
   // putIfAbsent() insere o novo par chave-valor apenas se a chave 'Elena' 
   // ainda não estiver presente no mapa.
   alunos.putIfAbsent('Elena', () => [9.0, 8.0]);
   expect(alunos.containsKey('Elena'), isTrue);
   expect(alunos['Elena'], [9.0, 8.0]);
 });

 test('Adicionar outro dicionário', () {
   // addAll() mescla múltiplos pares de chave-valor de um novo mapa ao mapa original.
   // Se a chave já existir, o valor correspondente é substituído.
   alunos.addAll({
     'Elena': [9.0, 8.0],
     'Luiza': [8.0, 9.0],
   });
   expect(alunos.containsKey('Elena'), isTrue);
   expect(alunos.containsKey('Luiza'), isTrue);
 });

 test('Remover elemento', () {
   // remove() busca a chave especificada ('Bruna') e a exclui permanentemente 
   // do mapa junto com a sua lista de notas.
   alunos.remove('Bruna');
   expect(alunos.containsKey('Bruna'), isFalse);
 });

 test('Atualizar elemento', () {
   // update() localiza uma chave existente e utiliza uma função de callback 
   // para modificar e retornar o seu novo valor.
   alunos.update('Carla', (value) => [9.0, 8.0]);
   expect(alunos['Carla'], [9.0, 8.0]);
   
   // A atribuição direta via colchetes (['chave'] =) é a forma mais simples 
   // de sobrescrever o valor de uma chave específica.
   alunos['Carla'] = [8.0, 9.0];
   expect(alunos['Carla'], [8.0, 9.0]);
 });

 test('Testar percorrer dicionário', () {
   // A propriedade .keys retorna um iterável contendo exclusivamente os nomes 
   // (chaves) registrados no dicionário.
   expect(alunos.keys, ['Maria', 'Carla', 'Elena', 'Luiza']);
   
   // A propriedade .values retorna um iterável contendo exclusivamente as 
   // listas de notas armazenadas, ignorando as chaves.
   expect(alunos.values, [
     [8.0, 9.0],
     [8.0, 9.0],
     [9.0, 8.0],
     [8.0, 9.0],
   ]);
   
   double soma = 0;
   // forEach() percorre todo o mapa, entregando a chave (nome) e o valor 
   // (lista de notas) de cada item para o bloco de código interno.
   alunos.forEach((key, value) {
     // Este laço 'for-in' itera sobre cada nota individual da lista do aluno atual.
     for (double nota in value) {
       soma += nota;
     }
   });
   expect(soma, 68.0); // Verifica se a soma de todas as notas do dicionário é 68.0
 });
 test('Calcular médias', () {
   Map<String, double> medias = {};
   
   // forEach percorre cada par de nome e lista de notas no dicionário 'alunos'.
   alunos.forEach((nome, notas) {
     double soma = 0;
     
     // O laço soma todas as notas armazenadas na lista atual.
     for (double nota in notas) {
       soma += nota;
     }
     
     // A média é a soma dividida pelo tamanho da lista (notas.length). 
     // O resultado é salvo no dicionário 'medias' usando o nome como chave.
     medias[nome] = soma / notas.length;
   });

   expect(medias, {'Maria': 8.5, 'Carla': 8.5, 'Elena': 8.5, 'Luiza': 8.5});
 });
}