import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

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
  DateTime get createdAt;

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

  static Future<ItemlistRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ItemlistRecord._();
  factory ItemlistRecord([void Function(ItemlistRecordBuilder) updates]) =
      _$ItemlistRecord;

  static ItemlistRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createItemlistRecordData({
  DocumentReference userreference,
  String itemname,
  bool packedinbag,
  DateTime createdAt,
}) =>
    serializers.toFirestore(
        ItemlistRecord.serializer,
        ItemlistRecord((i) => i
          ..userreference = userreference
          ..itemname = itemname
          ..packedinbag = packedinbag
          ..createdAt = createdAt));
