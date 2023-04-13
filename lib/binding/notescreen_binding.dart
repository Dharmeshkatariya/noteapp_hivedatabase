import 'package:get/get.dart';
import 'package:hivedatabase/controller/notescreen_controller.dart';

class NoteScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoteScreenController>(() => NoteScreenController());
    // TODO: implement dependencies
  }
}
