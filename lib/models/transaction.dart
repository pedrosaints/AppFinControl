import 'contact.dart';

class Transaction {
  final double value;
  final String type;
  final int id;

  Transaction(
      this.id,
      this.value,
      this.type,
      );

  Transaction.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        value = json['value'],
        type = json['type'];


  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'value': value,
        'type': type,
      };

  @override
  String toString() {
    return 'Transaction{value: $value, type: $type}';
  }

}