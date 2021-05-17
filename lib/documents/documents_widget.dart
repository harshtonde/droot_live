import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../new_document_page/new_document_page_widget.dart';
import '../profile/profile_widget.dart';
import '../start_page/start_page_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DocumentsWidget extends StatefulWidget {
  DocumentsWidget({Key key}) : super(key: key);

  @override
  _DocumentsWidgetState createState() => _DocumentsWidgetState();
}

class _DocumentsWidgetState extends State<DocumentsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DocumentrecordRecord>>(
      stream: queryDocumentrecordRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        List<DocumentrecordRecord> documentsDocumentrecordRecordList =
            snapshot.data;
        // Customize what your widget looks like with no query results.
        if (snapshot.data.isEmpty) {
          // return Container();
          // For now, we'll just include some dummy data.
          documentsDocumentrecordRecordList =
              createDummyDocumentrecordRecord(count: 1);
        }
        final documentsDocumentrecordRecord =
            documentsDocumentrecordRecordList.first;
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
              'Documents',
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
                  builder: (context) => NewDocumentPageWidget(),
                ),
              );
            },
            backgroundColor: FlutterFlowTheme.secondaryColor,
            elevation: 8,
            child: InkWell(
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewDocumentPageWidget(),
                  ),
                );
              },
              child: Icon(
                Icons.add,
                color: FlutterFlowTheme.tertiaryColor,
                size: 24,
              ),
            ),
          ),
          drawer: Drawer(
            elevation: 100,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.primaryColor,
              ),
              child: StreamBuilder<UsersRecord>(
                stream: UsersRecord.getDocument(currentUserReference),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final columnUsersRecord = snapshot.data;
                  return Padding(
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
                              return Center(child: CircularProgressIndicator());
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
                                icon: Icon(
                                  Icons.home,
                                  color: FlutterFlowTheme.tertiaryColor,
                                  size: 20,
                                ),
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: FlutterFlowTheme.primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
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
                                icon: Icon(
                                  Icons.person,
                                  color: FlutterFlowTheme.tertiaryColor,
                                  size: 20,
                                ),
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: FlutterFlowTheme.primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
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
                                icon: Icon(
                                  Icons.settings,
                                  color: FlutterFlowTheme.tertiaryColor,
                                  size: 20,
                                ),
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: FlutterFlowTheme.primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
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
                                icon: Icon(
                                  Icons.logout,
                                  color: FlutterFlowTheme.tertiaryColor,
                                  size: 20,
                                ),
                                options: FFButtonOptions(
                                  width: 130,
                                  height: 40,
                                  color: FlutterFlowTheme.primaryColor,
                                  textStyle:
                                      FlutterFlowTheme.subtitle2.override(
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
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: StreamBuilder<List<DocumentrecordRecord>>(
                      stream: queryDocumentrecordRecord(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        List<DocumentrecordRecord>
                            listViewDocumentrecordRecordList = snapshot.data;
                        // Customize what your widget looks like with no query results.
                        if (listViewDocumentrecordRecordList.isEmpty) {
                          return Center(
                            child: Image.asset(
                              'assets/images/no-document-found.png',
                            ),
                          );
                        }
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewDocumentrecordRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewDocumentrecordRecord =
                                listViewDocumentrecordRecordList[listViewIndex];
                            return Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                alignment:
                                    Alignment(-0.09999999999999998, 0.95),
                                children: [
                                  Align(
                                    alignment: Alignment(0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl:
                                                  listViewDocumentrecordRecord
                                                      .imageDoc,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                              fit: BoxFit.cover,
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              15, 15, 15, 25),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 10, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Document',
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                                        EdgeInsets.fromLTRB(
                                                            0, 8, 0, 0),
                                                    child: Text(
                                                      'Type:',
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5, 8, 0, 0),
                                                    child: Text(
                                                      listViewDocumentrecordRecord
                                                          .documentType,
                                                      style: FlutterFlowTheme
                                                          .bodyText1
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
                                                        EdgeInsets.fromLTRB(
                                                            0, 8, 0, 0),
                                                    child: Text(
                                                      'Description:',
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5, 8, 0, 0),
                                                    child: Text(
                                                      listViewDocumentrecordRecord
                                                          .description,
                                                      style: FlutterFlowTheme
                                                          .bodyText1
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
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
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
