import 'stationery.dart';

/* R2: Calculator extends Stationery */
class Calculator extends Stationery {
  // 1. Properties
  int _code = 0;
  String _model = "";
  double _price = 0.0;
  int _qty = 0;

  // 2. Getters
  int get code => _code;
  String get model => _model;
  double get price => _price;
  int get qty => _qty;

  // 3. Setters (validate -> throw if invalid)
  set code(int value) {
    _code = value;
  }

  set model(String value) {
    if (value.trim().isEmpty) {
      throw Exception("Model is required.");
    }
    _model = value;
  }

  set price(double value) {
    if (value <= 0) {
      throw Exception("Price must be greater than zero.");
    }
    _price = value;
  }

  set qty(int value) {
    if (value <= 0) {
      throw Exception("Qty must be greater than zero.");
    }
    _qty = value;
  }

  // 4. Override abstract method from Stationery
  @override
  void exportData() {
    print("Code: $_code\tModel: $_model\tPrice: $_price\tQty: $_qty");
  }

  // 5. Row format for saveToFile() in R3
  String toCsv() {
    return "$_code,$_model,$_price,$_qty";
  }
}
