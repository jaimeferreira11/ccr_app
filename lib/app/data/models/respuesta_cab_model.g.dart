// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respuesta_cab_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRespuestaCabModelCollection on Isar {
  IsarCollection<RespuestaCabModel> get respuestaCabModels => this.collection();
}

const RespuestaCabModelSchema = CollectionSchema(
  name: r'RespuestaCabModel',
  id: -6541161034756975013,
  properties: {
    r'codBoca': PropertySchema(
      id: 0,
      name: r'codBoca',
      type: IsarType.string,
    ),
    r'descBoca': PropertySchema(
      id: 1,
      name: r'descBoca',
      type: IsarType.string,
    ),
    r'fechaCreacion': PropertySchema(
      id: 2,
      name: r'fechaCreacion',
      type: IsarType.string,
    ),
    r'fechaSincronizacion': PropertySchema(
      id: 3,
      name: r'fechaSincronizacion',
      type: IsarType.string,
    ),
    r'horaFin': PropertySchema(
      id: 4,
      name: r'horaFin',
      type: IsarType.string,
    ),
    r'horaInicio': PropertySchema(
      id: 5,
      name: r'horaInicio',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 6,
      name: r'id',
      type: IsarType.long,
    ),
    r'idBoca': PropertySchema(
      id: 7,
      name: r'idBoca',
      type: IsarType.long,
    ),
    r'latitud': PropertySchema(
      id: 8,
      name: r'latitud',
      type: IsarType.string,
    ),
    r'longitud': PropertySchema(
      id: 9,
      name: r'longitud',
      type: IsarType.string,
    ),
    r'pathImagen': PropertySchema(
      id: 10,
      name: r'pathImagen',
      type: IsarType.string,
    ),
    r'sincronizado': PropertySchema(
      id: 11,
      name: r'sincronizado',
      type: IsarType.bool,
    ),
    r'usuario': PropertySchema(
      id: 12,
      name: r'usuario',
      type: IsarType.string,
    )
  },
  estimateSize: _respuestaCabModelEstimateSize,
  serialize: _respuestaCabModelSerialize,
  deserialize: _respuestaCabModelDeserialize,
  deserializeProp: _respuestaCabModelDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _respuestaCabModelGetId,
  getLinks: _respuestaCabModelGetLinks,
  attach: _respuestaCabModelAttach,
  version: '3.1.0+1',
);

int _respuestaCabModelEstimateSize(
  RespuestaCabModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.codBoca.length * 3;
  bytesCount += 3 + object.descBoca.length * 3;
  bytesCount += 3 + object.fechaCreacion.length * 3;
  {
    final value = object.fechaSincronizacion;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.horaFin.length * 3;
  bytesCount += 3 + object.horaInicio.length * 3;
  bytesCount += 3 + object.latitud.length * 3;
  bytesCount += 3 + object.longitud.length * 3;
  bytesCount += 3 + object.pathImagen.length * 3;
  bytesCount += 3 + object.usuario.length * 3;
  return bytesCount;
}

void _respuestaCabModelSerialize(
  RespuestaCabModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.codBoca);
  writer.writeString(offsets[1], object.descBoca);
  writer.writeString(offsets[2], object.fechaCreacion);
  writer.writeString(offsets[3], object.fechaSincronizacion);
  writer.writeString(offsets[4], object.horaFin);
  writer.writeString(offsets[5], object.horaInicio);
  writer.writeLong(offsets[6], object.id);
  writer.writeLong(offsets[7], object.idBoca);
  writer.writeString(offsets[8], object.latitud);
  writer.writeString(offsets[9], object.longitud);
  writer.writeString(offsets[10], object.pathImagen);
  writer.writeBool(offsets[11], object.sincronizado);
  writer.writeString(offsets[12], object.usuario);
}

RespuestaCabModel _respuestaCabModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RespuestaCabModel(
    codBoca: reader.readString(offsets[0]),
    descBoca: reader.readString(offsets[1]),
    fechaCreacion: reader.readString(offsets[2]),
    fechaSincronizacion: reader.readStringOrNull(offsets[3]),
    horaFin: reader.readString(offsets[4]),
    horaInicio: reader.readString(offsets[5]),
    id: reader.readLongOrNull(offsets[6]),
    idBoca: reader.readLong(offsets[7]),
    isarId: id,
    latitud: reader.readString(offsets[8]),
    longitud: reader.readString(offsets[9]),
    pathImagen: reader.readString(offsets[10]),
    sincronizado: reader.readBoolOrNull(offsets[11]) ?? false,
    usuario: reader.readString(offsets[12]),
  );
  return object;
}

P _respuestaCabModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 12:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _respuestaCabModelGetId(RespuestaCabModel object) {
  return object.isarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _respuestaCabModelGetLinks(
    RespuestaCabModel object) {
  return [];
}

void _respuestaCabModelAttach(
    IsarCollection<dynamic> col, Id id, RespuestaCabModel object) {
  object.isarId = id;
}

extension RespuestaCabModelQueryWhereSort
    on QueryBuilder<RespuestaCabModel, RespuestaCabModel, QWhere> {
  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RespuestaCabModelQueryWhere
    on QueryBuilder<RespuestaCabModel, RespuestaCabModel, QWhereClause> {
  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterWhereClause>
      isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterWhereClause>
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterWhereClause>
      isarIdLessThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterWhereClause>
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

extension RespuestaCabModelQueryFilter
    on QueryBuilder<RespuestaCabModel, RespuestaCabModel, QFilterCondition> {
  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      codBocaEqualTo(
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      codBocaGreaterThan(
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      codBocaLessThan(
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      codBocaBetween(
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      codBocaStartsWith(
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      codBocaEndsWith(
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      codBocaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'codBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      codBocaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'codBoca',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      codBocaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'codBoca',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      codBocaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'codBoca',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      descBocaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      descBocaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'descBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      descBocaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'descBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      descBocaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'descBoca',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      descBocaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'descBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      descBocaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'descBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      descBocaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'descBoca',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      descBocaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'descBoca',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      descBocaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'descBoca',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      descBocaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'descBoca',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaCreacionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaCreacionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaCreacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaCreacionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaCreacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaCreacionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaCreacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaCreacionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fechaCreacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaCreacionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fechaCreacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaCreacionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fechaCreacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaCreacionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fechaCreacion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaCreacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCreacion',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaCreacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fechaCreacion',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaSincronizacionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaSincronizacion',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaSincronizacionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaSincronizacion',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaSincronizacionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaSincronizacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaSincronizacionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaSincronizacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaSincronizacionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaSincronizacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaSincronizacionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaSincronizacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaSincronizacionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fechaSincronizacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaSincronizacionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fechaSincronizacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaSincronizacionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fechaSincronizacion',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaSincronizacionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fechaSincronizacion',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaSincronizacionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaSincronizacion',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      fechaSincronizacionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fechaSincronizacion',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaFinEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horaFin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaFinGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horaFin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaFinLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horaFin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaFinBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horaFin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaFinStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'horaFin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaFinEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'horaFin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaFinContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'horaFin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaFinMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'horaFin',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaFinIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horaFin',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaFinIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'horaFin',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaInicioEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horaInicio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaInicioGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'horaInicio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaInicioLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'horaInicio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaInicioBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'horaInicio',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaInicioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'horaInicio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaInicioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'horaInicio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaInicioContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'horaInicio',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaInicioMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'horaInicio',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaInicioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'horaInicio',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      horaInicioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'horaInicio',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      idEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      idBocaEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBoca',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      idBocaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idBoca',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      idBocaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idBoca',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      idBocaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idBoca',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      isarIdEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      latitudEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      latitudGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      latitudLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      latitudBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitud',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      latitudStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'latitud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      latitudEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'latitud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      latitudContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'latitud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      latitudMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'latitud',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      latitudIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitud',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      latitudIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'latitud',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      longitudEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      longitudGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      longitudLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      longitudBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitud',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      longitudStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'longitud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      longitudEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'longitud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      longitudContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'longitud',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      longitudMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'longitud',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      longitudIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitud',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      longitudIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'longitud',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      pathImagenEqualTo(
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      pathImagenGreaterThan(
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      pathImagenLessThan(
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      pathImagenBetween(
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      pathImagenStartsWith(
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      pathImagenEndsWith(
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

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      pathImagenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pathImagen',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      pathImagenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pathImagen',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      pathImagenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pathImagen',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      pathImagenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pathImagen',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      sincronizadoEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sincronizado',
        value: value,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      usuarioEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      usuarioGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usuario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      usuarioLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usuario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      usuarioBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usuario',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      usuarioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'usuario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      usuarioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'usuario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      usuarioContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'usuario',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      usuarioMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'usuario',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      usuarioIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usuario',
        value: '',
      ));
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterFilterCondition>
      usuarioIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'usuario',
        value: '',
      ));
    });
  }
}

extension RespuestaCabModelQueryObject
    on QueryBuilder<RespuestaCabModel, RespuestaCabModel, QFilterCondition> {}

extension RespuestaCabModelQueryLinks
    on QueryBuilder<RespuestaCabModel, RespuestaCabModel, QFilterCondition> {}

extension RespuestaCabModelQuerySortBy
    on QueryBuilder<RespuestaCabModel, RespuestaCabModel, QSortBy> {
  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByCodBoca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codBoca', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByCodBocaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codBoca', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByDescBoca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descBoca', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByDescBocaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descBoca', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByFechaSincronizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaSincronizacion', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByFechaSincronizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaSincronizacion', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByHoraFin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaFin', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByHoraFinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaFin', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByHoraInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaInicio', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByHoraInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaInicio', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByIdBoca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBoca', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByIdBocaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBoca', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByLatitud() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitud', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByLatitudDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitud', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByLongitud() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitud', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByLongitudDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitud', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByPathImagen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathImagen', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByPathImagenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathImagen', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortBySincronizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sincronizado', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortBySincronizadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sincronizado', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByUsuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuario', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      sortByUsuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuario', Sort.desc);
    });
  }
}

extension RespuestaCabModelQuerySortThenBy
    on QueryBuilder<RespuestaCabModel, RespuestaCabModel, QSortThenBy> {
  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByCodBoca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codBoca', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByCodBocaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'codBoca', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByDescBoca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descBoca', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByDescBocaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descBoca', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByFechaCreacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByFechaCreacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCreacion', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByFechaSincronizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaSincronizacion', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByFechaSincronizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaSincronizacion', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByHoraFin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaFin', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByHoraFinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaFin', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByHoraInicio() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaInicio', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByHoraInicioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'horaInicio', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByIdBoca() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBoca', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByIdBocaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBoca', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByLatitud() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitud', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByLatitudDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitud', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByLongitud() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitud', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByLongitudDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitud', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByPathImagen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathImagen', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByPathImagenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pathImagen', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenBySincronizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sincronizado', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenBySincronizadoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sincronizado', Sort.desc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByUsuario() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuario', Sort.asc);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QAfterSortBy>
      thenByUsuarioDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usuario', Sort.desc);
    });
  }
}

extension RespuestaCabModelQueryWhereDistinct
    on QueryBuilder<RespuestaCabModel, RespuestaCabModel, QDistinct> {
  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QDistinct>
      distinctByCodBoca({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'codBoca', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QDistinct>
      distinctByDescBoca({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'descBoca', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QDistinct>
      distinctByFechaCreacion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCreacion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QDistinct>
      distinctByFechaSincronizacion({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaSincronizacion',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QDistinct>
      distinctByHoraFin({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horaFin', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QDistinct>
      distinctByHoraInicio({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'horaInicio', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QDistinct> distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QDistinct>
      distinctByIdBoca() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBoca');
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QDistinct>
      distinctByLatitud({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitud', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QDistinct>
      distinctByLongitud({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitud', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QDistinct>
      distinctByPathImagen({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pathImagen', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QDistinct>
      distinctBySincronizado() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sincronizado');
    });
  }

  QueryBuilder<RespuestaCabModel, RespuestaCabModel, QDistinct>
      distinctByUsuario({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usuario', caseSensitive: caseSensitive);
    });
  }
}

extension RespuestaCabModelQueryProperty
    on QueryBuilder<RespuestaCabModel, RespuestaCabModel, QQueryProperty> {
  QueryBuilder<RespuestaCabModel, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<RespuestaCabModel, String, QQueryOperations> codBocaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'codBoca');
    });
  }

  QueryBuilder<RespuestaCabModel, String, QQueryOperations> descBocaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descBoca');
    });
  }

  QueryBuilder<RespuestaCabModel, String, QQueryOperations>
      fechaCreacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCreacion');
    });
  }

  QueryBuilder<RespuestaCabModel, String?, QQueryOperations>
      fechaSincronizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaSincronizacion');
    });
  }

  QueryBuilder<RespuestaCabModel, String, QQueryOperations> horaFinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horaFin');
    });
  }

  QueryBuilder<RespuestaCabModel, String, QQueryOperations>
      horaInicioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'horaInicio');
    });
  }

  QueryBuilder<RespuestaCabModel, int?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RespuestaCabModel, int, QQueryOperations> idBocaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBoca');
    });
  }

  QueryBuilder<RespuestaCabModel, String, QQueryOperations> latitudProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitud');
    });
  }

  QueryBuilder<RespuestaCabModel, String, QQueryOperations> longitudProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitud');
    });
  }

  QueryBuilder<RespuestaCabModel, String, QQueryOperations>
      pathImagenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pathImagen');
    });
  }

  QueryBuilder<RespuestaCabModel, bool, QQueryOperations>
      sincronizadoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sincronizado');
    });
  }

  QueryBuilder<RespuestaCabModel, String, QQueryOperations> usuarioProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usuario');
    });
  }
}
