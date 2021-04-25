import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'newtripdetails_record.g.dart';

abstract class NewtripdetailsRecord
    implements Built<NewtripdetailsRecord, NewtripdetailsRecordBuilder> {
  static Serializer<NewtripdetailsRecord> get serializer =>
      _$newtripdetailsRecordSerializer;

  @nullable
  String get tripname;

  @nullable
  String get destination;

  @nullable
  String get origin;

  @nullable
  String get startdate;

  @nullable
  String get enddate;

  @nullable
  String get uid;

  @nullable
  DocumentReference get userref;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  Timestamp get createdAt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(NewtripdetailsRecordBuilder builder) => builder
    ..tripname = ''
    ..destination = ''
    ..origin = ''
    ..startdate = ''
    ..enddate = ''
    ..uid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('newtripdetails');

  static Stream<NewtripdetailsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  NewtripdetailsRecord._();
  factory NewtripdetailsRecord(
          [void Function(NewtripdetailsRecordBuilder) updates]) =
      _$NewtripdetailsRecord;
}

Map<String, dynamic> createNewtripdetailsRecordData({
  String tripname,
  String destination,
  String origin,
  String startdate,
  String enddate,
  String uid,
  DocumentReference userref,
  Timestamp createdAt,
}) =>
    serializers.serializeWith(
        NewtripdetailsRecord.serializer,
        NewtripdetailsRecord((n) => n
          ..tripname = tripname
          ..destination = destination
          ..origin = origin
          ..startdate = startdate
          ..enddate = enddate
          ..uid = uid
          ..userref = userref
          ..createdAt = createdAt));

NewtripdetailsRecord get dummyNewtripdetailsRecord {
  final builder = NewtripdetailsRecordBuilder()
    ..tripname = dummyString
    ..destination = dummyString
    ..origin = dummyString
    ..startdate = dummyString
    ..enddate = dummyString
    ..uid = dummyString
    ..createdAt = dummyTimestamp;
  return builder.build();
}

List<NewtripdetailsRecord> createDummyNewtripdetailsRecord({int count}) =>
    List.generate(count, (_) => dummyNewtripdetailsRecord);
