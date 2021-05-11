import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'triprecord_record.g.dart';

abstract class TriprecordRecord
    implements Built<TriprecordRecord, TriprecordRecordBuilder> {
  static Serializer<TriprecordRecord> get serializer =>
      _$triprecordRecordSerializer;

  @nullable
  String get tripname;

  @nullable
  String get destination;

  @nullable
  String get origin;

  @nullable
  DocumentReference get userref;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  Timestamp get createdAt;

  @nullable
  Timestamp get startdate;

  @nullable
  Timestamp get enddate;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TriprecordRecordBuilder builder) => builder
    ..tripname = ''
    ..destination = ''
    ..origin = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('triprecord');

  static Stream<TriprecordRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TriprecordRecord._();
  factory TriprecordRecord([void Function(TriprecordRecordBuilder) updates]) =
      _$TriprecordRecord;
}

Map<String, dynamic> createTriprecordRecordData({
  String tripname,
  String destination,
  String origin,
  DocumentReference userref,
  Timestamp createdAt,
  Timestamp startdate,
  Timestamp enddate,
}) =>
    serializers.serializeWith(
        TriprecordRecord.serializer,
        TriprecordRecord((t) => t
          ..tripname = tripname
          ..destination = destination
          ..origin = origin
          ..userref = userref
          ..createdAt = createdAt
          ..startdate = startdate
          ..enddate = enddate));

TriprecordRecord get dummyTriprecordRecord {
  final builder = TriprecordRecordBuilder()
    ..tripname = dummyString
    ..destination = dummyString
    ..origin = dummyString
    ..createdAt = dummyTimestamp
    ..startdate = dummyTimestamp
    ..enddate = dummyTimestamp;
  return builder.build();
}

List<TriprecordRecord> createDummyTriprecordRecord({int count}) =>
    List.generate(count, (_) => dummyTriprecordRecord);
