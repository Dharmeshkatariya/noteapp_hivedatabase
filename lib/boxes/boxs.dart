import 'package:hive/hive.dart';
import 'package:hivedatabase/modal/notemodal.dart';

class Boxes {
  static Box<NoteModal> getData() => Hive.box<NoteModal>("note");
}