// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respuesta_imagen_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRespuestaImagenModelCollection on Isar {
  IsarCollection<RespuestaImagenModel> get respuestaImagenModels =>
      this.collection();
}

const RespuestaImagenModelSchema = CollectionSchema(
  name: r'RespuestaImagenModel',
  id: -8906655521808916055,
  properties: {
    r'id': PropertySchema(
      id: 0,
      name: r'id',
      type: IsarType.long,
    ),
    r'idRespuestaCab': PropertySchema(
      id: 1,
      name: r'idRespuestaCab',
      type: IsarType.long,
    ),
    r'pathImagen': PropertySchema(
      id: 2,
      name: r'pathImagen',
      type: IsarType.string,
    )
  },
  estimateSize: _respuestaImagenModelEstimateSize,
  serialize: _respuestaImagenModelSerialize,
  deserialize: _respuestaImagenModelDeserialize,
  deserializeProp: _respuestaImagenModelDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _respuestaImagenModelGetId,
  getLinks: _respuestaImagenModelGetLinks,
  attach: _respuestaImagenModelAttach,
  version: '3.1.0+1',
);

int _respuestaImagenModelEstimateSize(
  RespuestaImagenModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.pathImagen.length * 3;
  return bytesCount;
}

void _respuestaImagenModelSerialize(
  RespuestaImagenModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id);
  writer.writeLong(offsets[1], object.idRespuestaCab);
  writer.writeString(offsets[2], object.pathImagen);
}

RespuestaImagenModel _respuestaImagenModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RespuestaImagenModel(
    id: reader.readLongOrNull(offsets[0]),
    idRespuestaCab: reader.readLongOrNull(offsets[1]),
    isarId: id,
    pathImagen: reader.readString(offsets[2]),
  );
  return object;
}

P _respuestaImagenModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _respuestaImagenModelGetId(RespuestaImagenModel object) {
  return object.isarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _respuestaImagenModelGetLinks(
    RespuestaImagenModel object) {
  return [];
}

void _respuestaImagenModelAttach(
    IsarCollection<dynamic> col, Id id, RespuestaImagenModel object) {
  object.isarId = id;
}

extension RespuestaImagenModelQueryWhereSort
    on QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QWhere> {
  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterWhere>
      anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RespuestaImagenModelQueryWhere
    on QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QWhereClause> {
  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterWhereClause>
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

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterWhereClause>
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

extension RespuestaImagenModelQueryFilter on QueryBuilder<RespuestaImagenModel,
    RespuestaImagenModel, QFilterCondition> {
  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> idRespuestaCabIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idRespuestaCab',
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> idRespuestaCabIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idRespuestaCab',
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> idRespuestaCabEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idRespuestaCab',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> idRespuestaCabGreaterThan(
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

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> idRespuestaCabLessThan(
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

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> idRespuestaCabBetween(
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

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> isarIdEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> isarIdGreaterThan(
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

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> isarIdLessThan(
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

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> isarIdBetween(
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

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> pathImagenEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathImagen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> pathImagenGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pathImagen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> pathImagenLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pathImagen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> pathImagenBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pathImagen',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> pathImagenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pathImagen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> pathImagenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pathImagen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
          QAfterFilterCondition>
      pathImagenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pathImagen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
          QAfterFilterCondition>
      pathImagenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pathImagen',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> pathImagenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathImagen',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel,
      QAfterFilterCondition> pathImagenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pathImagen',
        value: '',
      ));
    });
  }
}

extension RespuestaImagenModelQueryObject on QueryBuilder<RespuestaImagenModel,
    RespuestaImagenModel, QFilterCondition> {}

extension RespuestaImagenModelQueryLinks on QueryBuilder<RespuestaImagenModel,
    RespuestaImagenModel, QFilterCondition> {}

extension RespuestaImagenModelQuerySortBy
    on QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QSortBy> {
  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterSortBy>
      sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterSortBy>
      sortByIdRespuestaCab() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idRespuestaCab', Sort.asc);
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterSortBy>
      sortByIdRespuestaCabDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idRespuestaCab', Sort.desc);
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterSortBy>
      sortByPathImagen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathImagen', Sort.asc);
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterSortBy>
      sortByPathImagenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathImagen', Sort.desc);
    });
  }
}

extension RespuestaImagenModelQuerySortThenBy
    on QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QSortThenBy> {
  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterSortBy>
      thenByIdRespuestaCab() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idRespuestaCab', Sort.asc);
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterSortBy>
      thenByIdRespuestaCabDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idRespuestaCab', Sort.desc);
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterSortBy>
      thenByPathImagen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathImagen', Sort.asc);
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QAfterSortBy>
      thenByPathImagenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathImagen', Sort.desc);
    });
  }
}

extension RespuestaImagenModelQueryWhereDistinct
    on QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QDistinct> {
  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QDistinct>
      distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QDistinct>
      distinctByIdRespuestaCab() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idRespuestaCab');
    });
  }

  QueryBuilder<RespuestaImagenModel, RespuestaImagenModel, QDistinct>
      distinctByPathImagen({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pathImagen', caseSensitive: caseSensitive);
    });
  }
}

extension RespuestaImagenModelQueryProperty on QueryBuilder<
    RespuestaImagenModel, RespuestaImagenModel, QQueryProperty> {
  QueryBuilder<RespuestaImagenModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<RespuestaImagenModel, int?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RespuestaImagenModel, int?, QQueryOperations>
      idRespuestaCabProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idRespuestaCab');
    });
  }

  QueryBuilder<RespuestaImagenModel, String, QQueryOperations>
      pathImagenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pathImagen');
    });
  }
}
