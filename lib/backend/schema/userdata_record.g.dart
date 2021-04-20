// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userdata_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserdataRecord> _$userdataRecordSerializer =
    new _$UserdataRecordSerializer();

class _$UserdataRecordSerializer
    implements StructuredSerializer<UserdataRecord> {
  @override
  final Iterable<Type> types = const [UserdataRecord, _$UserdataRecord];
  @override
  final String wireName = 'UserdataRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, UserdataRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.firstname;
    if (value != null) {
      result
        ..add('firstname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastname;
    if (value != null) {
      result
        ..add('lastname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateofbirth;
    if (value != null) {
      result
        ..add('dateofbirth')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.emailaddress;
    if (value != null) {
      result
        ..add('emailaddress')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Timestamp)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    return result;
  }

  @override
  UserdataRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserdataRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'firstname':
          result.firstname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastname':
          result.lastname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dateofbirth':
          result.dateofbirth = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'emailaddress':
          result.emailaddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
      }
    }

    return result.build();
  }
}

class _$UserdataRecord extends UserdataRecord {
  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String dateofbirth;
  @override
  final String emailaddress;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String photoUrl;
  @override
  final String uid;
  @override
  final Timestamp createdTime;
  @override
  final DocumentReference reference;

  factory _$UserdataRecord([void Function(UserdataRecordBuilder) updates]) =>
      (new UserdataRecordBuilder()..update(updates)).build();

  _$UserdataRecord._(
      {this.firstname,
      this.lastname,
      this.dateofbirth,
      this.emailaddress,
      this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.reference})
      : super._();

  @override
  UserdataRecord rebuild(void Function(UserdataRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserdataRecordBuilder toBuilder() =>
      new UserdataRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserdataRecord &&
        firstname == other.firstname &&
        lastname == other.lastname &&
        dateofbirth == other.dateofbirth &&
        emailaddress == other.emailaddress &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, firstname.hashCode),
                                        lastname.hashCode),
                                    dateofbirth.hashCode),
                                emailaddress.hashCode),
                            email.hashCode),
                        displayName.hashCode),
                    photoUrl.hashCode),
                uid.hashCode),
            createdTime.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserdataRecord')
          ..add('firstname', firstname)
          ..add('lastname', lastname)
          ..add('dateofbirth', dateofbirth)
          ..add('emailaddress', emailaddress)
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('reference', reference))
        .toString();
  }
}

class UserdataRecordBuilder
    implements Builder<UserdataRecord, UserdataRecordBuilder> {
  _$UserdataRecord _$v;

  String _firstname;
  String get firstname => _$this._firstname;
  set firstname(String firstname) => _$this._firstname = firstname;

  String _lastname;
  String get lastname => _$this._lastname;
  set lastname(String lastname) => _$this._lastname = lastname;

  String _dateofbirth;
  String get dateofbirth => _$this._dateofbirth;
  set dateofbirth(String dateofbirth) => _$this._dateofbirth = dateofbirth;

  String _emailaddress;
  String get emailaddress => _$this._emailaddress;
  set emailaddress(String emailaddress) => _$this._emailaddress = emailaddress;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  Timestamp _createdTime;
  Timestamp get createdTime => _$this._createdTime;
  set createdTime(Timestamp createdTime) => _$this._createdTime = createdTime;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  UserdataRecordBuilder() {
    UserdataRecord._initializeBuilder(this);
  }

  UserdataRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _firstname = $v.firstname;
      _lastname = $v.lastname;
      _dateofbirth = $v.dateofbirth;
      _emailaddress = $v.emailaddress;
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserdataRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserdataRecord;
  }

  @override
  void update(void Function(UserdataRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UserdataRecord build() {
    final _$result = _$v ??
        new _$UserdataRecord._(
            firstname: firstname,
            lastname: lastname,
            dateofbirth: dateofbirth,
            emailaddress: emailaddress,
            email: email,
            displayName: displayName,
            photoUrl: photoUrl,
            uid: uid,
            createdTime: createdTime,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
