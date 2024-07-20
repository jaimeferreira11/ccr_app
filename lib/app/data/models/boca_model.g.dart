// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boca_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBocaModelCollection on Isar {
  IsarCollection<BocaModel> get bocaModels => this.collection();
}

const BocaModelSchema = CollectionSchema(
  name: r'BocaModel',
  id: -5158047993817123845,
  properties: {
    r'activo': PropertySchema(
      id: 0,
      name: r'activo',
      type: IsarType.bool,
    ),
    r'ciudad': PropertySchema(
      id: 1,
      name: r'ciudad',
      type: IsarType.string,
    ),
    r'codBoca': PropertySchema(
      id: 2,
      name: r'codBoca',
      type: IsarType.string,
    ),
    r'direccion': PropertySchema(
      id: 3,
      name: r'direccion',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 4,
      name: r'id',
      type: IsarType.long,
    ),
    r'nombre': PropertySchema(
      id: 5,
      name: r'nombre',
      type: IsarType.string,
    ),
    r'tipoBoca': PropertySchema(
      id: 6,
      name: r'tipoBoca',
      type: IsarType.string,
    )
  },
  estimateSize: _bocaModelEstimateSize,
  serialize: _bocaModelSerialize,
  deserialize: _bocaModelDeserialize,
  deserializeProp: _bocaModelDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'codBoca': IndexSchema(
      id: 2353962782252146866,
      name: r'codBoca',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'codBoca',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bocaModelGetId,
  getLinks: _bocaModelGetLinks,
  attach: _bocaModelAttach,
  version: '3.1.0+1',
);

int _bocaModelEstimateSize(
  BocaModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.ciudad.length * 3;
  bytesCount += 3 + object.codBoca.length * 3;
  {
    final value = object.direccion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.nombre.length * 3;
  bytesCount += 3 + object.tipoBoca.length * 3;
  return bytesCount;
}

void _bocaModelSerialize(
  BocaModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.activo);
  writer.writeString(offsets[1], object.ciudad);
  writer.writeString(offsets[2], object.codBoca);
  writer.writeString(offsets[3], object.direccion);
  writer.writeLong(offsets[4], object.id);
  writer.writeString(offsets[5], object.nombre);
  writer.writeString(offsets[6], object.tipoBoca);
}

BocaModel _bocaModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BocaModel(
    activo: reader.readBool(offsets[0]),
    ciudad: reader.readString(offsets[1]),
    codBoca: reader.readString(offsets[2]),
    direccion: reader.readStringOrNull(offsets[3]),
    id: reader.readLong(offsets[4]),
    nombre: reader.readString(offsets[5]),
    tipoBoca: reader.readString(offsets[6]),
  );
  object.isarId = id;
  return object;
}

P _bocaModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bocaModelGetId(BocaModel object) {
  return object.isarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _bocaModelGetLinks(BocaModel object) {
  return [];
}

void _bocaModelAttach(IsarCollection<dynamic> col, Id id, BocaModel object) {
  object.isarId = id;
}

extension BocaModelQueryWhereSort
    on QueryBuilder<BocaModel, BocaModel, QWhere> {
  QueryBuilder<BocaModel, BocaModel, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterWhere> anyCodBoca() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'codBoca'),
      );
    });
  }
}

extension BocaModelQueryWhere
    on QueryBuilder<BocaModel, BocaModel, QWhereClause> {
  QueryBuilder<BocaModel, BocaModel, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterWhereClause> codBocaEqualTo(
      String codBoca) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'codBoca',
        value: [codBoca],
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterWhereClause> codBocaNotEqualTo(
      String codBoca) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'codBoca',
              lower: [],
              upper: [codBoca],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'codBoca',
              lower: [codBoca],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'codBoca',
              lower: [codBoca],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'codBoca',
              lower: [],
              upper: [codBoca],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterWhereClause> codBocaGreaterThan(
    String codBoca, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'codBoca',
        lower: [codBoca],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterWhereClause> codBocaLessThan(
    String codBoca, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'codBoca',
        lower: [],
        upper: [codBoca],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterWhereClause> codBocaBetween(
    String lowerCodBoca,
    String upperCodBoca, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'codBoca',
        lower: [lowerCodBoca],
        includeLower: includeLower,
        upper: [upperCodBoca],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterWhereClause> codBocaStartsWith(
      String CodBocaPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'codBoca',
        lower: [CodBocaPrefix],
        upper: ['$CodBocaPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterWhereClause> codBocaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'codBoca',
        value: [''],
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterWhereClause> codBocaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'codBoca',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'codBoca',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'codBoca',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'codBoca',
              upper: [''],
            ));
      }
    });
  }
}

extension BocaModelQueryFilter
    on QueryBuilder<BocaModel, BocaModel, QFilterCondition> {
  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> activoEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'activo',
        value: value,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> ciudadEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ciudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> ciudadGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ciudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> ciudadLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ciudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> ciudadBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ciudad',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> ciudadStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ciudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> ciudadEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ciudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> ciudadContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ciudad',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> ciudadMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ciudad',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> ciudadIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ciudad',
        value: '',
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> ciudadIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ciudad',
        value: '',
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> codBocaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> codBocaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'codBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> codBocaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'codBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> codBocaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'codBoca',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> codBocaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'codBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> codBocaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'codBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> codBocaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> codBocaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codBoca',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> codBocaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codBoca',
        value: '',
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition>
      codBocaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codBoca',
        value: '',
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> direccionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'direccion',
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition>
      direccionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'direccion',
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> direccionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition>
      direccionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> direccionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> direccionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'direccion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> direccionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> direccionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> direccionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'direccion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> direccionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'direccion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> direccionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'direccion',
        value: '',
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition>
      direccionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'direccion',
        value: '',
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> idEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> isarIdEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> isarIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> isarIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> isarIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> nombreEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> nombreGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> nombreLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> nombreBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> nombreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> nombreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> nombreContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> nombreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> nombreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> nombreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombre',
        value: '',
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> tipoBocaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> tipoBocaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipoBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> tipoBocaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipoBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> tipoBocaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipoBoca',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> tipoBocaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipoBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> tipoBocaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipoBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> tipoBocaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipoBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> tipoBocaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipoBoca',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition> tipoBocaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoBoca',
        value: '',
      ));
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterFilterCondition>
      tipoBocaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipoBoca',
        value: '',
      ));
    });
  }
}

extension BocaModelQueryObject
    on QueryBuilder<BocaModel, BocaModel, QFilterCondition> {}

extension BocaModelQueryLinks
    on QueryBuilder<BocaModel, BocaModel, QFilterCondition> {}

extension BocaModelQuerySortBy on QueryBuilder<BocaModel, BocaModel, QSortBy> {
  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> sortByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.asc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> sortByActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.desc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> sortByCiudad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ciudad', Sort.asc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> sortByCiudadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ciudad', Sort.desc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> sortByCodBoca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codBoca', Sort.asc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> sortByCodBocaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codBoca', Sort.desc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> sortByDireccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccion', Sort.asc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> sortByDireccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccion', Sort.desc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> sortByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> sortByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> sortByTipoBoca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoBoca', Sort.asc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> sortByTipoBocaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoBoca', Sort.desc);
    });
  }
}

extension BocaModelQuerySortThenBy
    on QueryBuilder<BocaModel, BocaModel, QSortThenBy> {
  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> thenByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.asc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> thenByActivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activo', Sort.desc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> thenByCiudad() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ciudad', Sort.asc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> thenByCiudadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ciudad', Sort.desc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> thenByCodBoca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codBoca', Sort.asc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> thenByCodBocaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codBoca', Sort.desc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> thenByDireccion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccion', Sort.asc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> thenByDireccionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'direccion', Sort.desc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> thenByNombre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.asc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> thenByNombreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombre', Sort.desc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> thenByTipoBoca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoBoca', Sort.asc);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QAfterSortBy> thenByTipoBocaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoBoca', Sort.desc);
    });
  }
}

extension BocaModelQueryWhereDistinct
    on QueryBuilder<BocaModel, BocaModel, QDistinct> {
  QueryBuilder<BocaModel, BocaModel, QDistinct> distinctByActivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activo');
    });
  }

  QueryBuilder<BocaModel, BocaModel, QDistinct> distinctByCiudad(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ciudad', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QDistinct> distinctByCodBoca(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codBoca', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QDistinct> distinctByDireccion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'direccion', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QDistinct> distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<BocaModel, BocaModel, QDistinct> distinctByNombre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BocaModel, BocaModel, QDistinct> distinctByTipoBoca(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipoBoca', caseSensitive: caseSensitive);
    });
  }
}

extension BocaModelQueryProperty
    on QueryBuilder<BocaModel, BocaModel, QQueryProperty> {
  QueryBuilder<BocaModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<BocaModel, bool, QQueryOperations> activoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activo');
    });
  }

  QueryBuilder<BocaModel, String, QQueryOperations> ciudadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ciudad');
    });
  }

  QueryBuilder<BocaModel, String, QQueryOperations> codBocaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codBoca');
    });
  }

  QueryBuilder<BocaModel, String?, QQueryOperations> direccionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'direccion');
    });
  }

  QueryBuilder<BocaModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BocaModel, String, QQueryOperations> nombreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombre');
    });
  }

  QueryBuilder<BocaModel, String, QQueryOperations> tipoBocaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipoBoca');
    });
  }
}
