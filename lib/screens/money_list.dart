import 'package:FinControl/components/progress.dart';
import 'package:FinControl/database/dao/money_dao.dart';
import 'package:FinControl/database/dao/month_dao.dart';
import 'package:FinControl/models/contact.dart';
import 'package:FinControl/models/transaction.dart';
import 'package:FinControl/screens/transaction_form.dart';
import 'package:flutter/material.dart';

import 'month_form.dart';

class MoneyList extends StatefulWidget {
  final Month month;

  MoneyList(this.month);

  @override
  _MoneyListState createState() => _MoneyListState();
}

class _MoneyListState extends State<MoneyList> {

  final MoneyDao _dao = MoneyDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.month.name),
      ),
      body: FutureBuilder<List<Transaction>>(
        initialData: List(),
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch(snapshot.connectionState){

            case ConnectionState.none:
              // TODO: Handle this case.
              // Para Startar o future
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              // Stream
              break;
            case ConnectionState.done:
              // TODO: Handle this case.
              print(snapshot.data);
              final List<Transaction> contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Transaction contact = contacts[index];
                  return _MoneyItem(
                    contact,
                  );
                },
                itemCount: contacts.length,
              );
              break;
          }

          return Text('Unkown error');

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => TransactionForm(),
            ),
          )
              .then((value) => {setState(() {})});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}



class _MoneyItem extends StatelessWidget {

  final Transaction t;
  //final Function onClick;

  _MoneyItem(
      this.t);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //onTap: () => onClick(),
        title: Text(
          t.value.toString(),
          style: TextStyle(fontSize: 24.0,),
        ),
        //tenho o salario armazenado
        subtitle: Text(
          t.type,
          style: TextStyle(fontSize: 16.0,),
        ),
      ),
    );
  }
}