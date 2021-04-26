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
  String get startdate;

  @nullable
  String get enddate;

  @nullable
  DocumentReference get userref;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TriprecordRecordBuilder builder) => builder
    ..tripname = ''
    ..destination = ''
    ..origin = ''
    ..startdate = ''
    ..enddate = '';

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
  String startdate,
  String enddate,
  DocumentReference userref,
}) =>
    serializers.serializeWith(
        TriprecordRecord.serializer,
        TriprecordRecord((t) => t
          ..tripname = tripname
          ..destination = destination
          ..origin = origin
          ..startdate = startdate
          ..enddate = enddate
          ..userref = userref));

TriprecordRecord get dummyTriprecordRecord {
  final builder = TriprecordRecordBuilder()
    ..tripname = dummyString
    ..destination = dummyString
    ..origin = dummyString
    ..startdate = dummyString
    ..enddate = dummyString;
  return builder.build();
}

List<TriprecordRecord> createDummyTriprecordRecord({int count}) =>
    List.generate(count, (_) => dummyTriprecordRecord);
