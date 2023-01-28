import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:image_picker/image_picker.dart';
import 'function/func_getImage.dart';
import 'function/func_add.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  String? judul;
  String? isi;

  TextEditingController ctl_judul = TextEditingController();
  TextEditingController ctl_isi = TextEditingController();

  @override
  void initState() {
    setState(() {
      file = null;
      nameFile = "Silahkan pilih gambar";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Buat Berita Baru"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: TextField(
                    controller: ctl_judul,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Judul',
                      hintText: "Isi data judul",
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
                      textColor: Colors.white,
                    )),
                    Expanded(
                        child: MaterialButton(
                      onPressed: () {
                        takePicture(ImageSource.camera, setState);
                      },
                      child: Text("Camera"),
                      color: Colors.green,
                      textColor: Colors.white,
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(nameFile),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: TextField(
                    controller: ctl_isi,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Isi Berita',
                      hintText: "Tulis isi berita",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: MaterialButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      CircularProgressIndicator();
                      addData(context, ctl_judul.text, ctl_isi.text, file);
                    },
                    child: const Text("Simpan"),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
