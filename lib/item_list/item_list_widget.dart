import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../new_item/new_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemListWidget extends StatefulWidget {
  ItemListWidget({Key key}) : super(key: key);

  @override
  _ItemListWidgetState createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TriprecordRecord>>(
      stream: queryTriprecordRecord(
        queryBuilder: (triprecordRecord) =>
            triprecordRecord.where('userref', isEqualTo: currentUserReference),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.primaryColor,
              ),
            ),
          );
        }
        List<TriprecordRecord> itemListTriprecordRecordList = snapshot.data;
        final itemListTriprecordRecord = itemListTriprecordRecordList.isNotEmpty
            ? itemListTriprecordRecordList.first
            : null;
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
            elevation: 25,
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
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              buttonSize: 48,
              icon: Icon(
                Icons.add,
                color: FlutterFlowTheme.tertiaryColor,
                size: 30,
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewItemWidget(),
                  ),
                );
              },
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
              child: StreamBuilder<List<ItemlistRecord>>(
                stream: queryItemlistRecord(
                  queryBuilder: (itemlistRecord) => itemlistRecord
                      .where('userreference', isEqualTo: currentUserReference),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.primaryColor,
                        ),
                      ),
                    );
                  }
                  List<ItemlistRecord> listViewItemlistRecordList =
                      snapshot.data;
                  if (listViewItemlistRecordList.isEmpty) {
                    return Center(
                      child: Image.asset(
                        'assets/images/no-item-found.png',
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
                      return Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFFF5F5F5),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              listViewItemlistRecord.itemname,
                              style: FlutterFlowTheme.bodyText1,
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              buttonSize: 48,
                              icon: Icon(
                                Icons.delete,
                                color: FlutterFlowTheme.primaryColor,
                                size: 30,
                              ),
                              onPressed: () async {
                                await listViewItemlistRecord.reference.delete();
                              },
                            ),
                            ToggleIcon(
                              onPressed: () async {
                                final itemlistUpdateData =
                                    createItemlistRecordData(
                                  packedinbag:
                                      !listViewItemlistRecord.packedinbag,
                                );
                                await listViewItemlistRecord.reference
                                    .update(itemlistUpdateData);
                              },
                              value: listViewItemlistRecord.packedinbag,
                              onIcon: Icon(
                                Icons.check_box,
                                color: Colors.black,
                                size: 25,
                              ),
                              offIcon: Icon(
                                Icons.check_box_outline_blank,
                                color: Colors.black,
                                size: 25,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
