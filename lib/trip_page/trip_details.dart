import 'package:droot/backend/backend.dart';
import 'package:droot/backend/schema/triprecord_record.dart';
import 'package:droot/flutter_flow/flutter_flow_theme.dart';
import 'package:droot/trip_page/itemlist.dart';
import 'package:droot/trip_page/trip_page_widget.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  static var routes = <String, WidgetBuilder>{
    // '/screen3': (BuildContext context) => new NewTrip(),
  };

  Route<BuildContext> _getRoute(RouteSettings settings) {
    var builder = routes[settings.name];
    if (builder != null) {
      return new MaterialPageRoute(
        settings: settings,
        builder: builder,
      );
    }
    return null;
  }

  Widget build(BuildContext context) {
    var app = new MaterialApp(
      // home: new NewTrip(),
      onGenerateRoute: _getRoute,
    );

    return app;
  }
}

class TripPage extends StatefulWidget {
  const TripPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TripPageState();
}

class _TripPageState extends State<TripPage>
    with SingleTickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _tabController;

  State<StatefulWidget> createState() => _TripPageState();
  static final _kTabPages = <Widget>[
    Center(
        child: Icon(
      Icons.explore,
      size: 64.0,
    )),
    Center(
        child: Icon(
      Icons.explore,
      size: 64.0,
    )),
    Center(
        child: Icon(
      Icons.explore,
      size: 64.0,
    )),
  ];
  static const _kTabs = <Tab>[
    Tab(
        icon: Icon(
          Icons.info_outline,
        ),
        text: 'Trip Info'),
    Tab(icon: Icon(Icons.list), text: 'List'),
    Tab(icon: Icon(Icons.assignment_outlined), text: 'Documents'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
            tripPageTriprecordRecordList =
                createDummyTriprecordRecord(count: 1);
          }
          final tripPageTriprecordRecord = tripPageTriprecordRecordList.first;
          return Scaffold(
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
            body: TabBarView(
              children: <Widget>[
                TripPageWidget(),
                ItemListWidget(),
                TripPageWidget(),
              ],
              controller: _tabController,
            ),
            bottomNavigationBar: Material(
              color: FlutterFlowTheme.appBarColor,
              elevation: 25,
              child: TabBar(
                unselectedLabelColor: Colors.white,
                labelColor: FlutterFlowTheme.secondaryColor,
                indicatorColor: FlutterFlowTheme.secondaryColor,
                tabs: _kTabs,
                controller: _tabController,
              ),
            ),
          );
        });
  }
}
