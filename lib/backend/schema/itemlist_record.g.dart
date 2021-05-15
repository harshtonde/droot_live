// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itemlist_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ItemlistRecord> _$itemlistRecordSerializer =
    new _$ItemlistRecordSerializer();

class _$ItemlistRecordSerializer
    implements StructuredSerializer<ItemlistRecord> {
  @override
  final Iterable<Type> types = const [ItemlistRecord, _$ItemlistRecord];
  @override
  final String wireName = 'ItemlistRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ItemlistRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.userreference;
    if (value != null) {
      result
        ..add('userreference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    value = object.itemname;
    if (value != null) {
      result
        ..add('itemname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.packedinbag;
    if (value != null) {
      result
        ..add('packedinbag')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
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
  ItemlistRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ItemlistRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'userreference':
          result.userreference = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
        case 'itemname':
          result.itemname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'packedinbag':
          result.packedinbag = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
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

class _$ItemlistRecord extends ItemlistRecord {
  @override
  final DocumentReference userreference;
  @override
  final String itemname;
  @override
  final bool packedinbag;
  @override
  final Timestamp createdAt;
  @override
  final DocumentReference reference;

  factory _$ItemlistRecord([void Function(ItemlistRecordBuilder) updates]) =>
      (new ItemlistRecordBuilder()..update(updates)).build();

  _$ItemlistRecord._(
      {this.userreference,
      this.itemname,
      this.packedinbag,
      this.createdAt,
      this.reference})
      : super._();

  @override
  ItemlistRecord rebuild(void Function(ItemlistRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemlistRecordBuilder toBuilder() =>
      new ItemlistRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemlistRecord &&
        userreference == other.userreference &&
        itemname == other.itemname &&
        packedinbag == other.packedinbag &&
        createdAt == other.createdAt &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, userreference.hashCode), itemname.hashCode),
                packedinbag.hashCode),
            createdAt.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ItemlistRecord')
          ..add('userreference', userreference)
          ..add('itemname', itemname)
          ..add('packedinbag', packedinbag)
          ..add('createdAt', createdAt)
          ..add('reference', reference))
        .toString();
  }
}

class ItemlistRecordBuilder
    implements Builder<ItemlistRecord, ItemlistRecordBuilder> {
  _$ItemlistRecord _$v;

  DocumentReference _userreference;
  DocumentReference get userreference => _$this._userreference;
  set userreference(DocumentReference userreference) =>
      _$this._userreference = userreference;

  String _itemname;
  String get itemname => _$this._itemname;
  set itemname(String itemname) => _$this._itemname = itemname;

  bool _packedinbag;
  bool get packedinbag => _$this._packedinbag;
  set packedinbag(bool packedinbag) => _$this._packedinbag = packedinbag;

  Timestamp _createdAt;
  Timestamp get createdAt => _$this._createdAt;
  set createdAt(Timestamp createdAt) => _$this._createdAt = createdAt;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  ItemlistRecordBuilder() {
    ItemlistRecord._initializeBuilder(this);
  }

  ItemlistRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userreference = $v.userreference;
      _itemname = $v.itemname;
      _packedinbag = $v.packedinbag;
      _createdAt = $v.createdAt;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ItemlistRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ItemlistRecord;
  }

  @override
  void update(void Function(ItemlistRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ItemlistRecord build() {
    final _$result = _$v ??
        new _$ItemlistRecord._(
            userreference: userreference,
            itemname: itemname,
            packedinbag: packedinbag,
            createdAt: createdAt,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
