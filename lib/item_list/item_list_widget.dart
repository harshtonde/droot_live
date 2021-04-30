import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../new_item/new_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemListWidget extends StatefulWidget {
  ItemListWidget({Key key}) : super(key: key);

  @override
  _ItemListWidgetState createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
  bool checkboxListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TriprecordRecord>>(
      stream: queryTriprecordRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<TriprecordRecord> itemListTriprecordRecordList = snapshot.data;
        // Customize what your widget looks like with no query results.
        if (snapshot.data.isEmpty) {
          // return Container();
          // For now, we'll just include some dummy data.
          itemListTriprecordRecordList = createDummyTriprecordRecord(count: 1);
        }
        final itemListTriprecordRecord = itemListTriprecordRecordList.first;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0xFF191938),
            automaticallyImplyLeading: true,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: FlutterFlowTheme.secondaryColor,
              ),
            ),
            title: Text(
              itemListTriprecordRecord.tripname,
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 100,
          ),
          backgroundColor: FlutterFlowTheme.primaryColor,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewItemWidget(),
                ),
              );
            },
            backgroundColor: FlutterFlowTheme.secondaryColor,
            elevation: 8,
            child: IconButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewItemWidget(),
                  ),
                );
              },
              icon: Icon(
                Icons.add,
                color: FlutterFlowTheme.tertiaryColor,
                size: 30,
              ),
              iconSize: 30,
            ),
          ),
          body: SafeArea(
            child: StreamBuilder<List<ItemlistRecord>>(
              stream: queryItemlistRecord(),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                List<ItemlistRecord> listViewItemlistRecordList = snapshot.data;
                // Customize what your widget looks like with no query results.
                if (listViewItemlistRecordList.isEmpty) {
                  return Center(
                    child: Image.asset(
                      'assets/images/no-trips-found.png',
                      width: MediaQuery.of(context).size.width * 0.7,
                    ),
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewItemlistRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewItemlistRecord =
                        listViewItemlistRecordList[listViewIndex];
                    return Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                      child: CheckboxListTile(
                        value: checkboxListTileValue ??
                            listViewItemlistRecord.packedinbag,
                        onChanged: (newValue) =>
                            setState(() => checkboxListTileValue = newValue),
                        title: Text(
                          listViewItemlistRecord.itemname,
                          style: FlutterFlowTheme.title3.override(
                            fontFamily: 'Poppins',
                          ),
                        ),
                        tileColor: Color(0xFFF5F5F5),
                        activeColor: FlutterFlowTheme.secondaryColor,
                        dense: false,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
