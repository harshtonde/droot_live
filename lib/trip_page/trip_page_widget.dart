import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../item_list/item_list_widget.dart';
import '../new_document_page/new_document_page_widget.dart';
import '../profile/profile_widget.dart';
import '../start_page/start_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TripPageWidget extends StatefulWidget {
  TripPageWidget({
    Key key,
    this.tripRecord,
  }) : super(key: key);

  final TriprecordRecord tripRecord;

  @override
  _TripPageWidgetState createState() => _TripPageWidgetState();
}

class _TripPageWidgetState extends State<TripPageWidget> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  bool _loadingButton3 = false;
  bool _loadingButton4 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loadingButton5 = false;
  bool _loadingButton6 = false;

  @override
  Widget build(BuildContext context) {
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
          widget.tripRecord.tripname,
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            buttonSize: 48,
            icon: Icon(
              Icons.delete_outlined,
              color: FlutterFlowTheme.secondaryColor,
              size: 30,
            ),
            onPressed: () async {
              Navigator.pop(context);
              await widget.tripRecord.reference.delete();
            },
          )
        ],
        centerTitle: true,
        elevation: 25,
      ),
      backgroundColor: FlutterFlowTheme.primaryColor,
      drawer: Drawer(
        elevation: 100,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.primaryColor,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
            child: StreamBuilder<UsersRecord>(
              stream: UsersRecord.getDocument(currentUserReference),
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
                final columnUsersRecord = snapshot.data;
                return Column(
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
                      child: Image.network(
                        columnUsersRecord.photoUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Divider(),
                    StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(currentUserReference),
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
                        final textUsersRecord = snapshot.data;
                        return Text(
                          columnUsersRecord.displayName,
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.tertiaryColor,
                          ),
                        );
                      },
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
                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
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
                            icon: Icon(
                              Icons.home,
                              color: FlutterFlowTheme.tertiaryColor,
                              size: 20,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.primaryColor,
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
                            loading: _loadingButton1,
                          ),
                          Divider(),
                          FFButtonWidget(
                            onPressed: () async {
                              setState(() => _loadingButton2 = true);
                              try {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileWidget(),
                                  ),
                                );
                              } finally {
                                setState(() => _loadingButton2 = false);
                              }
                            },
                            text: 'Profile',
                            icon: Icon(
                              Icons.person,
                              color: FlutterFlowTheme.tertiaryColor,
                              size: 20,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.primaryColor,
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
                            loading: _loadingButton2,
                          ),
                          Divider(),
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Settings',
                            icon: Icon(
                              Icons.settings,
                              color: FlutterFlowTheme.tertiaryColor,
                              size: 20,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.primaryColor,
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
                            loading: _loadingButton3,
                          ),
                          Divider(
                            thickness: 1,
                            color: Color(0x5C9E9E9E),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              setState(() => _loadingButton4 = true);
                              try {
                                await signOut();
                                await Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StartPageWidget(),
                                  ),
                                  (r) => false,
                                );
                              } finally {
                                setState(() => _loadingButton4 = false);
                              }
                            },
                            text: 'Sign Out',
                            icon: Icon(
                              Icons.logout,
                              color: FlutterFlowTheme.tertiaryColor,
                              size: 20,
                            ),
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.primaryColor,
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
                            loading: _loadingButton4,
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FutureBuilder<dynamic>(
                  future: unsplashCall(
                    query: widget.tripRecord.destination,
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
                    final cardUnsplashResponse = snapshot.data;
                    return Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Color(0xFFF5F5F5),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        alignment:
                            AlignmentDirectional(-0.09999999999999998, 0.95),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Builder(
                                  builder: (context) {
                                    final searchResults = (getJsonField(
                                                    cardUnsplashResponse,
                                                    r'''$.results''')
                                                ?.toList() ??
                                            [])
                                        .take(1)
                                        .toList();
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children:
                                          List.generate(searchResults.length,
                                              (searchResultsIndex) {
                                        final searchResultsItem =
                                            searchResults[searchResultsIndex];
                                        return FutureBuilder<dynamic>(
                                          future: unsplashCall(
                                            query:
                                                widget.tripRecord.destination,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                  ),
                                                ),
                                              );
                                            }
                                            final imageUnsplashResponse =
                                                snapshot.data;
                                            return CachedNetworkImage(
                                              imageUrl: getJsonField(
                                                  searchResultsItem,
                                                  r'''$.urls.full'''),
                                              width: double.infinity,
                                              height: 200,
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        );
                                      }),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 15, 15, 25),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 10, 0, 0),
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 0),
                                            child: Text(
                                              'Origin:',
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 8, 0, 0),
                                            child: Text(
                                              widget.tripRecord.origin,
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 8, 0, 0),
                                            child: Text(
                                              'Destination:',
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 8, 0, 0),
                                            child: Text(
                                              widget.tripRecord.destination,
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 0),
                                            child: Text(
                                              'Start Date:',
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 8, 0, 0),
                                            child: Text(
                                              widget.tripRecord.startdate
                                                  .toString(),
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 0),
                                            child: Text(
                                              'End Date:',
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 8, 0, 0),
                                            child: Text(
                                              widget.tripRecord.enddate
                                                  .toString(),
                                              style: FlutterFlowTheme.bodyText1,
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
                    );
                  },
                ),
                Divider(),
                Text(
                  'Weather ☁',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.title2.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.tertiaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Color(0xFFF5F5F5),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 1, 15, 25),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Temperature(in °C):',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: FutureBuilder<dynamic>(
                                      future: weatherAPICall(
                                        q: widget.tripRecord.destination,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        final textWeatherAPIResponse =
                                            snapshot.data;
                                        return Text(
                                          getJsonField(textWeatherAPIResponse,
                                                  r'''$.current.temp_c''')
                                              .toString(),
                                          style: FlutterFlowTheme.subtitle2
                                              .override(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Weather:',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 0, 0, 0),
                                    child: FutureBuilder<dynamic>(
                                      future: weatherAPICall(
                                        q: widget.tripRecord.destination,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        final textWeatherAPIResponse =
                                            snapshot.data;
                                        return AutoSizeText(
                                          getJsonField(textWeatherAPIResponse,
                                                  r'''$.current.condition.text''')
                                              .toString(),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  FutureBuilder<dynamic>(
                                    future: weatherAPICall(
                                      q: widget.tripRecord.destination,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      final imageWeatherAPIResponse =
                                          snapshot.data;
                                      return CachedNetworkImage(
                                        imageUrl: getJsonField(
                                            imageWeatherAPIResponse,
                                            r'''$.current.condition.icon'''),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        fit: BoxFit.fill,
                                      );
                                    },
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
                FFButtonWidget(
                  onPressed: () async {
                    setState(() => _loadingButton5 = true);
                    try {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewDocumentPageWidget(),
                        ),
                      );
                    } finally {
                      setState(() => _loadingButton5 = false);
                    }
                  },
                  text: 'Documents',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: Color(0x27FFFFFF),
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
                  loading: _loadingButton5,
                ),
                FFButtonWidget(
                  onPressed: () async {
                    setState(() => _loadingButton6 = true);
                    try {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemListWidget(),
                        ),
                      );
                    } finally {
                      setState(() => _loadingButton6 = false);
                    }
                  },
                  text: 'List',
                  options: FFButtonOptions(
                    width: 130,
                    height: 40,
                    color: Color(0x27FFFFFF),
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
                  loading: _loadingButton6,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
