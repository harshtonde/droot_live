import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

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
  DateTime get createdAt;

  @nullable
  DateTime get startdate;

  @nullable
  DateTime get enddate;

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

  static TriprecordRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTriprecordRecordData({
  String tripname,
  String destination,
  String origin,
  DocumentReference userref,
  DateTime createdAt,
  DateTime startdate,
  DateTime enddate,
}) =>
    serializers.toFirestore(
        TriprecordRecord.serializer,
        TriprecordRecord((t) => t
          ..tripname = tripname
          ..destination = destination
          ..origin = origin
          ..userref = userref
          ..createdAt = createdAt
          ..startdate = startdate
          ..enddate = enddate));
