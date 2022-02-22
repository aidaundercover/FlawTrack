import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flawtrack/views/error/smth_went_wrong.dart';
import 'package:flawtrack/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('users')
        .orderBy('pins', descending: true)
        .limit(50)
        .snapshots();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        shadowColor: black.withOpacity(0.25),
        elevation: 4,
        backgroundColor: yellow,
        title: Text(
          AppLocalizations.of(context).volcapital,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              width: width * 0.9,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: grey)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 22,
                    child: TextField(
                      cursorColor: black,
                      style: TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context).namesurname,
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
                            border: Border(
                                left: BorderSide(width: 1, color: grey))),
                        child: IconButton(
                          icon: Icon(Icons.search_sharp, size: 30, color: grey),
                          onPressed: () {},
                        ),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
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
                    AppLocalizations.of(context).findnearby,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            width: width * 0.9,
            child: Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Text(
                AppLocalizations.of(context).topfiftyv,
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
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
                DataColumn(
                    label: Text(
                  '№',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                )),
                DataColumn(
                    label: Text(AppLocalizations.of(context).name,
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text(AppLocalizations.of(context).pins,
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold))),
              ], rows: 
                _buildListItem()
              );
            },
          )
        ],
      )),
    );
  }
}

var number = 1;

List<DataRow> _buildListItem() {
  return [
    DataRow(cells: <DataCell>[
      DataCell(Text('1')),
      DataCell(Text('Аскар Дирханов')),
      DataCell(Text('34')),
    ]),
    DataRow(cells: <DataCell>[
      DataCell(Text('2')),
      DataCell(Text('Гинаят Джапарбай')),
      DataCell(Text('32')),
    ]),
    DataRow(cells: <DataCell>[
      DataCell(Text('3')),
      DataCell(Text('Aida Zh')),
      DataCell(Text('32')),
    ]),
    DataRow(cells: <DataCell>[
      DataCell(Text('4')),
      DataCell(Text('Аружан Жаркеш')),
      DataCell(Text('30')),
    ]),
    DataRow(cells: <DataCell>[
      DataCell(Text('5')),
      DataCell(Text('Прокофий Емельян')),
      DataCell(Text('27')),
    ])
  ];
}
