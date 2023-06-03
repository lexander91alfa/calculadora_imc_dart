import 'package:caluladora_imc/console.dart';
import 'package:caluladora_imc/pessoa.dart';

void main(List<String> arguments) {
  var nome = Console.obterNome();
  var peso = Console.obterPeso();
  var altura = Console.obterAltura();

  if (nome.isEmpty || peso == 0 || altura == 0) {
    return;
  }

  Pessoa pessoa = Pessoa(nome, altura, peso);

  Console.imprimirResultado(pessoa);
}
