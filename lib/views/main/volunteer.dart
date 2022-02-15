import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawtrack/views/error/smth_went_wrong.dart';
import 'package:flawtrack/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class VolunteerView extends StatefulWidget {
  const VolunteerView({Key? key}) : super(key: key);

  @override
  _VolunteerViewState createState() => _VolunteerViewState();
}

class _VolunteerViewState extends State<VolunteerView> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection('users').orderBy('pins', descending: true).limit(50).snapshots();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shadowColor: black.withOpacity(0.25),
        elevation: 4,
        backgroundColor: yellow,
        title: Text(
          "Волонтеры",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: black),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
              icon: Icon(Icons.menu_rounded, size: 27, color: Colors.black),
              onPressed: () => Scaffold.of(context).openDrawer()),
        ),
      ),
      drawer: DrawerCustom(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: width * 0.9,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: grey)),
            child: Row(
              children: [
                Expanded(
                  flex: 22,
                  child: TextField(
                    cursorColor: black,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      hintText: 'Имя-Фамилия',
                      labelStyle: TextStyle(fontSize: 18),
                      contentPadding: EdgeInsets.only(left: 17),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border(left: BorderSide(width: 1, color: grey))),
                      child: IconButton(
                        icon: Icon(Icons.search_sharp, size: 30, color: grey),
                        onPressed: () {},
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(height: 18),
          Container(
            width: width * 0.9,
            height: 125,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: grey)),
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.asset(
                  'assets/find_volunteer.png',
                  width: width * 0.574,
                ),
                Text(
                  'Найти рядом',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: width * 0.9,
            child: Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Text(
                'Рейтинг ТОП-50 волонтеров',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return SomethingWentWrong();
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              return DataTable(columns: [
                DataColumn(label: Text('№', style: TextStyle(color: primaryColor, fontSize: 22, fontWeight: FontWeight.bold),)),
                DataColumn(label: Text('Имя', style: TextStyle(color: primaryColor, fontSize: 22, fontWeight: FontWeight.bold))),
                DataColumn(label: Text('Пины', style: TextStyle(color: primaryColor, fontSize: 22, fontWeight: FontWeight.bold))),
              ], rows: _buildList(context, snapshot.data!.docs));
            },
          )
        ],
      )),
    );
  }
}

var number = 1;

List<DataRow> _buildList(
    BuildContext context, List<DocumentSnapshot> snapshot) {
  return snapshot.map((data) => _buildListItem(context, data)).toList();
}

DataRow _buildListItem(BuildContext context, DocumentSnapshot data) {
  Map<String, dynamic> record = data.data()! as Map<String, dynamic>;

  return DataRow(cells: <DataCell>[
    DataCell(Text('16')),
    DataCell(Text('Аскар Дирханов')),
    DataCell(Text('34')),
  ]);
}
