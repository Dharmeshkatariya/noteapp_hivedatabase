
import 'package:hive/hive.dart';
part 'notemodal.g.dart';
@HiveType(typeId: 0)
class NoteModal extends HiveObject{

  @HiveField(0)
  String tittle ;
  @HiveField(1)
  String desc;

  NoteModal({required this.tittle,required this.desc});
}
