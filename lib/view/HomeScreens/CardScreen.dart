import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/models/dose_model.dart';
import 'package:test/utils/string.dart';
import 'package:test/viewmodels/view_model_provider.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);
  static const routeArgs = '/home-screen';
  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(log_out),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text(no),
          ),
          FlatButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(ctx).pop();
            },
            child: Text(yes),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(home),
        actions: [
          IconButton(
              onPressed: () => _showErrorDialog(context, are_you_sure),
              icon: Icon(Icons.logout))
        ],
      ),
      body: FutureBuilder<AssociatedDrug>(
        future:
            Provider.of<AuthProvider>(context, listen: false).provideDoseData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (ConnectionState.active != null && !snapshot.hasData) {
            return Center(
                child: Text(
              loaging,
              style: Theme.of(context).textTheme.headline6,
            ));
          }
          if (ConnectionState.done != null && snapshot.hasError) {
            return const Center(child: Text(s_w_w));
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Text(
                    welcome_home,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        phone_no +
                            FirebaseAuth.instance.currentUser!.phoneNumber
                                .toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        user_id +
                            FirebaseAuth.instance.currentUser!.uid.toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Table(
                      textDirection: TextDirection.ltr,
                      border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2),
                      children: [
                        TableRow(children: [
                          Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Name',
                                  style: TextStyle(fontSize: 18.0)),
                            )
                          ]),
                          Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Dose',
                                  style: TextStyle(fontSize: 18.0)),
                            )
                          ]),
                          Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Strength',
                                  style: TextStyle(fontSize: 18.0)),
                            )
                          ]),
                        ]),
                        TableRow(children: [
                          Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(snapshot.data.name),
                            )
                          ]),
                          Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(snapshot.data.dose + "-"),
                            )
                          ]),
                          Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(snapshot.data.strength),
                            )
                          ]),
                        ]),
                      ]),
                ),
              ],
            ),
          );
        },
      ),
    ));
  }
}
