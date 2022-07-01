import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:uas_zan_2042074/database/dbkeluh.dart';

import 'models/Keluhan.dart';


class EditDataWidget extends StatefulWidget {
  EditDataWidget(this.keluhan);

  final Keluhan keluhan;

  @override
  _EditDataWidgetState createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  _EditDataWidgetState();

  DbKeluh dbkeluh = DbKeluh();
  final _addFormKey = GlobalKey<FormState>();
  int _id;
  final format = DateFormat("dd-MM-yyyy");
  final _keluhanDateController = TextEditingController();
  final _keluhanNameController = TextEditingController();
  final _KeluhanController = TextEditingController();


  @override
  void initState() {
    _id = widget.keluhan.id;
    _keluhanDateController.text = widget.keluhan.Date;
    _keluhanNameController.text = widget.keluhan.Nama;
    _KeluhanController.text = widget.keluhan.Keluh;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data'),
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
                                    return 'Ubah Keluhan';
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
                                      await dbkeluh.updateKeluhan(Keluhan(id: _id, Date: _keluhanDateController.text, Nama: _keluhanNameController.text, Keluh: _KeluhanController.text, ));
                                    });

                                    Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
                                  }
                                },
                                child: Text('Ubah', style: TextStyle(color: Colors.white)),
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