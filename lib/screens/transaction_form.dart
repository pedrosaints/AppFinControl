import 'package:FinControl/database/dao/money_dao.dart';
import 'package:FinControl/database/dao/month_dao.dart';
import 'package:FinControl/models/contact.dart';
import 'package:FinControl/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();
  final MoneyDao _dao = MoneyDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Valor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _typeController,
              decoration: InputDecoration(
                labelText: 'Tipo',
              ),
              style: TextStyle(fontSize: 24.0),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _valueController,
                decoration: InputDecoration(
                  labelText: 'Valor',
                ),
                style: TextStyle(fontSize: 24.0),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('Criar'),
                  onPressed: () {
                    setState(() {
                      final String tipo = _typeController.text;
                      final double valor = double.tryParse(_valueController.text);
                      final Transaction newMonth = Transaction(0, valor,tipo);
                      _dao.save(newMonth).then((id) => Navigator.pop(context));
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
