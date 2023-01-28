import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer';

//fungsi dinamis ambil gambar dari gallery / camera

var file;
late String nameFile;
//ambil gambar harus menerima media apa yang akan digunakan (gallery / camera), jadi gunakan ImageSource
//Image Source adalah library dari image picker
//pada saat ambil gambar nanti, ketika mau refresh data pada variable, harus menerima state
//state ditampung pada variable inSetstate
takePicture(ImageSource media, inSetstate) async {
  final ImagePicker picker = ImagePicker();
  file = await picker.pickImage(source: media);
  if (file != null) {
    nameFile = file.path.split('/').last;
    log("nama file $nameFile");
    inSetstate(() {}); //halankan setState yang dikirim
    return nameFile;
  }else{
    return false;
  }
}
