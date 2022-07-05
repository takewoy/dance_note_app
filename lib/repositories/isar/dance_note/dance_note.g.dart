// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dance_note.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetDanceNoteCollection on Isar {
  IsarCollection<DanceNote> get danceNotes => getCollection();
}

const DanceNoteSchema = CollectionSchema(
  name: 'DanceNote',
  schema:
      '{"name":"DanceNote","idName":"id","properties":[{"name":"category","type":"Long"},{"name":"createdAt","type":"Long"},{"name":"editedAt","type":"Long"},{"name":"note","type":"String"},{"name":"picFour","type":"String"},{"name":"picOne","type":"String"},{"name":"picThree","type":"String"},{"name":"picTwo","type":"String"}],"indexes":[{"name":"note","unique":false,"properties":[{"name":"note","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'category': 0,
    'createdAt': 1,
    'editedAt': 2,
    'note': 3,
    'picFour': 4,
    'picOne': 5,
    'picThree': 6,
    'picTwo': 7
  },
  listProperties: {},
  indexIds: {'note': 0},
  indexValueTypes: {
    'note': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _danceNoteGetId,
  setId: _danceNoteSetId,
  getLinks: _danceNoteGetLinks,
  attachLinks: _danceNoteAttachLinks,
  serializeNative: _danceNoteSerializeNative,
  deserializeNative: _danceNoteDeserializeNative,
  deserializePropNative: _danceNoteDeserializePropNative,
  serializeWeb: _danceNoteSerializeWeb,
  deserializeWeb: _danceNoteDeserializeWeb,
  deserializePropWeb: _danceNoteDeserializePropWeb,
  version: 3,
);

int? _danceNoteGetId(DanceNote object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _danceNoteSetId(DanceNote object, int id) {
  object.id = id;
}

List<IsarLinkBase> _danceNoteGetLinks(DanceNote object) {
  return [];
}

const _danceNoteDanceCategoryConverter = DanceCategoryConverter();

void _danceNoteSerializeNative(
    IsarCollection<DanceNote> collection,
    IsarRawObject rawObj,
    DanceNote object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = _danceNoteDanceCategoryConverter.toIsar(object.category);
  final _category = value0;
  final value1 = object.createdAt;
  final _createdAt = value1;
  final value2 = object.editedAt;
  final _editedAt = value2;
  final value3 = object.note;
  final _note = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_note.length) as int;
  final value4 = object.picFour;
  final _picFour = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_picFour.length) as int;
  final value5 = object.picOne;
  final _picOne = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_picOne.length) as int;
  final value6 = object.picThree;
  final _picThree = IsarBinaryWriter.utf8Encoder.convert(value6);
  dynamicSize += (_picThree.length) as int;
  final value7 = object.picTwo;
  final _picTwo = IsarBinaryWriter.utf8Encoder.convert(value7);
  dynamicSize += (_picTwo.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _category);
  writer.writeDateTime(offsets[1], _createdAt);
  writer.writeDateTime(offsets[2], _editedAt);
  writer.writeBytes(offsets[3], _note);
  writer.writeBytes(offsets[4], _picFour);
  writer.writeBytes(offsets[5], _picOne);
  writer.writeBytes(offsets[6], _picThree);
  writer.writeBytes(offsets[7], _picTwo);
}

DanceNote _danceNoteDeserializeNative(IsarCollection<DanceNote> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = DanceNote();
  object.category =
      _danceNoteDanceCategoryConverter.fromIsar(reader.readLong(offsets[0]));
  object.createdAt = reader.readDateTime(offsets[1]);
  object.editedAt = reader.readDateTime(offsets[2]);
  object.id = id;
  object.note = reader.readString(offsets[3]);
  object.picFour = reader.readString(offsets[4]);
  object.picOne = reader.readString(offsets[5]);
  object.picThree = reader.readString(offsets[6]);
  object.picTwo = reader.readString(offsets[7]);
  return object;
}

P _danceNoteDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (_danceNoteDanceCategoryConverter
          .fromIsar(reader.readLong(offset))) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _danceNoteSerializeWeb(
    IsarCollection<DanceNote> collection, DanceNote object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'category',
      _danceNoteDanceCategoryConverter.toIsar(object.category));
  IsarNative.jsObjectSet(
      jsObj, 'createdAt', object.createdAt.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(
      jsObj, 'editedAt', object.editedAt.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'note', object.note);
  IsarNative.jsObjectSet(jsObj, 'picFour', object.picFour);
  IsarNative.jsObjectSet(jsObj, 'picOne', object.picOne);
  IsarNative.jsObjectSet(jsObj, 'picThree', object.picThree);
  IsarNative.jsObjectSet(jsObj, 'picTwo', object.picTwo);
  return jsObj;
}

DanceNote _danceNoteDeserializeWeb(
    IsarCollection<DanceNote> collection, dynamic jsObj) {
  final object = DanceNote();
  object.category = _danceNoteDanceCategoryConverter.fromIsar(
      IsarNative.jsObjectGet(jsObj, 'category') ?? double.negativeInfinity);
  object.createdAt = IsarNative.jsObjectGet(jsObj, 'createdAt') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'createdAt'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.editedAt = IsarNative.jsObjectGet(jsObj, 'editedAt') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'editedAt'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.note = IsarNative.jsObjectGet(jsObj, 'note') ?? '';
  object.picFour = IsarNative.jsObjectGet(jsObj, 'picFour') ?? '';
  object.picOne = IsarNative.jsObjectGet(jsObj, 'picOne') ?? '';
  object.picThree = IsarNative.jsObjectGet(jsObj, 'picThree') ?? '';
  object.picTwo = IsarNative.jsObjectGet(jsObj, 'picTwo') ?? '';
  return object;
}

P _danceNoteDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'category':
      return (_danceNoteDanceCategoryConverter.fromIsar(
          IsarNative.jsObjectGet(jsObj, 'category') ??
              double.negativeInfinity)) as P;
    case 'createdAt':
      return (IsarNative.jsObjectGet(jsObj, 'createdAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'createdAt'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'editedAt':
      return (IsarNative.jsObjectGet(jsObj, 'editedAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'editedAt'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'note':
      return (IsarNative.jsObjectGet(jsObj, 'note') ?? '') as P;
    case 'picFour':
      return (IsarNative.jsObjectGet(jsObj, 'picFour') ?? '') as P;
    case 'picOne':
      return (IsarNative.jsObjectGet(jsObj, 'picOne') ?? '') as P;
    case 'picThree':
      return (IsarNative.jsObjectGet(jsObj, 'picThree') ?? '') as P;
    case 'picTwo':
      return (IsarNative.jsObjectGet(jsObj, 'picTwo') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _danceNoteAttachLinks(IsarCollection col, int id, DanceNote object) {}

extension DanceNoteQueryWhereSort
    on QueryBuilder<DanceNote, DanceNote, QWhere> {
  QueryBuilder<DanceNote, DanceNote, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<DanceNote, DanceNote, QAfterWhere> anyNote() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'note'));
  }
}

extension DanceNoteQueryWhere
    on QueryBuilder<DanceNote, DanceNote, QWhereClause> {
  QueryBuilder<DanceNote, DanceNote, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<DanceNote, DanceNote, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<DanceNote, DanceNote, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<DanceNote, DanceNote, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterWhereClause> noteEqualTo(
      String note) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'note',
      value: [note],
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterWhereClause> noteNotEqualTo(
      String note) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'note',
        upper: [note],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'note',
        lower: [note],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'note',
        lower: [note],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'note',
        upper: [note],
        includeUpper: false,
      ));
    }
  }
}

extension DanceNoteQueryFilter
    on QueryBuilder<DanceNote, DanceNote, QFilterCondition> {
  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> categoryEqualTo(
      DanceCategory value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'category',
      value: _danceNoteDanceCategoryConverter.toIsar(value),
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> categoryGreaterThan(
    DanceCategory value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'category',
      value: _danceNoteDanceCategoryConverter.toIsar(value),
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> categoryLessThan(
    DanceCategory value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'category',
      value: _danceNoteDanceCategoryConverter.toIsar(value),
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> categoryBetween(
    DanceCategory lower,
    DanceCategory upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'category',
      lower: _danceNoteDanceCategoryConverter.toIsar(lower),
      includeLower: includeLower,
      upper: _danceNoteDanceCategoryConverter.toIsar(upper),
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'createdAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> editedAtEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'editedAt',
      value: value,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> editedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'editedAt',
      value: value,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> editedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'editedAt',
      value: value,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> editedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'editedAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> noteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'note',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> noteGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'note',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> noteLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'note',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> noteBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'note',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> noteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'note',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> noteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'note',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> noteContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'note',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> noteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'note',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picFourEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'picFour',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picFourGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'picFour',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picFourLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'picFour',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picFourBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'picFour',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picFourStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'picFour',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picFourEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'picFour',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picFourContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'picFour',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picFourMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'picFour',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picOneEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'picOne',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picOneGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'picOne',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picOneLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'picOne',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picOneBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'picOne',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picOneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'picOne',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picOneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'picOne',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picOneContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'picOne',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picOneMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'picOne',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picThreeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'picThree',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picThreeGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'picThree',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picThreeLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'picThree',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picThreeBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'picThree',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picThreeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'picThree',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picThreeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'picThree',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picThreeContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'picThree',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picThreeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'picThree',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picTwoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'picTwo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picTwoGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'picTwo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picTwoLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'picTwo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picTwoBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'picTwo',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picTwoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'picTwo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picTwoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'picTwo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picTwoContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'picTwo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<DanceNote, DanceNote, QAfterFilterCondition> picTwoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'picTwo',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension DanceNoteQueryLinks
    on QueryBuilder<DanceNote, DanceNote, QFilterCondition> {}

extension DanceNoteQueryWhereSortBy
    on QueryBuilder<DanceNote, DanceNote, QSortBy> {
  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> sortByCategory() {
    return addSortByInternal('category', Sort.asc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> sortByCategoryDesc() {
    return addSortByInternal('category', Sort.desc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> sortByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> sortByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> sortByEditedAt() {
    return addSortByInternal('editedAt', Sort.asc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> sortByEditedAtDesc() {
    return addSortByInternal('editedAt', Sort.desc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> sortByNote() {
    return addSortByInternal('note', Sort.asc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> sortByNoteDesc() {
    return addSortByInternal('note', Sort.desc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> sortByPicFour() {
    return addSortByInternal('picFour', Sort.asc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> sortByPicFourDesc() {
    return addSortByInternal('picFour', Sort.desc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> sortByPicOne() {
    return addSortByInternal('picOne', Sort.asc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> sortByPicOneDesc() {
    return addSortByInternal('picOne', Sort.desc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> sortByPicThree() {
    return addSortByInternal('picThree', Sort.asc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> sortByPicThreeDesc() {
    return addSortByInternal('picThree', Sort.desc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> sortByPicTwo() {
    return addSortByInternal('picTwo', Sort.asc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> sortByPicTwoDesc() {
    return addSortByInternal('picTwo', Sort.desc);
  }
}

extension DanceNoteQueryWhereSortThenBy
    on QueryBuilder<DanceNote, DanceNote, QSortThenBy> {
  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> thenByCategory() {
    return addSortByInternal('category', Sort.asc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> thenByCategoryDesc() {
    return addSortByInternal('category', Sort.desc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> thenByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> thenByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> thenByEditedAt() {
    return addSortByInternal('editedAt', Sort.asc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> thenByEditedAtDesc() {
    return addSortByInternal('editedAt', Sort.desc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> thenByNote() {
    return addSortByInternal('note', Sort.asc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> thenByNoteDesc() {
    return addSortByInternal('note', Sort.desc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> thenByPicFour() {
    return addSortByInternal('picFour', Sort.asc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> thenByPicFourDesc() {
    return addSortByInternal('picFour', Sort.desc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> thenByPicOne() {
    return addSortByInternal('picOne', Sort.asc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> thenByPicOneDesc() {
    return addSortByInternal('picOne', Sort.desc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> thenByPicThree() {
    return addSortByInternal('picThree', Sort.asc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> thenByPicThreeDesc() {
    return addSortByInternal('picThree', Sort.desc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> thenByPicTwo() {
    return addSortByInternal('picTwo', Sort.asc);
  }

  QueryBuilder<DanceNote, DanceNote, QAfterSortBy> thenByPicTwoDesc() {
    return addSortByInternal('picTwo', Sort.desc);
  }
}

extension DanceNoteQueryWhereDistinct
    on QueryBuilder<DanceNote, DanceNote, QDistinct> {
  QueryBuilder<DanceNote, DanceNote, QDistinct> distinctByCategory() {
    return addDistinctByInternal('category');
  }

  QueryBuilder<DanceNote, DanceNote, QDistinct> distinctByCreatedAt() {
    return addDistinctByInternal('createdAt');
  }

  QueryBuilder<DanceNote, DanceNote, QDistinct> distinctByEditedAt() {
    return addDistinctByInternal('editedAt');
  }

  QueryBuilder<DanceNote, DanceNote, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<DanceNote, DanceNote, QDistinct> distinctByNote(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('note', caseSensitive: caseSensitive);
  }

  QueryBuilder<DanceNote, DanceNote, QDistinct> distinctByPicFour(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('picFour', caseSensitive: caseSensitive);
  }

  QueryBuilder<DanceNote, DanceNote, QDistinct> distinctByPicOne(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('picOne', caseSensitive: caseSensitive);
  }

  QueryBuilder<DanceNote, DanceNote, QDistinct> distinctByPicThree(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('picThree', caseSensitive: caseSensitive);
  }

  QueryBuilder<DanceNote, DanceNote, QDistinct> distinctByPicTwo(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('picTwo', caseSensitive: caseSensitive);
  }
}

extension DanceNoteQueryProperty
    on QueryBuilder<DanceNote, DanceNote, QQueryProperty> {
  QueryBuilder<DanceNote, DanceCategory, QQueryOperations> categoryProperty() {
    return addPropertyNameInternal('category');
  }

  QueryBuilder<DanceNote, DateTime, QQueryOperations> createdAtProperty() {
    return addPropertyNameInternal('createdAt');
  }

  QueryBuilder<DanceNote, DateTime, QQueryOperations> editedAtProperty() {
    return addPropertyNameInternal('editedAt');
  }

  QueryBuilder<DanceNote, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<DanceNote, String, QQueryOperations> noteProperty() {
    return addPropertyNameInternal('note');
  }

  QueryBuilder<DanceNote, String, QQueryOperations> picFourProperty() {
    return addPropertyNameInternal('picFour');
  }

  QueryBuilder<DanceNote, String, QQueryOperations> picOneProperty() {
    return addPropertyNameInternal('picOne');
  }

  QueryBuilder<DanceNote, String, QQueryOperations> picThreeProperty() {
    return addPropertyNameInternal('picThree');
  }

  QueryBuilder<DanceNote, String, QQueryOperations> picTwoProperty() {
    return addPropertyNameInternal('picTwo');
  }
}
