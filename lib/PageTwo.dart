import 'dart:math';

import 'package:build_test_app/services/DatabaseService.dart';
import 'package:flutter/material.dart';

import 'model/Contact.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}
class _PageTwoState extends State<PageTwo> {
  final db = DatabaseService();


  @override
  Widget build(BuildContext context) {
     String _generateRandomString(int length) {
      const String _chars =
          "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
      Random _rnd = Random();
      return String.fromCharCodes(Iterable.generate(
        length,
            (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
      ));
    }
    Future<void> addItem()async{

      String randomName = _generateRandomString(8); // Random name of length 8
      String randomEmail =
          "${randomName.toLowerCase()}@example.com"; // Random email address
     Contact contact =  Contact(name: randomName,email: randomEmail);
     await db.insert(contact);

     setState(() {

     });
    }

       return Scaffold(
      body:  FutureBuilder<List<Contact>>(
          future: db.getAll(),
          builder: (context, snapshot) {
            if(!snapshot.hasData)return(Center(child: CircularProgressIndicator(),));
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context,index){
                  final contact = snapshot.data![index];
                  return ListTile(
                    title: Text(contact.name ?? ''),
                    leading: Text(contact.email ?? ''),
                  );
                }
            );
          }
      ),
         floatingActionButton: FloatingActionButton(
           onPressed: addItem,
           child: Icon(Icons.add),
         ),
    );

  }
}
