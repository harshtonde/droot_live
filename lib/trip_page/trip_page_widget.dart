import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../new_trip/new_trip_widget.dart';
import '../profile/profile_widget.dart';
import '../start_page/start_page_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class TripPageWidget extends StatefulWidget {
  TripPageWidget({Key key}) : super(key: key);

  @override
  _TripPageWidgetState createState() => _TripPageWidgetState();
}

class _TripPageWidgetState extends State<TripPageWidget> {
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
        List<TriprecordRecord> tripPageTriprecordRecordList = snapshot.data;
        // Customize what your widget looks like with no query results.
        if (snapshot.data.isEmpty) {
          // return Container();
          // For now, we'll just include some dummy data.
          tripPageTriprecordRecordList = createDummyTriprecordRecord(count: 1);
        }
        final tripPageTriprecordRecord = tripPageTriprecordRecordList.first;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0xFF191938),
            automaticallyImplyLeading: true,
            leading: InkWell(
              onTap: () async {
                scaffoldKey.currentState.openDrawer();
              },
              child: Icon(
                Icons.menu,
                color: FlutterFlowTheme.secondaryColor,
              ),
            ),
            title: Text(
              tripPageTriprecordRecord.tripname,
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
          drawer: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Drawer(
              elevation: 100,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.primaryColor,
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Divider(),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.width * 0.25,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: currentUserPhoto,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Divider(),
                      Text(
                        currentUserDisplayName,
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.tertiaryColor,
                        ),
                      ),
                      Text(
                        'Droot user',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.tertiaryColor,
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        indent: 5,
                        endIndent: 5,
                        color: Color(0x5C9E9E9E),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Home',
                              iconData: Icons.home,
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color: FlutterFlowTheme.primaryColor,
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                                iconSize: 20,
                                iconColor: FlutterFlowTheme.tertiaryColor,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                            Divider(),
                            FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileWidget(),
                                  ),
                                );
                              },
                              text: 'Profile',
                              iconData: Icons.person,
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color: FlutterFlowTheme.primaryColor,
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                                iconSize: 20,
                                iconColor: FlutterFlowTheme.tertiaryColor,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                            Divider(),
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Settings',
                              iconData: Icons.settings,
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color: FlutterFlowTheme.primaryColor,
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                                iconSize: 20,
                                iconColor: FlutterFlowTheme.tertiaryColor,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Color(0x5C9E9E9E),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                await signOut();
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StartPageWidget(),
                                  ),
                                  (r) => false,
                                );
                              },
                              text: 'Sign Out',
                              iconData: Icons.logout,
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color: FlutterFlowTheme.primaryColor,
                                textStyle: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                                iconSize: 20,
                                iconColor: FlutterFlowTheme.tertiaryColor,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Color(0xFFF5F5F5),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      alignment: Alignment(-0.09999999999999998, 0.95),
                      children: [
                        Align(
                          alignment: Alignment(0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.network(
                                'https://media.cntraveler.com/photos/5f3484e301aedaf2771c644b/16:9/w_4239,h_2384,c_limit/RoadtripPlaylist-GettyImages-1192260535.jpg',
                                width: double.infinity,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Overview',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 8, 0, 0),
                                          child: Text(
                                            'Origin:',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 8, 0, 0),
                                          child: Text(
                                            tripPageTriprecordRecord.origin,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(20, 8, 0, 0),
                                          child: Text(
                                            'Destination:',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 8, 0, 0),
                                          child: Text(
                                            tripPageTriprecordRecord
                                                .destination,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 8, 0, 0),
                                          child: Text(
                                            'Start Date:',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 8, 0, 0),
                                          child: Text(
                                            tripPageTriprecordRecord.startdate,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 8, 0, 0),
                                          child: Text(
                                            'End  Date:',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 8, 0, 0),
                                          child: Text(
                                            tripPageTriprecordRecord.enddate,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
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
                        ),
                        Align(
                          alignment: Alignment(0.92, 0.85),
                          child: FloatingActionButton(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewTripWidget(),
                                ),
                              );
                            },
                            backgroundColor: Color(0xFFF40000),
                            elevation: 25,
                            child: IconButton(
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.flagCheckered,
                                color: FlutterFlowTheme.tertiaryColor,
                                size: 25,
                              ),
                              iconSize: 25,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      await tripPageTriprecordRecord.reference.delete();
                      Navigator.pop(context);
                    },
                    text: 'Delete',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.secondaryColor,
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
