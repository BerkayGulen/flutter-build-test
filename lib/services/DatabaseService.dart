import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:build_test_app/model/Contact.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService{

   Database? _db;

  initDatabase() async{
    _db = await openDatabase('assets/FlutterTest.db');
    print(_db);
    var databasePath = await getDatabasesPath();
    print(databasePath);
    String path = join(databasePath, 'FlutterTest.db');
    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "FlutterTest.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);

    } else {
      print("Opening existing database");
    }

// open the database
    _db = await openDatabase(path,readOnly: false);
  }

   Future<List<Contact>> getAll() async {
     await initDatabase();

     try {
       List<Map<String, Object?>> data = await _db!.query('Contact');

       // Map the retrieved data to a list of Contact objects
       List<Contact> contacts = data
           .map((map) => Contact.fromJson(map as Map<String, dynamic>))
           .toList();

       return contacts;
     } catch (e) {
       print("Error retrieving data: $e");
       return []; // Return an empty list in case of an error
     }
   }

   Future<void> insert(Contact contact) async {
     await initDatabase();

     try {
     await _db!.insert('Contact', contact.toMap());
     } catch (e) {
       print("Error inserting data: $e");
     }
   }

  dispose(){
    _db?.close();
  }



}