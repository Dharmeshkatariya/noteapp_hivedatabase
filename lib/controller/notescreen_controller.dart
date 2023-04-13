import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../boxes/boxs.dart';
import '../modal/notemodal.dart';

class NoteScreenController extends GetxController {
  final tittleController = TextEditingController();
  final descController = TextEditingController();

  delete(NoteModal noteModal) async {
    await noteModal.delete();
  }

  _update(NoteModal noteModal) async {
    await noteModal.delete();
  }

  editData(NoteModal noteModal )async{
    noteModal.tittle = tittleController.text;
    noteModal.desc = descController.text;
    await noteModal.save();
    tittleController.clear();
    descController.clear();
  }

  addData() {
    final data =
        NoteModal(tittle: tittleController.text, desc: descController.text);
    final box = Boxes.getData();
    box.add(data);
    data.save();
    print(box);
    tittleController.clear();
    descController.clear();
  }
}
