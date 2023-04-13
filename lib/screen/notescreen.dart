import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hivedatabase/boxes/boxs.dart';
import 'package:hivedatabase/controller/notescreen_controller.dart';
import 'package:hivedatabase/modal/notemodal.dart';

import '../common.dart';

class NoteAppScreen extends GetView<NoteScreenController> {
  NoteAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _dialogBox();
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colors.pink.shade50,
          centerTitle: true,
          title: const Text(
            "Hive database",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ValueListenableBuilder<Box<NoteModal>>(
          valueListenable: Boxes.getData().listenable(),
          builder: (context, box, _) {
            var data = box.values.toList().cast<NoteModal>();
            return ListView.builder(
                itemCount: box.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.pink.shade50,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              data[index].tittle,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const Spacer(),
                            GestureDetector(
                                onTap: () {
                                  _editDialogBox(data[index],
                                      data[index].tittle, data[index].desc);
                                },
                                child: const Icon(Icons.edit)),
                            const SizedBox(
                              width: 12,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.delete(data[index]);
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                        Text(data[index].desc),
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
          height: 300,
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
                  controller: controller.tittleController),
              Common.textField(
                  text: "Enter description",
                  controller: controller.descController),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _button(text: "cancel",onTap: (){
                    Get.back();
                  }),
                  _button(
                      text: "Add",
                      onTap: () {
                        controller.addData();
                        Get.back();
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

  void _editDialogBox(NoteModal noteModal, String tittle, String desc) {
    controller.tittleController.text = tittle;
    controller.descController.text = desc;
    Get.dialog(Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          alignment: Alignment.center,
          width: 300,
          height: 300,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Edit  Notes",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Common.textField(
                  text: "", controller: controller.tittleController),
              Common.textField(text: "", controller: controller.descController),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _button(
                      text: "cancel",
                      onTap: () {
                        Get.back();
                      }),
                  _button(
                      text: "Edit",
                      onTap: () async {
                        controller.editData(noteModal);
                        Get.back();
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
