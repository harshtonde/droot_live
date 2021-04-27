import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'itemlist_record.g.dart';

abstract class ItemlistRecord
    implements Built<ItemlistRecord, ItemlistRecordBuilder> {
  static Serializer<ItemlistRecord> get serializer =>
      _$itemlistRecordSerializer;

  @nullable
  DocumentReference get userreference;

  @nullable
  String get itemname;

  @nullable
  bool get packedinbag;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  Timestamp get createdAt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ItemlistRecordBuilder builder) => builder
    ..itemname = ''
    ..packedinbag = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('itemlist');

  static Stream<ItemlistRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ItemlistRecord._();
  factory ItemlistRecord([void Function(ItemlistRecordBuilder) updates]) =
      _$ItemlistRecord;
}

Map<String, dynamic> createItemlistRecordData({
  DocumentReference userreference,
  String itemname,
  bool packedinbag,
  Timestamp createdAt,
}) =>
    serializers.serializeWith(
        ItemlistRecord.serializer,
        ItemlistRecord((i) => i
          ..userreference = userreference
          ..itemname = itemname
          ..packedinbag = packedinbag
          ..createdAt = createdAt));

ItemlistRecord get dummyItemlistRecord {
  final builder = ItemlistRecordBuilder()
    ..itemname = dummyString
    ..packedinbag = dummyBoolean
    ..createdAt = dummyTimestamp;
  return builder.build();
}

List<ItemlistRecord> createDummyItemlistRecord({int count}) =>
    List.generate(count, (_) => dummyItemlistRecord);
