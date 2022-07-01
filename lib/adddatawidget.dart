import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:uas_zan_2042074/database/dbkeluh.dart';
import 'package:uas_zan_2042074/models/Keluhan.dart';



class AddDataWidget extends StatefulWidget {
  AddDataWidget();

  @override
  _AddDataWidgetState createState() => _AddDataWidgetState();
}

class _AddDataWidgetState extends State<AddDataWidget> {
  _AddDataWidgetState();

  DbKeluh dbkeluh = DbKeluh();
  final _addFormKey = GlobalKey<FormState>();
  final format = DateFormat("dd-MM-yyyy");
  final _keluhanDateController = TextEditingController();
  final _keluhanNameController = TextEditingController();
  final _KeluhanController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lapor Keluhan'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.green, Colors.blue])),
        ),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Tanggal Mengeluh'),
                              DateTimeField(
                                format: format,
                                controller: _keluhanDateController,
                                onShowPicker: (context, currentValue) {
                                  return showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      initialDate: currentValue ?? DateTime.now(),
                                      lastDate: DateTime(2100));
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Nama'),
                              TextFormField(
                                controller: _keluhanNameController,
                                decoration: const InputDecoration(
                                  hintText: '',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Masukan Nama';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Keluhan'),
                              TextFormField(
                                controller: _KeluhanController,
                                decoration: const InputDecoration(
                                  hintText: '',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Silahkan Mengeluh';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              RaisedButton(
                                splashColor: Colors.red,
                                onPressed: () {
                                  if (_addFormKey.currentState.validate()) {
                                    _addFormKey.currentState.save();
                                    final initDB = dbkeluh.initDB();
                                    initDB.then((db) async {
                                      dbkeluh.insertKeluhan(Keluhan(Date: _keluhanDateController.text, Nama: _keluhanNameController.text, Keluh: _KeluhanController.text, ));
                                    });

                                    Navigator.pop(context) ;
                                  }
                                },
                                child: Text('Enter', style: TextStyle(color: Colors.white)),
                                color: Colors.teal,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                )
            ),
          ),
        ),
      ),
    );
  }
}
