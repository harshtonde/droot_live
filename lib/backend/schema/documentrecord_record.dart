import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'documentrecord_record.g.dart';

abstract class DocumentrecordRecord
    implements Built<DocumentrecordRecord, DocumentrecordRecordBuilder> {
  static Serializer<DocumentrecordRecord> get serializer =>
      _$documentrecordRecordSerializer;

  @nullable
  String get documentType;

  @nullable
  String get imageDoc;

  @nullable
  String get description;

  @nullable
  Timestamp get createdAt;

  @nullable
  DocumentReference get userRef;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DocumentrecordRecordBuilder builder) => builder
    ..documentType = ''
    ..imageDoc = ''
    ..description = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('documentrecord');

  static Stream<DocumentrecordRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DocumentrecordRecord._();
  factory DocumentrecordRecord(
          [void Function(DocumentrecordRecordBuilder) updates]) =
      _$DocumentrecordRecord;
}

Map<String, dynamic> createDocumentrecordRecordData({
  String documentType,
  String imageDoc,
  String description,
  Timestamp createdAt,
  DocumentReference userRef,
}) =>
    serializers.serializeWith(
        DocumentrecordRecord.serializer,
        DocumentrecordRecord((d) => d
          ..documentType = documentType
          ..imageDoc = imageDoc
          ..description = description
          ..createdAt = createdAt
          ..userRef = userRef));

DocumentrecordRecord get dummyDocumentrecordRecord {
  final builder = DocumentrecordRecordBuilder()
    ..documentType = dummyString
    ..imageDoc = dummyImagePath
    ..description = dummyString
    ..createdAt = dummyTimestamp;
  return builder.build();
}

List<DocumentrecordRecord> createDummyDocumentrecordRecord({int count}) =>
    List.generate(count, (_) => dummyDocumentrecordRecord);
