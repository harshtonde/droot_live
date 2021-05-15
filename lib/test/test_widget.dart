import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestWidget extends StatefulWidget {
  TestWidget({Key key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.primaryColor,
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                              child: Container(
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.white,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: StreamBuilder<List<ItemlistRecord>>(
                                    stream: queryItemlistRecord(
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                      List<ItemlistRecord>
                                          rowItemlistRecordList = snapshot.data;
                                      // Customize what your widget looks like with no query results.
                                      if (snapshot.data.isEmpty) {
                                        // return Container();
                                        // For now, we'll just include some dummy data.
                                        rowItemlistRecordList =
                                            createDummyItemlistRecord(count: 1);
                                      }
                                      final rowItemlistRecord =
                                          rowItemlistRecordList.first;
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ToggleIcon(
                                            onPressed: () async {
                                              final packedinbag =
                                                  !rowItemlistRecord
                                                      .packedinbag;

                                              final itemlistRecordData =
                                                  createItemlistRecordData(
                                                packedinbag: packedinbag,
                                              );

                                              await rowItemlistRecord.reference
                                                  .update(itemlistRecordData);
                                            },
                                            value:
                                                rowItemlistRecord.packedinbag,
                                            onIcon: Icon(
                                              Icons.check_box,
                                              color: FlutterFlowTheme
                                                  .secondaryColor,
                                              size: 25,
                                            ),
                                            offIcon: Icon(
                                              Icons.check_box_outline_blank,
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              size: 25,
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
