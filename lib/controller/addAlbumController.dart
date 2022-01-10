import 'dart:io';

//import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddAlbumController extends GetxController {
  TextEditingController _nombreCtrl = TextEditingController();
  late String _dorso="";
  late File _file=File("");

  String get dorso => _dorso;
  File get file => _file;
  TextEditingController get nombreCtrl => _nombreCtrl;


  final _obj = ''.obs;

  set obj(value) => _obj.value = value;

  get obj => _obj.value;

  actualizarDorso() {
    _dorso = _nombreCtrl.value.text.toUpperCase();
    print(_dorso);
    update();
  }


  openFilePicker() async{

   /* print("dfdfdfsfs");
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    _file = File(result!.files.single.path??"");
    update();*/



  }
}
