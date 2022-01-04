import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../home_page/home_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class NewTripWidget extends StatefulWidget {
  NewTripWidget({Key key}) : super(key: key);

  @override
  _NewTripWidgetState createState() => _NewTripWidgetState();
}

class _NewTripWidgetState extends State<NewTripWidget> {
  DateTime datePicked1;
  bool _loadingButton1 = false;
  DateTime datePicked2;
  bool _loadingButton2 = false;
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  bool _loadingButton3 = false;
  bool _loadingButton4 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF191938),
        automaticallyImplyLeading: true,
        leading: Icon(
          Icons.arrow_back_ios,
          color: FlutterFlowTheme.secondaryColor,
        ),
        title: Text(
          'Trip',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 25,
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.primaryColor,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(25, 0, 25, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: textController1,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Trip Name',
                    labelStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.tertiaryColor,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF9090AC),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF9090AC),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.tertiaryColor,
                  ),
                ),
                TextFormField(
                  controller: textController2,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Destination City',
                    labelStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.tertiaryColor,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF9090AC),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF9090AC),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.tertiaryColor,
                  ),
                ),
                TextFormField(
                  controller: textController3,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Origin City',
                    labelStyle: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.tertiaryColor,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF9090AC),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF9090AC),
                        width: 1,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.tertiaryColor,
                  ),
                ),
                Divider(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        setState(() => _loadingButton1 = true);
                        try {
                          await DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            onConfirm: (date) {
                              setState(() => datePicked1 = date);
                            },
                            currentTime: getCurrentTimestamp,
                          );
                        } finally {
                          setState(() => _loadingButton1 = false);
                        }
                      },
                      text: 'Start Date',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: Color(0x5C9E9E9E),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 5,
                      ),
                      loading: _loadingButton1,
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        setState(() => _loadingButton2 = true);
                        try {
                          await DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            onConfirm: (date) {
                              setState(() => datePicked2 = date);
                            },
                            currentTime: getCurrentTimestamp,
                          );
                        } finally {
                          setState(() => _loadingButton2 = false);
                        }
                      },
                      text: 'End Date',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: Color(0x5C9E9E9E),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 5,
                      ),
                      loading: _loadingButton2,
                    )
                  ],
                ),
                Divider(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        setState(() => _loadingButton3 = true);
                        try {
                          Navigator.pop(context);
                        } finally {
                          setState(() => _loadingButton3 = false);
                        }
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: Color(0x5C9E9E9E),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 5,
                      ),
                      loading: _loadingButton3,
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        setState(() => _loadingButton4 = true);
                        try {
                          final triprecordCreateData =
                              createTriprecordRecordData(
                            tripname: textController1.text,
                            destination: textController2.text,
                            origin: textController3.text,
                            userref: currentUserReference,
                            createdAt: getCurrentTimestamp,
                            startdate: datePicked1,
                            enddate: datePicked2,
                          );
                          await TriprecordRecord.collection
                              .doc()
                              .set(triprecordCreateData);
                          await Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePageWidget(),
                            ),
                            (r) => false,
                          );
                        } finally {
                          setState(() => _loadingButton4 = false);
                        }
                      },
                      text: 'Save',
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
                        borderRadius: 5,
                      ),
                      loading: _loadingButton4,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
