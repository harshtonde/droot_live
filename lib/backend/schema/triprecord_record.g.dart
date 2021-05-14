// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'triprecord_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TriprecordRecord> _$triprecordRecordSerializer =
    new _$TriprecordRecordSerializer();

class _$TriprecordRecordSerializer
    implements StructuredSerializer<TriprecordRecord> {
  @override
  final Iterable<Type> types = const [TriprecordRecord, _$TriprecordRecord];
  @override
  final String wireName = 'TriprecordRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, TriprecordRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.tripname;
    if (value != null) {
      result
        ..add('tripname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.destination;
    if (value != null) {
      result
        ..add('destination')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.origin;
    if (value != null) {
      result
        ..add('origin')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userref;
    if (value != null) {
      result
        ..add('userref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DocumentReference)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Timestamp)));
    }
    value = object.startdate;
    if (value != null) {
      result
        ..add('startdate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Timestamp)));
    }
    value = object.enddate;
    if (value != null) {
      result
        ..add('enddate')
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
  TriprecordRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TriprecordRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'tripname':
          result.tripname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'destination':
          result.destination = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'origin':
          result.origin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'userref':
          result.userref = serializers.deserialize(value,
                  specifiedType: const FullType(DocumentReference))
              as DocumentReference;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp;
          break;
        case 'startdate':
          result.startdate = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp;
          break;
        case 'enddate':
          result.enddate = serializers.deserialize(value,
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

class _$TriprecordRecord extends TriprecordRecord {
  @override
  final String tripname;
  @override
  final String destination;
  @override
  final String origin;
  @override
  final DocumentReference userref;
  @override
  final Timestamp createdAt;
  @override
  final Timestamp startdate;
  @override
  final Timestamp enddate;
  @override
  final DocumentReference reference;

  factory _$TriprecordRecord(
          [void Function(TriprecordRecordBuilder) updates]) =>
      (new TriprecordRecordBuilder()..update(updates)).build();

  _$TriprecordRecord._(
      {this.tripname,
      this.destination,
      this.origin,
      this.userref,
      this.createdAt,
      this.startdate,
      this.enddate,
      this.reference})
      : super._();

  @override
  TriprecordRecord rebuild(void Function(TriprecordRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TriprecordRecordBuilder toBuilder() =>
      new TriprecordRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TriprecordRecord &&
        tripname == other.tripname &&
        destination == other.destination &&
        origin == other.origin &&
        userref == other.userref &&
        createdAt == other.createdAt &&
        startdate == other.startdate &&
        enddate == other.enddate &&
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
                            $jc($jc(0, tripname.hashCode),
                                destination.hashCode),
                            origin.hashCode),
                        userref.hashCode),
                    createdAt.hashCode),
                startdate.hashCode),
            enddate.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TriprecordRecord')
          ..add('tripname', tripname)
          ..add('destination', destination)
          ..add('origin', origin)
          ..add('userref', userref)
          ..add('createdAt', createdAt)
          ..add('startdate', startdate)
          ..add('enddate', enddate)
          ..add('reference', reference))
        .toString();
  }
}

class TriprecordRecordBuilder
    implements Builder<TriprecordRecord, TriprecordRecordBuilder> {
  _$TriprecordRecord _$v;

  String _tripname;
  String get tripname => _$this._tripname;
  set tripname(String tripname) => _$this._tripname = tripname;

  String _destination;
  String get destination => _$this._destination;
  set destination(String destination) => _$this._destination = destination;

  String _origin;
  String get origin => _$this._origin;
  set origin(String origin) => _$this._origin = origin;

  DocumentReference _userref;
  DocumentReference get userref => _$this._userref;
  set userref(DocumentReference userref) => _$this._userref = userref;

  Timestamp _createdAt;
  Timestamp get createdAt => _$this._createdAt;
  set createdAt(Timestamp createdAt) => _$this._createdAt = createdAt;

  Timestamp _startdate;
  Timestamp get startdate => _$this._startdate;
  set startdate(Timestamp startdate) => _$this._startdate = startdate;

  Timestamp _enddate;
  Timestamp get enddate => _$this._enddate;
  set enddate(Timestamp enddate) => _$this._enddate = enddate;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  TriprecordRecordBuilder() {
    TriprecordRecord._initializeBuilder(this);
  }

  TriprecordRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tripname = $v.tripname;
      _destination = $v.destination;
      _origin = $v.origin;
      _userref = $v.userref;
      _createdAt = $v.createdAt;
      _startdate = $v.startdate;
      _enddate = $v.enddate;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TriprecordRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TriprecordRecord;
  }

  @override
  void update(void Function(TriprecordRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TriprecordRecord build() {
    final _$result = _$v ??
        new _$TriprecordRecord._(
            tripname: tripname,
            destination: destination,
            origin: origin,
            userref: userref,
            createdAt: createdAt,
            startdate: startdate,
            enddate: enddate,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
