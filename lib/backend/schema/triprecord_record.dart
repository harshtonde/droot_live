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
  BuiltList<String> get tripname;

  @nullable
  BuiltList<String> get destination;

  @nullable
  BuiltList<String> get origin;

  @nullable
  BuiltList<String> get startdate;

  @nullable
  BuiltList<String> get enddate;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TriprecordRecordBuilder builder) => builder
    ..tripname = ListBuilder()
    ..destination = ListBuilder()
    ..origin = ListBuilder()
    ..startdate = ListBuilder()
    ..enddate = ListBuilder();

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
  DocumentReference user,
}) =>
    serializers.serializeWith(
        TriprecordRecord.serializer,
        TriprecordRecord((t) => t
          ..tripname = null
          ..destination = null
          ..origin = null
          ..startdate = null
          ..enddate = null
          ..user = user));

TriprecordRecord get dummyTriprecordRecord {
  final builder = TriprecordRecordBuilder()
    ..tripname = ListBuilder([dummyString, dummyString])
    ..destination = ListBuilder([dummyString, dummyString])
    ..origin = ListBuilder([dummyString, dummyString])
    ..startdate = ListBuilder([dummyString, dummyString])
    ..enddate = ListBuilder([dummyString, dummyString]);
  return builder.build();
}

List<TriprecordRecord> createDummyTriprecordRecord({int count}) =>
    List.generate(count, (_) => dummyTriprecordRecord);
