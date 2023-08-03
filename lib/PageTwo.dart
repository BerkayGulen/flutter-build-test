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
    print(db.getAll());
    print(db);

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
    );

  }
}
