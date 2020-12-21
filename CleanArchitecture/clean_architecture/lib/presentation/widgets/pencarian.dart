


import 'package:clean_architecture/data/models/lokasi.dart';
import 'package:clean_architecture/data/models/network_model.dart';
import 'package:clean_architecture/presentation/bloc/lokasi_response_bloc.dart';
import 'package:flutter/material.dart';

class Pencarian extends StatefulWidget {

  @override
  PencarianState createState() => PencarianState();

}

class PencarianState extends State<Pencarian> {
  TextEditingController myController = TextEditingController();

  Icon searchIcon = Icon(Icons.search);

  Widget appBarText = Text("Pencarian Lokasi");

  List<Lokasi> currentSearch = [];

  List<Lokasi> places = [];

  LokasiResponseBloc _bloc = LokasiResponseBloc();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 25,),
          key: Key('Back Icon Key'),
          onPressed: () => Navigator.pop(context, 'Take me back'),
        ),
        title: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          child: TextFormField(
            controller: myController,
            key: Key('Textfield Mau kemana'),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              isDense: false,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.green,
                size: 25,
              ),
              border: InputBorder.none,
              fillColor: Colors.white,
              labelText: 'A hihi',
              labelStyle: TextStyle(
                color: Colors.green,
                fontSize: 18,
                fontWeight: FontWeight.w700
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.mic, color: Colors.green, size: 25,),
                onPressed: () {

                },
              )
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRecentSearchWidget(),
          Container(
            margin: EdgeInsets.only(left: 3, top: 3, right: 3),
            child: Text('Hasil Pencarian'),
          ),
          _buildListWidget()
        ],
      ),
    );
  }

  Widget _buildRecentSearchWidget() {
    return StreamBuilder<NetworkModel<LokasiListResponse>> (
      stream: _bloc.recentSearchStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          switch(snapshot.data.status) {
            case Status.LOADING:
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              );
            case Status.COMPLETED:
              final recentSearch = snapshot.data.t;
              Widget displayWidget;
              if (recentSearch.listLokasi.isEmpty) {
                displayWidget = Center(
                  child: Text("Empty item ne"),
                );
              } else {
                displayWidget = Center(
                  child: Text("So luong item = " + recentSearch.listLokasi.length.toString()),
                );
              }
              return Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(3),
                      child: Text("Hooorey"),
                    ),
                    Flexible(child: displayWidget,)
                  ],
                ),
              );
            case Status.ERROR:
              return Center(
                child: Text(snapshot.data.errorString),
              );
          }
        }

        return Container();
      },
    );
  }

  Widget _buildListWidget() {
    return StreamBuilder<NetworkModel<LokasiListResponse>> (
      stream: _bloc.lokasiListStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          switch(snapshot.data.status) {
            case Status.LOADING:
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              );
            case Status.COMPLETED:
              return Expanded(
                flex: 2,
                child: Center(child: Text("aaaaaaaa: " + snapshot.data.t.listLokasi.length.toString()),),
              );
            case Status.ERROR:
              return Center(
                child: Text(snapshot.data.errorString),
              );
          }
        }
        return Container();
      },
    );
  }
}