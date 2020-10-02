import 'dart:ui';

import 'package:FinControl/screens/transactions_list.dart';
import 'package:flutter/material.dart';

import 'month_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _FeatureItem(
                  'Transfer',
                  Icons.monetization_on,
                  onClick: () {
                    _showContactsList(context);
                  },
                ),
                _FeatureItem('Transaction Feed', Icons.description, onClick: () => _showTransactionsList(context),),
              ],
            ),
          ),
        ],
      ),
    );*/
    return Material(
      child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/back_home.jpg"), fit: BoxFit.cover)
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
            Positioned.fill(
              top: 100,
              bottom: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "FinControl",
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 42),
                    ),
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  InkWell(
                    onTap: () => _showContactsList(context),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        border: Border.all(width: .5, color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 7),
                      child: Center(child: Text('Entrar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white))),
                    ),
                  ),
//                  RaisedButton(
//                    child:
//                    color: Colors.white,
//                    textColor: Color.fromRGBO(120, 183, 201, 1),
//                    onPressed: () => Navigator.pushNamed(context, loginRoute),
//                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}

void _showContactsList(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => MonthList(),
    ),
  );
}

void _showTransactionsList(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => TransactionsList(),
    ),
  );
}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onClick;

  _FeatureItem(this.name, this.icon, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(icon, color: Colors.white, size: 24,),
                Text(name, style: TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}