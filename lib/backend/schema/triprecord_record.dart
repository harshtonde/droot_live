import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TriprecordRecord extends FirestoreRecord {
  TriprecordRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tripname" field.
  String? _tripname;
  String get tripname => _tripname ?? '';
  bool hasTripname() => _tripname != null;

  // "destination" field.
  String? _destination;
  String get destination => _destination ?? '';
  bool hasDestination() => _destination != null;

  // "origin" field.
  String? _origin;
  String get origin => _origin ?? '';
  bool hasOrigin() => _origin != null;

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "startdate" field.
  DateTime? _startdate;
  DateTime? get startdate => _startdate;
  bool hasStartdate() => _startdate != null;

  // "enddate" field.
  DateTime? _enddate;
  DateTime? get enddate => _enddate;
  bool hasEnddate() => _enddate != null;

  void _initializeFields() {
    _tripname = snapshotData['tripname'] as String?;
    _destination = snapshotData['destination'] as String?;
    _origin = snapshotData['origin'] as String?;
    _userref = snapshotData['userref'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _startdate = snapshotData['startdate'] as DateTime?;
    _enddate = snapshotData['enddate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('triprecord');

  static Stream<TriprecordRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TriprecordRecord.fromSnapshot(s));

  static Future<TriprecordRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TriprecordRecord.fromSnapshot(s));

  static TriprecordRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TriprecordRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TriprecordRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TriprecordRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TriprecordRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TriprecordRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTriprecordRecordData({
  String? tripname,
  String? destination,
  String? origin,
  DocumentReference? userref,
  DateTime? createdAt,
  DateTime? startdate,
  DateTime? enddate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tripname': tripname,
      'destination': destination,
      'origin': origin,
      'userref': userref,
      'created_at': createdAt,
      'startdate': startdate,
      'enddate': enddate,
    }.withoutNulls,
  );

  return firestoreData;
}

class TriprecordRecordDocumentEquality implements Equality<TriprecordRecord> {
  const TriprecordRecordDocumentEquality();

  @override
  bool equals(TriprecordRecord? e1, TriprecordRecord? e2) {
    return e1?.tripname == e2?.tripname &&
        e1?.destination == e2?.destination &&
        e1?.origin == e2?.origin &&
        e1?.userref == e2?.userref &&
        e1?.createdAt == e2?.createdAt &&
        e1?.startdate == e2?.startdate &&
        e1?.enddate == e2?.enddate;
  }

  @override
  int hash(TriprecordRecord? e) => const ListEquality().hash([
        e?.tripname,
        e?.destination,
        e?.origin,
        e?.userref,
        e?.createdAt,
        e?.startdate,
        e?.enddate
      ]);

  @override
  bool isValidKey(Object? o) => o is TriprecordRecord;
}
