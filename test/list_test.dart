// Importa a biblioteca padrão do Flutter para criação e execução de testes.
import 'package:flutter_test/flutter_test.dart';

// Declaração de uma lista global de inteiros que será modificada ao longo dos testes.
List<int> numeros = [1, 2, 3];

// Função principal que serve como ponto de entrada para a execução dos testes.
void main() {
 test('Adicionar elemento', () {
   // O método add() insere um único elemento no final da lista.
   numeros.add(4);
   // O expect() verifica se uma condição é atendida (neste caso, se o 4 está na lista).
   expect(numeros.contains(4), isTrue);
 });

 test('Adicionar outra lista', () {
   // O método addAll() adiciona todos os elementos de um iterável (outra lista) ao final.
   numeros.addAll([5, 6]);
   expect(numeros.contains(5), isTrue);
   expect(numeros.contains(6), isTrue);
 });

 test('Adicionar na posição', () {
   // O método insert(índice, valor) coloca o valor '0' especificamente na primeira posição (índice 0).
   numeros.insert(0, 0);
   // Verifica se o índice do número 0 realmente é a posição 0.
   expect(numeros.indexOf(0), 0);
 });

 test('Remover elemento', () {
   // O método remove() busca a primeira ocorrência do valor '2' na lista e o deleta.
   numeros.remove(2);
   expect(numeros.contains(2), isFalse); // isFalse verifica se a condição é falsa.
 });

 test('Remover na posição', () {
   // O método removeAt() deleta o elemento que está no índice informado (índice 0).
   numeros.removeAt(0);
   expect(numeros.contains(0), isFalse);
 });

 test('Testar tamanho', () {
   // A propriedade length retorna a quantidade atual de itens armazenados na lista.
   expect(numeros.length, 5);
 });

 test('Testar vazio e não vazio', () {
   // isEmpty verifica se a lista não tem elementos; isNotEmpty verifica o oposto.
   expect(numeros.isEmpty, isFalse);
   expect(numeros.isNotEmpty, isTrue);
 });

 test('Testar ordenação', () {
   // reversed inverte a ordem atual, e toList() converte o resultado iterável de volta para uma Lista.
   expect(numeros.reversed.toList(), [6, 5, 4, 3, 1]);
   expect(numeros, [1, 3, 4, 5, 6]); // A lista original não é alterada apenas chamando reversed.
   
   // Aqui substituímos a lista original pela sua versão invertida.
   numeros = numeros.reversed.toList();
   expect(numeros, [6, 5, 4, 3, 1]);
   
   // sort() organiza a lista em ordem crescente modificando a própria lista na memória.
   numeros.sort();
   expect(numeros, [1, 3, 4, 5, 6]);
 });

 test('Testar percorrer lista', () {
   int soma = 0;
   // O laço 'for-in' percorre cada item dentro da lista 'numeros' sequencialmente.
   for (int numero in numeros) {
     soma += numero;
   }
   expect(soma, 19);
   
   // map() itera sobre a lista e aplica uma transformação (multiplica por 2) em cada item.
   numeros = numeros.map((numero) => numero * 2).toList();
   expect(numeros, [2, 6, 8, 10, 12]);
   
   // where() atua como um filtro, retornando apenas os elementos que satisfazem a condição (múltiplos de 3).
   numeros = numeros.where((numero) => numero % 3 == 0).toList();
   expect(numeros, [6, 12]);
 });
}