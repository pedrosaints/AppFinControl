import 'contact.dart';

class Transaction {
  final double value;
  final Month contact;
  final String id;

  Transaction(
      this.id,
      this.value,
      this.contact,
      );

  Transaction.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        value = json['value'],
        contact = Month.fromJson(json['contact']);


  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'value': value,
        'contact': contact.toJson(),
      };

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }

}