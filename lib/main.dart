import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hivedatabase/screen/homescreen.dart';
import 'package:path_provider/path_provider.dart';

void main()async{
 WidgetsFlutterBinding.ensureInitialized();

 var directory = await getApplicationDocumentsDirectory();
 Hive.init(directory.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomeScreen()
    );
  }
}
