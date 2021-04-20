import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'userdata_record.g.dart';

abstract class UserdataRecord
    implements Built<UserdataRecord, UserdataRecordBuilder> {
  static Serializer<UserdataRecord> get serializer =>
      _$userdataRecordSerializer;

  @nullable
  String get firstname;

  @nullable
  String get lastname;

  @nullable
  String get dateofbirth;

  @nullable
  String get emailaddress;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  Timestamp get createdTime;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UserdataRecordBuilder builder) => builder
    ..firstname = ''
    ..lastname = ''
    ..dateofbirth = ''
    ..emailaddress = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userdata');

  static Stream<UserdataRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UserdataRecord._();
  factory UserdataRecord([void Function(UserdataRecordBuilder) updates]) =
      _$UserdataRecord;
}

Map<String, dynamic> createUserdataRecordData({
  String firstname,
  String lastname,
  String dateofbirth,
  String emailaddress,
  String email,
  String displayName,
  String photoUrl,
  String uid,
  Timestamp createdTime,
}) =>
    serializers.serializeWith(
        UserdataRecord.serializer,
        UserdataRecord((u) => u
          ..firstname = firstname
          ..lastname = lastname
          ..dateofbirth = dateofbirth
          ..emailaddress = emailaddress
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime));

UserdataRecord get dummyUserdataRecord {
  final builder = UserdataRecordBuilder()
    ..firstname = dummyString
    ..lastname = dummyString
    ..dateofbirth = dummyString
    ..emailaddress = dummyString
    ..email = dummyString
    ..displayName = dummyString
    ..photoUrl = dummyImagePath
    ..uid = dummyString
    ..createdTime = dummyTimestamp;
  return builder.build();
}

List<UserdataRecord> createDummyUserdataRecord({int count}) =>
    List.generate(count, (_) => dummyUserdataRecord);
