import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/new_item/new_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_list_model.dart';
export 'item_list_model.dart';

class ItemListWidget extends StatefulWidget {
  /// dashboard
  const ItemListWidget({super.key});

  @override
  State<ItemListWidget> createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
  late ItemListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemListModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TriprecordRecord>>(
      stream: queryTriprecordRecord(
        queryBuilder: (triprecordRecord) => triprecordRecord.where(
          'userref',
          isEqualTo: currentUserReference,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<TriprecordRecord> itemListTriprecordRecordList = snapshot.data!;
        final itemListTriprecordRecord = itemListTriprecordRecordList.isNotEmpty
            ? itemListTriprecordRecordList.first
            : null;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primary,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewItemWidget(),
                ),
              );
            },
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            elevation: 8.0,
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              buttonSize: 48.0,
              icon: Icon(
                Icons.add,
                color: FlutterFlowTheme.of(context).tertiary,
                size: 25.0,
              ),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewItemWidget(),
                  ),
                );
              },
            ),
          ),
          appBar: AppBar(
            backgroundColor: Color(0xFF191938),
            automaticallyImplyLeading: true,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: FlutterFlowTheme.of(context).secondary,
              ),
            ),
            title: Text(
              itemListTriprecordRecord!.tripname,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 25.0,
          ),
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
              child: StreamBuilder<List<ItemlistRecord>>(
                stream: queryItemlistRecord(
                  queryBuilder: (itemlistRecord) => itemlistRecord.where(
                    'userreference',
                    isEqualTo: currentUserReference,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<ItemlistRecord> listViewItemlistRecordList =
                      snapshot.data!;
                  if (listViewItemlistRecordList.isEmpty) {
                    return Center(
                      child: Image.asset(
                        'assets/images/no-item-found.png',
                        width: MediaQuery.sizeOf(context).width * 0.7,
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
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              buttonSize: 48.0,
                              icon: Icon(
                                Icons.delete,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 25.0,
                              ),
                              onPressed: () async {
                                await listViewItemlistRecord.reference.delete();
                              },
                            ),
                            ToggleIcon(
                              onPressed: () async {
                                await listViewItemlistRecord.reference.update({
                                  ...mapToFirestore(
                                    {
                                      'packedinbag':
                                          !listViewItemlistRecord.packedinbag,
                                    },
                                  ),
                                });
                              },
                              value: listViewItemlistRecord.packedinbag,
                              onIcon: Icon(
                                Icons.check_box,
                                color: Colors.black,
                                size: 25.0,
                              ),
                              offIcon: Icon(
                                Icons.check_box_outline_blank,
                                color: Colors.black,
                                size: 25.0,
                              ),
                            ),
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
