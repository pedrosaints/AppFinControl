import 'package:FinControl/components/progress.dart';
import 'package:FinControl/database/dao/contact_dao.dart';
import 'package:FinControl/models/contact.dart';
import 'package:FinControl/screens/transaction_form.dart';
import 'package:flutter/material.dart';

import 'contact_form.dart';

class MonthList extends StatefulWidget {
  @override
  _MonthListState createState() => _MonthListState();
}

class _MonthListState extends State<MonthList> {

  final MonthDao _dao = MonthDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meses'),
      ),
      body: FutureBuilder<List<Month>>(
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
              final List<Month> contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Month contact = contacts[index];
                  return _ContactItem(
                    contact,
                    onClick: () {
                      _showTransactionForm(context,contact);
                    },
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
              builder: (context) => ContactForm(),
            ),
          )
              .then((value) => {setState(() {})});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


void _showTransactionForm(BuildContext context, Month contact) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => TransactionForm(contact),
    ),
  );
}


class _ContactItem extends StatelessWidget {

  final Month contact;
  final Function onClick;

  _ContactItem(
      this.contact, {
        @required this.onClick,
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 24.0,),
        ),
        subtitle: Text(
          contact.salario.toString(),
          style: TextStyle(fontSize: 16.0,),
        ),
      ),
    );
  }
}