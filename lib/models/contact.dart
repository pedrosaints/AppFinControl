class Month {
  final int id;
  final String name;
  final double salario;

  Month(
      this.id,
      this.name,
      this.salario,
      );

  @override
  String toString() {
    return 'Month{id: $id, name: $name, accountNumber: $salario}';
  }

  Month.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        salario = json['salario'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'salario': salario,
      };
}