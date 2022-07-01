import 'package:flutter/material.dart';
import 'package:uas_zan_2042074/models/Keluhan.dart';

import 'database/dbkeluh.dart';
import 'detailwidget.dart';


class KeluhanList extends StatelessWidget {
  final List<Keluhan> keluhan;
  KeluhanList({Key key, this.keluhan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ListView.builder(
        itemCount: keluhan == null ? 0 : keluhan.length,
        itemBuilder: (BuildContext context, int index) {
          return
            Card(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailWidget(keluhan[index])),
                    );
                  },
                  child: ListTile(
                    leading: Icon(Icons.people_alt_rounded),
                    title: Text(keluhan[index].Nama),
                    subtitle: Text(keluhan[index].Keluh),
                  ),
                )
            );
        });
  }
}

