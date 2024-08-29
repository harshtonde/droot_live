import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocumentrecordRecord extends FirestoreRecord {
  DocumentrecordRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "imageDoc" field.
  String? _imageDoc;
  String get imageDoc => _imageDoc ?? '';
  bool hasImageDoc() => _imageDoc != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "documentURL" field.
  String? _documentURL;
  String get documentURL => _documentURL ?? '';
  bool hasDocumentURL() => _documentURL != null;

  // "documentType" field.
  List<DocumentReference>? _documentType;
  List<DocumentReference> get documentType => _documentType ?? const [];
  bool hasDocumentType() => _documentType != null;

  void _initializeFields() {
    _imageDoc = snapshotData['imageDoc'] as String?;
    _description = snapshotData['description'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _documentURL = snapshotData['documentURL'] as String?;
    _documentType = getDataList(snapshotData['documentType']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('documentrecord');

  static Stream<DocumentrecordRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocumentrecordRecord.fromSnapshot(s));

  static Future<DocumentrecordRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DocumentrecordRecord.fromSnapshot(s));

  static DocumentrecordRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DocumentrecordRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocumentrecordRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocumentrecordRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocumentrecordRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocumentrecordRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocumentrecordRecordData({
  String? imageDoc,
  String? description,
  DateTime? createdAt,
  DocumentReference? userRef,
  String? documentURL,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'imageDoc': imageDoc,
      'description': description,
      'createdAt': createdAt,
      'userRef': userRef,
      'documentURL': documentURL,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocumentrecordRecordDocumentEquality
    implements Equality<DocumentrecordRecord> {
  const DocumentrecordRecordDocumentEquality();

  @override
  bool equals(DocumentrecordRecord? e1, DocumentrecordRecord? e2) {
    const listEquality = ListEquality();
    return e1?.imageDoc == e2?.imageDoc &&
        e1?.description == e2?.description &&
        e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.documentURL == e2?.documentURL &&
        listEquality.equals(e1?.documentType, e2?.documentType);
  }

  @override
  int hash(DocumentrecordRecord? e) => const ListEquality().hash([
        e?.imageDoc,
        e?.description,
        e?.createdAt,
        e?.userRef,
        e?.documentURL,
        e?.documentType
      ]);

  @override
  bool isValidKey(Object? o) => o is DocumentrecordRecord;
}
