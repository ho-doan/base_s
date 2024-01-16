// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_local.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEntryLocalCollection on Isar {
  IsarCollection<EntryLocal> get entryLocals => this.collection();
}

const EntryLocalSchema = CollectionSchema(
  name: r'EntryLocal',
  id: 5048643472629733703,
  properties: {
    r'aPI': PropertySchema(
      id: 0,
      name: r'aPI',
      type: IsarType.string,
    ),
    r'auth': PropertySchema(
      id: 1,
      name: r'auth',
      type: IsarType.string,
    ),
    r'category': PropertySchema(
      id: 2,
      name: r'category',
      type: IsarType.string,
    ),
    r'cors': PropertySchema(
      id: 3,
      name: r'cors',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 4,
      name: r'description',
      type: IsarType.string,
    ),
    r'hTTPS': PropertySchema(
      id: 5,
      name: r'hTTPS',
      type: IsarType.bool,
    ),
    r'link': PropertySchema(
      id: 6,
      name: r'link',
      type: IsarType.string,
    )
  },
  estimateSize: _entryLocalEstimateSize,
  serialize: _entryLocalSerialize,
  deserialize: _entryLocalDeserialize,
  deserializeProp: _entryLocalDeserializeProp,
  idName: r'key',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _entryLocalGetId,
  getLinks: _entryLocalGetLinks,
  attach: _entryLocalAttach,
  version: '3.1.0+1',
);

int _entryLocalEstimateSize(
  EntryLocal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.aPI;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.auth;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.category;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.cors;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.link;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _entryLocalSerialize(
  EntryLocal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.aPI);
  writer.writeString(offsets[1], object.auth);
  writer.writeString(offsets[2], object.category);
  writer.writeString(offsets[3], object.cors);
  writer.writeString(offsets[4], object.description);
  writer.writeBool(offsets[5], object.hTTPS);
  writer.writeString(offsets[6], object.link);
}

EntryLocal _entryLocalDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = EntryLocal(
    aPI: reader.readStringOrNull(offsets[0]),
    auth: reader.readStringOrNull(offsets[1]),
    category: reader.readStringOrNull(offsets[2]),
    cors: reader.readStringOrNull(offsets[3]),
    description: reader.readStringOrNull(offsets[4]),
    hTTPS: reader.readBoolOrNull(offsets[5]),
    key: id,
    link: reader.readStringOrNull(offsets[6]),
  );
  return object;
}

P _entryLocalDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _entryLocalGetId(EntryLocal object) {
  return object.key ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _entryLocalGetLinks(EntryLocal object) {
  return [];
}

void _entryLocalAttach(IsarCollection<dynamic> col, Id id, EntryLocal object) {}

extension EntryLocalQueryWhereSort
    on QueryBuilder<EntryLocal, EntryLocal, QWhere> {
  QueryBuilder<EntryLocal, EntryLocal, QAfterWhere> anyKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EntryLocalQueryWhere
    on QueryBuilder<EntryLocal, EntryLocal, QWhereClause> {
  QueryBuilder<EntryLocal, EntryLocal, QAfterWhereClause> keyEqualTo(Id key) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: key,
        upper: key,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterWhereClause> keyNotEqualTo(
      Id key) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: key, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: key, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: key, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: key, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterWhereClause> keyGreaterThan(Id key,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: key, includeLower: include),
      );
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterWhereClause> keyLessThan(Id key,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: key, includeUpper: include),
      );
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterWhereClause> keyBetween(
    Id lowerKey,
    Id upperKey, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerKey,
        includeLower: includeLower,
        upper: upperKey,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EntryLocalQueryFilter
    on QueryBuilder<EntryLocal, EntryLocal, QFilterCondition> {
  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> aPIIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'aPI',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> aPIIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'aPI',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> aPIEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aPI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> aPIGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aPI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> aPILessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aPI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> aPIBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aPI',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> aPIStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aPI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> aPIEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aPI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> aPIContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aPI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> aPIMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aPI',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> aPIIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aPI',
        value: '',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> aPIIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aPI',
        value: '',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> authIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'auth',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> authIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'auth',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> authEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> authGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'auth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> authLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'auth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> authBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'auth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> authStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'auth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> authEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'auth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> authContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'auth',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> authMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'auth',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> authIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'auth',
        value: '',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> authIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'auth',
        value: '',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> categoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition>
      categoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'category',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> categoryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition>
      categoryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> categoryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> categoryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> categoryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> categoryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> corsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cors',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> corsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cors',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> corsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> corsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> corsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> corsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cors',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> corsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> corsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> corsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> corsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cors',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> corsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cors',
        value: '',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> corsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cors',
        value: '',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> hTTPSIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hTTPS',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> hTTPSIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hTTPS',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> hTTPSEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hTTPS',
        value: value,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> keyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'key',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> keyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'key',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> keyEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'key',
        value: value,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> keyGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'key',
        value: value,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> keyLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'key',
        value: value,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> keyBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'key',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> linkIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'link',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> linkIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'link',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> linkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> linkGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> linkLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> linkBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'link',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> linkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> linkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> linkContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'link',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> linkMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'link',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> linkIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'link',
        value: '',
      ));
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterFilterCondition> linkIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'link',
        value: '',
      ));
    });
  }
}

extension EntryLocalQueryObject
    on QueryBuilder<EntryLocal, EntryLocal, QFilterCondition> {}

extension EntryLocalQueryLinks
    on QueryBuilder<EntryLocal, EntryLocal, QFilterCondition> {}

extension EntryLocalQuerySortBy
    on QueryBuilder<EntryLocal, EntryLocal, QSortBy> {
  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> sortByAPI() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aPI', Sort.asc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> sortByAPIDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aPI', Sort.desc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> sortByAuth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auth', Sort.asc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> sortByAuthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auth', Sort.desc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> sortByCors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cors', Sort.asc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> sortByCorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cors', Sort.desc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> sortByHTTPS() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hTTPS', Sort.asc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> sortByHTTPSDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hTTPS', Sort.desc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> sortByLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.asc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> sortByLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.desc);
    });
  }
}

extension EntryLocalQuerySortThenBy
    on QueryBuilder<EntryLocal, EntryLocal, QSortThenBy> {
  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> thenByAPI() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aPI', Sort.asc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> thenByAPIDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aPI', Sort.desc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> thenByAuth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auth', Sort.asc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> thenByAuthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'auth', Sort.desc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> thenByCors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cors', Sort.asc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> thenByCorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cors', Sort.desc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> thenByHTTPS() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hTTPS', Sort.asc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> thenByHTTPSDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hTTPS', Sort.desc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> thenByKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.asc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> thenByKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'key', Sort.desc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> thenByLink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.asc);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QAfterSortBy> thenByLinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'link', Sort.desc);
    });
  }
}

extension EntryLocalQueryWhereDistinct
    on QueryBuilder<EntryLocal, EntryLocal, QDistinct> {
  QueryBuilder<EntryLocal, EntryLocal, QDistinct> distinctByAPI(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aPI', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QDistinct> distinctByAuth(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'auth', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QDistinct> distinctByCors(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cors', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QDistinct> distinctByHTTPS() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hTTPS');
    });
  }

  QueryBuilder<EntryLocal, EntryLocal, QDistinct> distinctByLink(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'link', caseSensitive: caseSensitive);
    });
  }
}

extension EntryLocalQueryProperty
    on QueryBuilder<EntryLocal, EntryLocal, QQueryProperty> {
  QueryBuilder<EntryLocal, int, QQueryOperations> keyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'key');
    });
  }

  QueryBuilder<EntryLocal, String?, QQueryOperations> aPIProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aPI');
    });
  }

  QueryBuilder<EntryLocal, String?, QQueryOperations> authProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'auth');
    });
  }

  QueryBuilder<EntryLocal, String?, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<EntryLocal, String?, QQueryOperations> corsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cors');
    });
  }

  QueryBuilder<EntryLocal, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<EntryLocal, bool?, QQueryOperations> hTTPSProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hTTPS');
    });
  }

  QueryBuilder<EntryLocal, String?, QQueryOperations> linkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'link');
    });
  }
}
