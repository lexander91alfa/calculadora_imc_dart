import 'package:caluladora_imc/console.dart';
import 'package:caluladora_imc/std_input_reader.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

void main() {
  test('Obtem nome com sucesso.', () {
    final mockStdin = MockStdin();
    when(() => mockStdin.readLine()).thenReturn('João');
    Console.inputReader = mockStdin;

    final nome = Console.obterNome();

    expect(nome, 'João');
  });

  test('Obter altura com sucesso.', () {
    final mockStdin = MockStdin();
    when(() => mockStdin.readLine()).thenReturn('1.75');
    Console.inputReader = mockStdin;

    final altura = Console.obterAltura();

    expect(altura, 1.75);
  });

  test('Obter peso com sucesso.', () {
    final mockStdin = MockStdin();
    when(() => mockStdin.readLine()).thenReturn('75');
    Console.inputReader = mockStdin;

    final peso = Console.obterPeso();

    expect(peso, 75);
  });

  test('Obter nome com erro de tamanho.', () {
    final mockStdin = MockStdin();
    when(() => mockStdin.readLine()).thenReturn('Jo');
    Console.inputReader = mockStdin;

    final nome = Console.obterNome();

    expect(nome, '');
  });

  test('Obter nome com erro de tamanho.', () {
    final mockStdin = MockStdin();
    when(() => mockStdin.readLine()).thenReturn('João'.padRight(51, 'a'));
    Console.inputReader = mockStdin;

    final nome = Console.obterNome();

    expect(nome, '');
  });
}

class MockStdin extends Mock implements StdInputReader {}
