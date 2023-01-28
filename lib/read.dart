// ignore_for_file: sort_child_properties_last

import 'dart:developer';
import 'package:flutter/material.dart';
import 'function/func_logout.dart';
import 'function/func_read.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'dart:convert';

class Read extends StatefulWidget {
  const Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  String qsearch = "";
  List<ListCloud> data = <ListCloud>[];

  @override
  void initState() {
    //inisialisasi awal disini
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchingController = TextEditingController();

    return WillPopScope(
      onWillPop: () async => false, //disable back from back on home android
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("News Mahasiswa"),
            automaticallyImplyLeading: false, //disable back from appbar android
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  logout(context);
                },
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
            child: const Icon(Icons.add),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: searchingController,
                    onChanged: (value) {
                      EasyDebounce.debounce(
                          'my-search', // <-- An ID for this particular debouncer
                          const Duration(
                              milliseconds: 1000), // <-- The debounce duration
                          () async {
                        log("SEARCH ${searchingController.text}");
                        setState(() {
                          qsearch = searchingController.text;
                        });
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Cari berita',
                    ),
                  ),
                ),
                Center(
                  child: FutureBuilder<List<ListCloud>>(
                      future: read(qsearch.toString()),
                      builder: (inContext, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return const CircularProgressIndicator();
                        } else {
                          log("TEST bb ${snapshot.data}");
                        }
                        log("TEST $snapshot");
                        List<Widget> tempChildren = <Widget>[];
                        if (snapshot.hasData) {
                          for (var item in snapshot.data!) {
                            Widget child = GestureDetector(
                              child: Container(
                                child: ListTile(
                                  leading: CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: NetworkImage(item.img)),
                                  title: Text(item.judul),
                                  subtitle: Text(item.isi),
                                ),
                                padding: const EdgeInsets.only(
                                    top: 3, left: 2, right: 2, bottom: 3),
                                margin: const EdgeInsets.only(bottom: 5),
                              ),
                              onTap: () async {
                                Navigator.pushNamed(context, '/detail',
                                    arguments: {
                                      "data": ListCloud(
                                          id: item.id,
                                          judul: item.judul,
                                          isi: item.isi,
                                          img: item.img)
                                    });
                                setState(() {
                                  qsearch = "";
                                });
                              },
                            );
                            tempChildren.add(child);
                          }
                          return Column(
                            children: tempChildren,
                          );
                        } else {
                          return const Text("NO DATA");
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
