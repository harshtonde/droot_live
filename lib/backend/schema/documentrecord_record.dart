import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'documentrecord_record.g.dart';

abstract class DocumentrecordRecord
    implements Built<DocumentrecordRecord, DocumentrecordRecordBuilder> {
  static Serializer<DocumentrecordRecord> get serializer =>
      _$documentrecordRecordSerializer;

  @nullable
  String get imageDoc;

  @nullable
  String get description;

  @nullable
  DateTime get createdAt;

  @nullable
  DocumentReference get userRef;

  @nullable
  String get documentURL;

  @nullable
  BuiltList<DocumentReference> get documentType;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DocumentrecordRecordBuilder builder) => builder
    ..imageDoc = ''
    ..description = ''
    ..documentURL = ''
    ..documentType = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('documentrecord');

  static Stream<DocumentrecordRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DocumentrecordRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  DocumentrecordRecord._();
  factory DocumentrecordRecord(
          [void Function(DocumentrecordRecordBuilder) updates]) =
      _$DocumentrecordRecord;

  static DocumentrecordRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDocumentrecordRecordData({
  String imageDoc,
  String description,
  DateTime createdAt,
  DocumentReference userRef,
  String documentURL,
}) =>
    serializers.toFirestore(
        DocumentrecordRecord.serializer,
        DocumentrecordRecord((d) => d
          ..imageDoc = imageDoc
          ..description = description
          ..createdAt = createdAt
          ..userRef = userRef
          ..documentURL = documentURL
          ..documentType = null));
