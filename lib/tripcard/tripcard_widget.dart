import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TripcardWidget extends StatefulWidget {
  TripcardWidget({Key key}) : super(key: key);

  @override
  _TripcardWidgetState createState() => _TripcardWidgetState();
}

class _TripcardWidgetState extends State<TripcardWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<NewtripdetailsRecord>>(
      stream: queryNewtripdetailsRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<NewtripdetailsRecord> tripcardNewtripdetailsRecordList =
            snapshot.data;
        // Customize what your widget looks like with no query results.
        if (snapshot.data.isEmpty) {
          // return Container();
          // For now, we'll just include some dummy data.
          tripcardNewtripdetailsRecordList =
              createDummyNewtripdetailsRecord(count: 1);
        }
        final tripcardNewtripdetailsRecord =
            tripcardNewtripdetailsRecordList.first;
        return Scaffold(
          key: scaffoldKey,
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.primaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: FlutterFlowTheme.secondaryColor,
                  elevation: 25,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tripcardNewtripdetailsRecord.tripname,
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.title1.override(
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Text(
                              tripcardNewtripdetailsRecord.startdate,
                              style: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.tertiaryColor,
                              ),
                            )
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 30,
                          ),
                          iconSize: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
