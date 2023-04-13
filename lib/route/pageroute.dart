import 'package:get/get.dart';
import 'package:hivedatabase/binding/notescreen_binding.dart';
import 'package:hivedatabase/route/nameroute.dart';
import 'package:hivedatabase/screen/notescreen.dart';

class PageRoutes {
  static final pages = [
    GetPage(
        name: NameRoutes.noteScreen,
        page: () => NoteAppScreen(),
        binding: NoteScreenBinding()),
  ];
}
