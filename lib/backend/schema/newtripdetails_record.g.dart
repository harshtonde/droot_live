// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newtripdetails_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NewtripdetailsRecord> _$newtripdetailsRecordSerializer =
    new _$NewtripdetailsRecordSerializer();

class _$NewtripdetailsRecordSerializer
    implements StructuredSerializer<NewtripdetailsRecord> {
  @override
  final Iterable<Type> types = const [
    NewtripdetailsRecord,
    _$NewtripdetailsRecord
  ];
  @override
  final String wireName = 'NewtripdetailsRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, NewtripdetailsRecord object,
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
    value = object.startdate;
    if (value != null) {
      result
        ..add('startdate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.enddate;
    if (value != null) {
      result
        ..add('enddate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  NewtripdetailsRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewtripdetailsRecordBuilder();

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
        case 'startdate':
          result.startdate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'enddate':
          result.enddate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$NewtripdetailsRecord extends NewtripdetailsRecord {
  @override
  final String tripname;
  @override
  final String destination;
  @override
  final String origin;
  @override
  final String startdate;
  @override
  final String enddate;
  @override
  final DocumentReference reference;

  factory _$NewtripdetailsRecord(
          [void Function(NewtripdetailsRecordBuilder) updates]) =>
      (new NewtripdetailsRecordBuilder()..update(updates)).build();

  _$NewtripdetailsRecord._(
      {this.tripname,
      this.destination,
      this.origin,
      this.startdate,
      this.enddate,
      this.reference})
      : super._();

  @override
  NewtripdetailsRecord rebuild(
          void Function(NewtripdetailsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewtripdetailsRecordBuilder toBuilder() =>
      new NewtripdetailsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewtripdetailsRecord &&
        tripname == other.tripname &&
        destination == other.destination &&
        origin == other.origin &&
        startdate == other.startdate &&
        enddate == other.enddate &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, tripname.hashCode), destination.hashCode),
                    origin.hashCode),
                startdate.hashCode),
            enddate.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewtripdetailsRecord')
          ..add('tripname', tripname)
          ..add('destination', destination)
          ..add('origin', origin)
          ..add('startdate', startdate)
          ..add('enddate', enddate)
          ..add('reference', reference))
        .toString();
  }
}

class NewtripdetailsRecordBuilder
    implements Builder<NewtripdetailsRecord, NewtripdetailsRecordBuilder> {
  _$NewtripdetailsRecord _$v;

  String _tripname;
  String get tripname => _$this._tripname;
  set tripname(String tripname) => _$this._tripname = tripname;

  String _destination;
  String get destination => _$this._destination;
  set destination(String destination) => _$this._destination = destination;

  String _origin;
  String get origin => _$this._origin;
  set origin(String origin) => _$this._origin = origin;

  String _startdate;
  String get startdate => _$this._startdate;
  set startdate(String startdate) => _$this._startdate = startdate;

  String _enddate;
  String get enddate => _$this._enddate;
  set enddate(String enddate) => _$this._enddate = enddate;

  DocumentReference _reference;
  DocumentReference get reference => _$this._reference;
  set reference(DocumentReference reference) => _$this._reference = reference;

  NewtripdetailsRecordBuilder() {
    NewtripdetailsRecord._initializeBuilder(this);
  }

  NewtripdetailsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tripname = $v.tripname;
      _destination = $v.destination;
      _origin = $v.origin;
      _startdate = $v.startdate;
      _enddate = $v.enddate;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewtripdetailsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewtripdetailsRecord;
  }

  @override
  void update(void Function(NewtripdetailsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NewtripdetailsRecord build() {
    final _$result = _$v ??
        new _$NewtripdetailsRecord._(
            tripname: tripname,
            destination: destination,
            origin: origin,
            startdate: startdate,
            enddate: enddate,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
