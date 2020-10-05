import 'package:FinControl/database/dao/month_dao.dart';
import 'package:FinControl/models/contact.dart';
import 'package:flutter/material.dart';

class MonthForm extends StatefulWidget {

  @override
  _MonthFormState createState() => _MonthFormState();
}

class _MonthFormState extends State<MonthForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final MonthDao _dao = MonthDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo mês'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Mês',
              ),
              style: TextStyle(fontSize: 24.0),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  labelText: 'Salário',
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
                      final String name = _nameController.text;
                      final double salario = double.tryParse(_accountNumberController.text);
                      final Month newMonth = Month(0, name, salario);
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
