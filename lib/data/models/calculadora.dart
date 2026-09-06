class Calculadora {
  double _numero1;
  double _numero2;
  String _operacion;
  String _resultado;
  String _errorMenssage;

  Calculadora({
    this._numero1 = 0,
    this._numero2 = 0,
    this._operacion = "",
    this._resultado = "",
    this._errorMenssage = "",
  });

  double get numero1 => _numero1;
  double get numero2 => _numero2;
  String get operacion => _operacion;
  String get resultado => _resultado;
  String get errorMenssage => _errorMenssage;

  set setNumero1(double n1) => _numero1 = n1;
  set setNumero2(double n2) => _numero2 = n2;
  set setOperacion(String operacion) => _operacion = operacion;
  set setResultado(String resultado) => _resultado = resultado;
  set setErrorMenssage(String errorMenssage) => _errorMenssage = errorMenssage;

  @override
  String toString() {
    if (["sqrt", "log"].contains(_operacion)) {
      return "$operacion $_numero2 = $_resultado";
    }
    if (_operacion == "primo") {
      return _resultado;
    }
    if (_operacion.trim().isEmpty) {
      return "= 0";
    }
    return "$_numero1 $operacion $_numero2 = $_resultado";
  }
}
