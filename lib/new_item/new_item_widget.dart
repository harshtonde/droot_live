import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewItemWidget extends StatefulWidget {
  NewItemWidget({Key key}) : super(key: key);

  @override
  _NewItemWidgetState createState() => _NewItemWidgetState();
}

class _NewItemWidgetState extends State<NewItemWidget> {
  TextEditingController textController;
  bool checkboxListTileValue;
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
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
          'Item',
          style: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 254,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Color(0xFFF5F5F5),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 7),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Add new item',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: TextFormField(
                              controller: textController,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                labelText: 'Item Name',
                                labelStyle: FlutterFlowTheme.bodyText1,
                                hintText: '[Some hint text...]',
                                hintStyle: FlutterFlowTheme.bodyText1,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.secondaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.bodyText1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                            child: CheckboxListTile(
                              value: checkboxListTileValue ??= false,
                              onChanged: (newValue) => setState(
                                  () => checkboxListTileValue = newValue),
                              title: Text(
                                'Is the item packed?',
                                style: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              tileColor: Color(0x00F40000),
                              activeColor: FlutterFlowTheme.secondaryColor,
                              checkColor: FlutterFlowTheme.tertiaryColor,
                              dense: true,
                              controlAffinity: ListTileControlAffinity.trailing,
                            ),
                          )
                        ],
                      ),
                    ),
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
                          Navigator.pop(context);
                        } finally {
                          setState(() => _loadingButton1 = false);
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
                      loading: _loadingButton1,
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        setState(() => _loadingButton2 = true);
                        try {
                          final itemlistCreateData = createItemlistRecordData(
                            packedinbag: checkboxListTileValue,
                            userreference: currentUserReference,
                            itemname: textController.text,
                          );
                          await ItemlistRecord.collection
                              .doc()
                              .set(itemlistCreateData);
                          Navigator.pop(context);
                        } finally {
                          setState(() => _loadingButton2 = false);
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
                      loading: _loadingButton2,
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
