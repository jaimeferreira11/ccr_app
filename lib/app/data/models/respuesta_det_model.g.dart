// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respuesta_det_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRespuestaDetModelCollection on Isar {
  IsarCollection<RespuestaDetModel> get respuestaDetModels => this.collection();
}

const RespuestaDetModelSchema = CollectionSchema(
  name: r'RespuestaDetModel',
  id: 4024121457784228079,
  properties: {
    r'cabecera': PropertySchema(
      id: 0,
      name: r'cabecera',
      type: IsarType.string,
    ),
    r'comentario': PropertySchema(
      id: 1,
      name: r'comentario',
      type: IsarType.string,
    ),
    r'descItem': PropertySchema(
      id: 2,
      name: r'descItem',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 3,
      name: r'id',
      type: IsarType.long,
    ),
    r'idItem': PropertySchema(
      id: 4,
      name: r'idItem',
      type: IsarType.long,
    ),
    r'idRespuestaCab': PropertySchema(
      id: 5,
      name: r'idRespuestaCab',
      type: IsarType.long,
    ),
    r'precio': PropertySchema(
      id: 6,
      name: r'precio',
      type: IsarType.long,
    ),
    r'valor': PropertySchema(
      id: 7,
      name: r'valor',
      type: IsarType.string,
    )
  },
  estimateSize: _respuestaDetModelEstimateSize,
  serialize: _respuestaDetModelSerialize,
  deserialize: _respuestaDetModelDeserialize,
  deserializeProp: _respuestaDetModelDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _respuestaDetModelGetId,
  getLinks: _respuestaDetModelGetLinks,
  attach: _respuestaDetModelAttach,
  version: '3.1.0+1',
);

int _respuestaDetModelEstimateSize(
  RespuestaDetModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cabecera.length * 3;
  {
    final value = object.comentario;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.descItem.length * 3;
  bytesCount += 3 + object.valor.length * 3;
  return bytesCount;
}

void _respuestaDetModelSerialize(
  RespuestaDetModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cabecera);
  writer.writeString(offsets[1], object.comentario);
  writer.writeString(offsets[2], object.descItem);
  writer.writeLong(offsets[3], object.id);
  writer.writeLong(offsets[4], object.idItem);
  writer.writeLong(offsets[5], object.idRespuestaCab);
  writer.writeLong(offsets[6], object.precio);
  writer.writeString(offsets[7], object.valor);
}

RespuestaDetModel _respuestaDetModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RespuestaDetModel(
    cabecera: reader.readString(offsets[0]),
    comentario: reader.readStringOrNull(offsets[1]),
    descItem: reader.readString(offsets[2]),
    id: reader.readLongOrNull(offsets[3]),
    idItem: reader.readLong(offsets[4]),
    idRespuestaCab: reader.readLongOrNull(offsets[5]),
    precio: reader.readLongOrNull(offsets[6]),
    valor: reader.readString(offsets[7]),
  );
  object.isarId = id;
  return object;
}

P _respuestaDetModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _respuestaDetModelGetId(RespuestaDetModel object) {
  return object.isarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _respuestaDetModelGetLinks(
    RespuestaDetModel object) {
  return [];
}

void _respuestaDetModelAttach(
    IsarCollection<dynamic> col, Id id, RespuestaDetModel object) {
  object.isarId = id;
}

extension RespuestaDetModelQueryWhereSort
    on QueryBuilder<RespuestaDetModel, RespuestaDetModel, QWhere> {
  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RespuestaDetModelQueryWhere
    on QueryBuilder<RespuestaDetModel, RespuestaDetModel, QWhereClause> {
  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
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

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterWhereClause>
      isarIdBetween(
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
}

extension RespuestaDetModelQueryFilter
    on QueryBuilder<RespuestaDetModel, RespuestaDetModel, QFilterCondition> {
  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      cabeceraEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cabecera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      cabeceraGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cabecera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      cabeceraLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cabecera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      cabeceraBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cabecera',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      cabeceraStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cabecera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      cabeceraEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cabecera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      cabeceraContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cabecera',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      cabeceraMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cabecera',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      cabeceraIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cabecera',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      cabeceraIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cabecera',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      comentarioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comentario',
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      comentarioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comentario',
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      comentarioEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comentario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      comentarioGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comentario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      comentarioLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comentario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      comentarioBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comentario',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      comentarioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'comentario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      comentarioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'comentario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      comentarioContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comentario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      comentarioMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comentario',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      comentarioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comentario',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      comentarioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comentario',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      descItemEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      descItemGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      descItemLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      descItemBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      descItemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      descItemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      descItemContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descItem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      descItemMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descItem',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      descItemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descItem',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      descItemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descItem',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      idGreaterThan(
    int? value, {
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

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      idLessThan(
    int? value, {
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

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      idBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      idItemEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idItem',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      idItemGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idItem',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      idItemLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idItem',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      idItemBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idItem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      idRespuestaCabIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idRespuestaCab',
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      idRespuestaCabIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idRespuestaCab',
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      idRespuestaCabEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idRespuestaCab',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      idRespuestaCabGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idRespuestaCab',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      idRespuestaCabLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idRespuestaCab',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      idRespuestaCabBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idRespuestaCab',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      isarIdEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      isarIdGreaterThan(
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

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      isarIdLessThan(
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

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      isarIdBetween(
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

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      precioIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precio',
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      precioIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precio',
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      precioEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precio',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      precioGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precio',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      precioLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precio',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      precioBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      valorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      valorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      valorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      valorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      valorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'valor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      valorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'valor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      valorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'valor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      valorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'valor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      valorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valor',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterFilterCondition>
      valorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'valor',
        value: '',
      ));
    });
  }
}

extension RespuestaDetModelQueryObject
    on QueryBuilder<RespuestaDetModel, RespuestaDetModel, QFilterCondition> {}

extension RespuestaDetModelQueryLinks
    on QueryBuilder<RespuestaDetModel, RespuestaDetModel, QFilterCondition> {}

extension RespuestaDetModelQuerySortBy
    on QueryBuilder<RespuestaDetModel, RespuestaDetModel, QSortBy> {
  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      sortByCabecera() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cabecera', Sort.asc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      sortByCabeceraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cabecera', Sort.desc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      sortByComentario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comentario', Sort.asc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      sortByComentarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comentario', Sort.desc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      sortByDescItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descItem', Sort.asc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      sortByDescItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descItem', Sort.desc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      sortByIdItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idItem', Sort.asc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      sortByIdItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idItem', Sort.desc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      sortByIdRespuestaCab() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idRespuestaCab', Sort.asc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      sortByIdRespuestaCabDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idRespuestaCab', Sort.desc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      sortByPrecio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precio', Sort.asc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      sortByPrecioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precio', Sort.desc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      sortByValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor', Sort.asc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      sortByValorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor', Sort.desc);
    });
  }
}

extension RespuestaDetModelQuerySortThenBy
    on QueryBuilder<RespuestaDetModel, RespuestaDetModel, QSortThenBy> {
  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      thenByCabecera() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cabecera', Sort.asc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      thenByCabeceraDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cabecera', Sort.desc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      thenByComentario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comentario', Sort.asc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      thenByComentarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comentario', Sort.desc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      thenByDescItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descItem', Sort.asc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      thenByDescItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descItem', Sort.desc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      thenByIdItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idItem', Sort.asc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      thenByIdItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idItem', Sort.desc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      thenByIdRespuestaCab() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idRespuestaCab', Sort.asc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      thenByIdRespuestaCabDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idRespuestaCab', Sort.desc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      thenByPrecio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precio', Sort.asc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      thenByPrecioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'precio', Sort.desc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      thenByValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor', Sort.asc);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QAfterSortBy>
      thenByValorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor', Sort.desc);
    });
  }
}

extension RespuestaDetModelQueryWhereDistinct
    on QueryBuilder<RespuestaDetModel, RespuestaDetModel, QDistinct> {
  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QDistinct>
      distinctByCabecera({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cabecera', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QDistinct>
      distinctByComentario({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comentario', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QDistinct>
      distinctByDescItem({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descItem', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QDistinct> distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QDistinct>
      distinctByIdItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idItem');
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QDistinct>
      distinctByIdRespuestaCab() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idRespuestaCab');
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QDistinct>
      distinctByPrecio() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'precio');
    });
  }

  QueryBuilder<RespuestaDetModel, RespuestaDetModel, QDistinct> distinctByValor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valor', caseSensitive: caseSensitive);
    });
  }
}

extension RespuestaDetModelQueryProperty
    on QueryBuilder<RespuestaDetModel, RespuestaDetModel, QQueryProperty> {
  QueryBuilder<RespuestaDetModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<RespuestaDetModel, String, QQueryOperations> cabeceraProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cabecera');
    });
  }

  QueryBuilder<RespuestaDetModel, String?, QQueryOperations>
      comentarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comentario');
    });
  }

  QueryBuilder<RespuestaDetModel, String, QQueryOperations> descItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descItem');
    });
  }

  QueryBuilder<RespuestaDetModel, int?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RespuestaDetModel, int, QQueryOperations> idItemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idItem');
    });
  }

  QueryBuilder<RespuestaDetModel, int?, QQueryOperations>
      idRespuestaCabProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idRespuestaCab');
    });
  }

  QueryBuilder<RespuestaDetModel, int?, QQueryOperations> precioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'precio');
    });
  }

  QueryBuilder<RespuestaDetModel, String, QQueryOperations> valorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valor');
    });
  }
}
