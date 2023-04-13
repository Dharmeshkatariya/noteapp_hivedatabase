import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()async{

        var box = await Hive.openBox("dharmesh");
        box.put("name", "raj");
        box.put("detail", {
          "name " : "rajesh",
          "age" : 20,
        });
        print(box.get("name"));
        print(box.get("detail")["age"]);

      },
      child: Icon(Icons.add),
      ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Hive database"),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                    future: Hive.openBox("dharmesh"),
                    builder: (context , snapshot){
                  return Text(snapshot.data!.get("name").toString());
                }


                ),
              ),
            ],
          ),
        ));
  }
}
