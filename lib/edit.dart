// ignore_for_file: prefer_const_constructors

import 'dart:developer';
import 'package:flutter/material.dart';
import 'function/func_read.dart';
import 'package:crud_mysql/function/func_getImage.dart';
import 'function/func_edit.dart';
import 'package:image_picker/image_picker.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  String? judul;
  String? isi;
  String? gambar;

  @override
  void initState() {
    setState(() {
      file = null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListCloud detailEdit =
        ModalRoute.of(context)!.settings.arguments as ListCloud;

    TextEditingController ctl_judul =
        TextEditingController(text: detailEdit.judul);
    TextEditingController ctl_isi = TextEditingController(text: detailEdit.isi);
    TextEditingController ctl_gambar = TextEditingController();

    if (file != null) {
      gambar = nameFile;
    } else {
      gambar = detailEdit.img.toString();
    }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(detailEdit.judul.toString()),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: TextField(
                    controller: ctl_judul,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Judul',
                      hintText: "Isi judul",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        takePicture(ImageSource.gallery, setState);
                      },
                      child: Text("Browse"),
                      color: Colors.green,
                      textColor: Color.fromARGB(255, 255, 255, 255),
                    )),
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        takePicture(ImageSource.camera, setState);
                      },
                      child: Text("Camera"),
                      color: Colors.green,
                      textColor: Color.fromARGB(255, 255, 255, 255),
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(gambar.toString().split('/').last),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: TextField(
                    controller: ctl_isi,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Isi Berita',
                      hintText: "Tulis isi berita",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: MaterialButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      editData(context, detailEdit.id, ctl_judul.text,
                          ctl_isi.text, file);
                    },
                    child: Text("Simpan"),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
