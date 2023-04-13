import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hivedatabase/boxes/boxs.dart';
import 'package:hivedatabase/common.dart';
import 'package:hivedatabase/controller/notescreen_controller.dart';
import 'package:hivedatabase/modal/notemodal.dart';

class NoteAppScreen extends StatelessWidget {
  NoteAppScreen({Key? key}) : super(key: key);
  final _noteController = Get.put(NoteScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _dialogBox();
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Hive database"),
        ),
        body: ValueListenableBuilder<Box<NoteModal>>(
          valueListenable: Boxes.getData().listenable(),
          builder: (context, box, _) {
            var data = box.values.toList().cast<NoteModal>();
            return ListView.builder(
                itemCount: box.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        Text(data[index].desc),
                        Text(data[index].tittle),
                      ],
                    ),
                  );
                });
          },
        ));
  }

  _dialogBox() {
    Get.dialog(Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          alignment: Alignment.center,
          width: 300,
          height: 250,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Add  Notes",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Common.textField(
                  text: "Enter tittle",
                  controller: _noteController.tittleController),
              Common.textField(
                  text: "Enter description",
                  controller: _noteController.descController),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _button(text: "cancel"),
                  _button(
                      text: "Add",
                      onTap: () {
                        final data = NoteModal(
                            tittle: _noteController.tittleController.text,
                            desc: _noteController.descController.text);
                        final box = Boxes.getData();
                        box.add(data);
                        data.save();
                        print(box);
                        _noteController.tittleController.clear();
                        _noteController.descController.clear();
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget _button({required String text, GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
