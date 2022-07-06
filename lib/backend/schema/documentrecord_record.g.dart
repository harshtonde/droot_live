// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documentrecord_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DocumentrecordRecord> _$documentrecordRecordSerializer =
    new _$DocumentrecordRecordSerializer();

class _$DocumentrecordRecordSerializer
    implements StructuredSerializer<DocumentrecordRecord> {
  @override
  final Iterable<Type> types = const [
    DocumentrecordRecord,
    _$DocumentrecordRecord
  ];
  @override
  final String wireName = 'DocumentrecordRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, DocumentrecordRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.imageDoc;
    if (value != null) {
      result
        ..add('imageDoc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.documentURL;
    if (value != null) {
      result
        ..add('documentURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.documentType;
    if (value != null) {
      result
        ..add('documentType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  DocumentrecordRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DocumentrecordRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'imageDoc':
          result.imageDoc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'documentURL':
          result.documentURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'documentType':
          result.documentType.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$DocumentrecordRecord extends DocumentrecordRecord {
  @override
  final String imageDoc;
  @override
  final String description;
  @override
  final DateTime createdAt;
  @override
  final DocumentReference<Object> userRef;
  @override
  final String documentURL;
  @override
  final BuiltList<DocumentReference<Object>> documentType;
  @override
  final DocumentReference<Object> reference;

  factory _$DocumentrecordRecord(
          [void Function(DocumentrecordRecordBuilder) updates]) =>
      (new DocumentrecordRecordBuilder()..update(updates)).build();

  _$DocumentrecordRecord._(
      {this.imageDoc,
      this.description,
      this.createdAt,
      this.userRef,
      this.documentURL,
      this.documentType,
      this.reference})
      : super._();

  @override
  DocumentrecordRecord rebuild(
          void Function(DocumentrecordRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DocumentrecordRecordBuilder toBuilder() =>
      new DocumentrecordRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DocumentrecordRecord &&
        imageDoc == other.imageDoc &&
        description == other.description &&
        createdAt == other.createdAt &&
        userRef == other.userRef &&
        documentURL == other.documentURL &&
        documentType == other.documentType &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, imageDoc.hashCode), description.hashCode),
                        createdAt.hashCode),
                    userRef.hashCode),
                documentURL.hashCode),
            documentType.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DocumentrecordRecord')
          ..add('imageDoc', imageDoc)
          ..add('description', description)
          ..add('createdAt', createdAt)
          ..add('userRef', userRef)
          ..add('documentURL', documentURL)
          ..add('documentType', documentType)
          ..add('reference', reference))
        .toString();
  }
}

class DocumentrecordRecordBuilder
    implements Builder<DocumentrecordRecord, DocumentrecordRecordBuilder> {
  _$DocumentrecordRecord _$v;

  String _imageDoc;
  String get imageDoc => _$this._imageDoc;
  set imageDoc(String imageDoc) => _$this._imageDoc = imageDoc;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object> _userRef;
  DocumentReference<Object> get userRef => _$this._userRef;
  set userRef(DocumentReference<Object> userRef) => _$this._userRef = userRef;

  String _documentURL;
  String get documentURL => _$this._documentURL;
  set documentURL(String documentURL) => _$this._documentURL = documentURL;

  ListBuilder<DocumentReference<Object>> _documentType;
  ListBuilder<DocumentReference<Object>> get documentType =>
      _$this._documentType ??= new ListBuilder<DocumentReference<Object>>();
  set documentType(ListBuilder<DocumentReference<Object>> documentType) =>
      _$this._documentType = documentType;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  DocumentrecordRecordBuilder() {
    DocumentrecordRecord._initializeBuilder(this);
  }

  DocumentrecordRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imageDoc = $v.imageDoc;
      _description = $v.description;
      _createdAt = $v.createdAt;
      _userRef = $v.userRef;
      _documentURL = $v.documentURL;
      _documentType = $v.documentType?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DocumentrecordRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DocumentrecordRecord;
  }

  @override
  void update(void Function(DocumentrecordRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DocumentrecordRecord build() {
    _$DocumentrecordRecord _$result;
    try {
      _$result = _$v ??
          new _$DocumentrecordRecord._(
              imageDoc: imageDoc,
              description: description,
              createdAt: createdAt,
              userRef: userRef,
              documentURL: documentURL,
              documentType: _documentType?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'documentType';
        _documentType?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DocumentrecordRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
