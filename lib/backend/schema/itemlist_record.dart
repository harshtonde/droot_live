import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemlistRecord extends FirestoreRecord {
  ItemlistRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userreference" field.
  DocumentReference? _userreference;
  DocumentReference? get userreference => _userreference;
  bool hasUserreference() => _userreference != null;

  // "itemname" field.
  String? _itemname;
  String get itemname => _itemname ?? '';
  bool hasItemname() => _itemname != null;

  // "packedinbag" field.
  bool? _packedinbag;
  bool get packedinbag => _packedinbag ?? false;
  bool hasPackedinbag() => _packedinbag != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _userreference = snapshotData['userreference'] as DocumentReference?;
    _itemname = snapshotData['itemname'] as String?;
    _packedinbag = snapshotData['packedinbag'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('itemlist');

  static Stream<ItemlistRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemlistRecord.fromSnapshot(s));

  static Future<ItemlistRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemlistRecord.fromSnapshot(s));

  static ItemlistRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ItemlistRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemlistRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemlistRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemlistRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemlistRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemlistRecordData({
  DocumentReference? userreference,
  String? itemname,
  bool? packedinbag,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userreference': userreference,
      'itemname': itemname,
      'packedinbag': packedinbag,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemlistRecordDocumentEquality implements Equality<ItemlistRecord> {
  const ItemlistRecordDocumentEquality();

  @override
  bool equals(ItemlistRecord? e1, ItemlistRecord? e2) {
    return e1?.userreference == e2?.userreference &&
        e1?.itemname == e2?.itemname &&
        e1?.packedinbag == e2?.packedinbag &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(ItemlistRecord? e) => const ListEquality()
      .hash([e?.userreference, e?.itemname, e?.packedinbag, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is ItemlistRecord;
}
