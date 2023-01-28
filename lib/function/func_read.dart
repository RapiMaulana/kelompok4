import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer';

class ListCloud {
  String id, judul, isi, img;
  ListCloud(
      {required this.id,
      required this.judul,
      required this.isi,
      required this.img});
}

Future<List<ListCloud>> read(query) async {
  List<ListCloud> dataList = <ListCloud>[];
  ListCloud tmpData;
  final response = await Dio().get(
      "https://oasis2022.000webhostapp.com/list_news.php",
      queryParameters: {
        "key": query.toString(),
      });
  var data = response.data;
  log("test decode: ${data[0]}");

  if (data.length == 0) {
    return dataList;
  } else {
    List<ListCloud> tdata = [];
    data.forEach((item) {
      tmpData = ListCloud(
          id: item["id"]!,
          judul: item["judul"]!,
          isi: item["isi"]!,
          img: item["img"]!);
      dataList.add(tmpData);
    });
    return dataList;
  }
}
