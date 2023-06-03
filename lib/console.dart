import 'package:caluladora_imc/caluladora_imc.dart';
import 'package:caluladora_imc/pessoa.dart';
import 'package:caluladora_imc/std_input_reader.dart';

class Console {
  static StdInputReader inputReader = StdInputReader();

  static String obterNome() {
    int tentativas = 0;

    do {
      print('Digite o nome: ');
      var nome = inputReader.readLine() ?? '';
      if (nome.length < 3) {
        print('O nome deve ter no mínimo 3 caracteres.');
      } else if (nome.length > 50) {
        print('O nome deve ter no máximo 50 caracteres.');
      } else if (nome.isEmpty) {
        print('O nome deve ser preenchido.');
      } else {
        return nome;
      }
      if (_exit(tentativas++)) {
        return '';
      }
    } while (true);
  }

  static double obterAltura() {
    int tentativas = 0;

    do {
      print('Digite a altura em metros: ');
      var altura = double.tryParse(inputReader.readLine() ?? '');
      if (altura == null || altura.isNaN) {
        print('A altura deve ser um número.');
      } else {
        if (altura < 0.3) {
          print('A altura deve ser maior que 0.3');
        } else {
          return altura;
        }
      }
      if (_exit(tentativas++)) {
        return 0;
      }
    } while (true);
  }

  static double obterPeso() {
    int tentativas = 0;

    do {
      print('Digite o peso em kg: ');
      var peso = double.tryParse(inputReader.readLine() ?? '');
      if (peso == null || peso.isNaN) {
        print('O peso deve ser um número.');
      } else {
        if (peso < 1) {
          print('O peso deve ser maior que 1');
        } else {
          return peso;
        }
      }
      if (_exit(tentativas++)) {
        return 0;
      }
    } while (true);
  }

  static bool _exit(int tentativas) {
    if (tentativas > 3) {
      print(
          'Deseja sair? (n|N) para não + ENTER, Qualquer tecla para sim + ENTER');
      var sair = inputReader.readLine() ?? '';
      if (sair.toLowerCase() == 'n') {
        print('Continue...');
        return false;
      } else {
        print('Saindo...');
        return true;
      }
    }
    return false;
  }

  static void imprimirResultado(Pessoa pessoa) {
    var imc = CalculadoraImc.calculaImc(pessoa.peso, pessoa.altura);
    var resultado = _classificacao(imc);

    print('Nome: ${pessoa.nome}');
    print('Peso: ${pessoa.peso}');
    print('Altura: ${pessoa.altura}');
    print('IMC: $imc');
    print('Classificação: $resultado');
  }

  static String _classificacao(double imc) {
    if (imc < 18.5) {
      return 'Abaixo do peso';
    } else if (imc < 25) {
      return 'Peso normal';
    } else if (imc < 30) {
      return 'Sobrepeso';
    } else if (imc < 35) {
      return 'Obesidade grau 1';
    } else if (imc < 40) {
      return 'Obesidade grau 2';
    } else {
      return 'Obesidade grau 3';
    }
  }
}
