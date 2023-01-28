import 'package:crud_mysql/function/func_handleNull.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import 'func_isLoading.dart';

editData(context, id, judul, isi, pathImg) async {
  //loading lalu pushnamed ke fungsi read
  if (id == null || judul == null || isi == null || pathImg == null) {
    handle("Semua data harus diisi!");
  } else {
    //jika data tidak kosong, loading lalu pushnamed ke fungsi read
    isLoading(context);
    String imgName = pathImg.path.split('/').last;
    FormData sendData = FormData.fromMap({
      "id": id.toString(),
      "judul": judul.toString(),
      "isi": isi.toString(),
      "url_image": await MultipartFile.fromFile(pathImg.path,
          filename: imgName.toString()),
    });
    final response = await Dio().post(
        "https://oasis2022.000webhostapp.com/edit_news.php",
        data: sendData);
    log("test send data:" + judul.toString());
    return Navigator.of(context)
        .pushNamedAndRemoveUntil('/read', (Route<dynamic> route) => false);
  }
}
