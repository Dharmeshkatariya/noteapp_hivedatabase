import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hivedatabase/modal/notemodal.dart';
import 'package:hivedatabase/screen/notescreen.dart';
import 'package:path_provider/path_provider.dart';

void main()async{
 WidgetsFlutterBinding.ensureInitialized();

 var directory = await getApplicationDocumentsDirectory();
 Hive.init(directory.path);
 Hive.registerAdapter(NoteModalAdapter());


 await Hive.openBox<NoteModal>("note");


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
      home: NoteAppScreen()
    );
  }
}
