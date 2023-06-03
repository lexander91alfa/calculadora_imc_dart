import 'package:caluladora_imc/caluladora_imc.dart';
import 'package:test/test.dart';

void main() {
  group('Faz calculo de varios imc com sucesso', () {
    test('Calcula imc com sucesso', () {
      var imc = CalculadoraImc.calculaImc(70, 1.75);
      expect(imc.toStringAsFixed(2), '22.86');
    });

    test('Calcula imc com sucesso', () {
      var imc = CalculadoraImc.calculaImc(80, 1.75);
      expect(imc.toStringAsFixed(2), '26.12');
    });

    test('Calcula imc com sucesso', () {
      var imc = CalculadoraImc.calculaImc(90, 1.75);
      expect(imc.toStringAsFixed(2), '29.39');
    });
  });
}
