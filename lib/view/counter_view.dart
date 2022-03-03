import 'package:apitest/providers/CounterProvider.dart';
import 'package:apitest/providers/UserProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterView extends StatelessWidget {
  CounterView({Key? key}) : super(key: key);

  final _txtFullname = TextEditingController();
  final _txtPhoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<CounterProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Demo'),
      ),
      body:Padding(padding:EdgeInsets.all(9.0),child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
           children: [
        TextField(

          controller: _txtFullname,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Fullanme',
          ),
        ),
        SizedBox(height: 10)
        ,
        TextField(
          keyboardType:TextInputType.phone ,
          controller: _txtPhoneNumber,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'phone number',
          ),
        ),
        SizedBox(
height: MediaQuery.of(context).size.height-250,
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: userProvider.users.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(children: [
              Text('user : ${userProvider.users[index].Fullname} phone : ${userProvider.users[index].phone}'),
                TextButton(onPressed: ()=>{
                  userProvider.DeletedUser(index)
                }, child: Text("حذف"))
              ]);
            }))
      ])),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => {
              userProvider.setUserInfo(
                  new user(_txtFullname.text, _txtPhoneNumber.text))
            },
            tooltip: 'add user',
            child: Icon(Icons.add_circle_outline),
          ),
        ],
      ),
    );
  }
}
