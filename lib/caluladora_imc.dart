class CalculadoraImc {
  static double calculaImc(double peso, double altura) {
    var imc = peso / (altura * altura);
    return imc;
  }
}
