// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsuariosLocalTable extends UsuariosLocal
    with TableInfo<$UsuariosLocalTable, UsuariosLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsuariosLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _perfilMeta = const VerificationMeta('perfil');
  @override
  late final GeneratedColumn<String> perfil = GeneratedColumn<String>(
      'perfil', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cpfMeta = const VerificationMeta('cpf');
  @override
  late final GeneratedColumn<String> cpf = GeneratedColumn<String>(
      'cpf', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _telefoneMeta =
      const VerificationMeta('telefone');
  @override
  late final GeneratedColumn<String> telefone = GeneratedColumn<String>(
      'telefone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _creatdAtMeta =
      const VerificationMeta('creatdAt');
  @override
  late final GeneratedColumn<String> creatdAt = GeneratedColumn<String>(
      'creatd_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, email, nome, perfil, cpf, telefone, creatdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'usuarios_local';
  @override
  VerificationContext validateIntegrity(Insertable<UsuariosLocalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('perfil')) {
      context.handle(_perfilMeta,
          perfil.isAcceptableOrUnknown(data['perfil']!, _perfilMeta));
    } else if (isInserting) {
      context.missing(_perfilMeta);
    }
    if (data.containsKey('cpf')) {
      context.handle(
          _cpfMeta, cpf.isAcceptableOrUnknown(data['cpf']!, _cpfMeta));
    } else if (isInserting) {
      context.missing(_cpfMeta);
    }
    if (data.containsKey('telefone')) {
      context.handle(_telefoneMeta,
          telefone.isAcceptableOrUnknown(data['telefone']!, _telefoneMeta));
    }
    if (data.containsKey('creatd_at')) {
      context.handle(_creatdAtMeta,
          creatdAt.isAcceptableOrUnknown(data['creatd_at']!, _creatdAtMeta));
    } else if (isInserting) {
      context.missing(_creatdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UsuariosLocalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsuariosLocalData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      perfil: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}perfil'])!,
      cpf: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cpf'])!,
      telefone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}telefone']),
      creatdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}creatd_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $UsuariosLocalTable createAlias(String alias) {
    return $UsuariosLocalTable(attachedDatabase, alias);
  }
}

class UsuariosLocalData extends DataClass
    implements Insertable<UsuariosLocalData> {
  final int id;
  final String email;
  final String nome;
  final String perfil;
  final String cpf;
  final String? telefone;
  final String creatdAt;
  final String updatedAt;
  const UsuariosLocalData(
      {required this.id,
      required this.email,
      required this.nome,
      required this.perfil,
      required this.cpf,
      this.telefone,
      required this.creatdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['email'] = Variable<String>(email);
    map['nome'] = Variable<String>(nome);
    map['perfil'] = Variable<String>(perfil);
    map['cpf'] = Variable<String>(cpf);
    if (!nullToAbsent || telefone != null) {
      map['telefone'] = Variable<String>(telefone);
    }
    map['creatd_at'] = Variable<String>(creatdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  UsuariosLocalCompanion toCompanion(bool nullToAbsent) {
    return UsuariosLocalCompanion(
      id: Value(id),
      email: Value(email),
      nome: Value(nome),
      perfil: Value(perfil),
      cpf: Value(cpf),
      telefone: telefone == null && nullToAbsent
          ? const Value.absent()
          : Value(telefone),
      creatdAt: Value(creatdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UsuariosLocalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsuariosLocalData(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      nome: serializer.fromJson<String>(json['nome']),
      perfil: serializer.fromJson<String>(json['perfil']),
      cpf: serializer.fromJson<String>(json['cpf']),
      telefone: serializer.fromJson<String?>(json['telefone']),
      creatdAt: serializer.fromJson<String>(json['creatdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
      'nome': serializer.toJson<String>(nome),
      'perfil': serializer.toJson<String>(perfil),
      'cpf': serializer.toJson<String>(cpf),
      'telefone': serializer.toJson<String?>(telefone),
      'creatdAt': serializer.toJson<String>(creatdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  UsuariosLocalData copyWith(
          {int? id,
          String? email,
          String? nome,
          String? perfil,
          String? cpf,
          Value<String?> telefone = const Value.absent(),
          String? creatdAt,
          String? updatedAt}) =>
      UsuariosLocalData(
        id: id ?? this.id,
        email: email ?? this.email,
        nome: nome ?? this.nome,
        perfil: perfil ?? this.perfil,
        cpf: cpf ?? this.cpf,
        telefone: telefone.present ? telefone.value : this.telefone,
        creatdAt: creatdAt ?? this.creatdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  UsuariosLocalData copyWithCompanion(UsuariosLocalCompanion data) {
    return UsuariosLocalData(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      nome: data.nome.present ? data.nome.value : this.nome,
      perfil: data.perfil.present ? data.perfil.value : this.perfil,
      cpf: data.cpf.present ? data.cpf.value : this.cpf,
      telefone: data.telefone.present ? data.telefone.value : this.telefone,
      creatdAt: data.creatdAt.present ? data.creatdAt.value : this.creatdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsuariosLocalData(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('nome: $nome, ')
          ..write('perfil: $perfil, ')
          ..write('cpf: $cpf, ')
          ..write('telefone: $telefone, ')
          ..write('creatdAt: $creatdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, email, nome, perfil, cpf, telefone, creatdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsuariosLocalData &&
          other.id == this.id &&
          other.email == this.email &&
          other.nome == this.nome &&
          other.perfil == this.perfil &&
          other.cpf == this.cpf &&
          other.telefone == this.telefone &&
          other.creatdAt == this.creatdAt &&
          other.updatedAt == this.updatedAt);
}

class UsuariosLocalCompanion extends UpdateCompanion<UsuariosLocalData> {
  final Value<int> id;
  final Value<String> email;
  final Value<String> nome;
  final Value<String> perfil;
  final Value<String> cpf;
  final Value<String?> telefone;
  final Value<String> creatdAt;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const UsuariosLocalCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.nome = const Value.absent(),
    this.perfil = const Value.absent(),
    this.cpf = const Value.absent(),
    this.telefone = const Value.absent(),
    this.creatdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsuariosLocalCompanion.insert({
    required int id,
    required String email,
    required String nome,
    required String perfil,
    required String cpf,
    this.telefone = const Value.absent(),
    required String creatdAt,
    required String updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        email = Value(email),
        nome = Value(nome),
        perfil = Value(perfil),
        cpf = Value(cpf),
        creatdAt = Value(creatdAt),
        updatedAt = Value(updatedAt);
  static Insertable<UsuariosLocalData> custom({
    Expression<int>? id,
    Expression<String>? email,
    Expression<String>? nome,
    Expression<String>? perfil,
    Expression<String>? cpf,
    Expression<String>? telefone,
    Expression<String>? creatdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (nome != null) 'nome': nome,
      if (perfil != null) 'perfil': perfil,
      if (cpf != null) 'cpf': cpf,
      if (telefone != null) 'telefone': telefone,
      if (creatdAt != null) 'creatd_at': creatdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsuariosLocalCompanion copyWith(
      {Value<int>? id,
      Value<String>? email,
      Value<String>? nome,
      Value<String>? perfil,
      Value<String>? cpf,
      Value<String?>? telefone,
      Value<String>? creatdAt,
      Value<String>? updatedAt,
      Value<int>? rowid}) {
    return UsuariosLocalCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      nome: nome ?? this.nome,
      perfil: perfil ?? this.perfil,
      cpf: cpf ?? this.cpf,
      telefone: telefone ?? this.telefone,
      creatdAt: creatdAt ?? this.creatdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (perfil.present) {
      map['perfil'] = Variable<String>(perfil.value);
    }
    if (cpf.present) {
      map['cpf'] = Variable<String>(cpf.value);
    }
    if (telefone.present) {
      map['telefone'] = Variable<String>(telefone.value);
    }
    if (creatdAt.present) {
      map['creatd_at'] = Variable<String>(creatdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsuariosLocalCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('nome: $nome, ')
          ..write('perfil: $perfil, ')
          ..write('cpf: $cpf, ')
          ..write('telefone: $telefone, ')
          ..write('creatdAt: $creatdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FazendasLocalTable extends FazendasLocal
    with TableInfo<$FazendasLocalTable, FazendasLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FazendasLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cnpjMeta = const VerificationMeta('cnpj');
  @override
  late final GeneratedColumn<String> cnpj = GeneratedColumn<String>(
      'cnpj', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _produtorIdMeta =
      const VerificationMeta('produtorId');
  @override
  late final GeneratedColumn<int> produtorId = GeneratedColumn<int>(
      'produtor_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES usuarios_local(id)');
  static const VerificationMeta _municipioMeta =
      const VerificationMeta('municipio');
  @override
  late final GeneratedColumn<String> municipio = GeneratedColumn<String>(
      'municipio', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<String> estado = GeneratedColumn<String>(
      'estado', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _areaTotalMeta =
      const VerificationMeta('areaTotal');
  @override
  late final GeneratedColumn<String> areaTotal = GeneratedColumn<String>(
      'area_total', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        nome,
        cnpj,
        produtorId,
        municipio,
        estado,
        areaTotal,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fazendas_local';
  @override
  VerificationContext validateIntegrity(Insertable<FazendasLocalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('cnpj')) {
      context.handle(
          _cnpjMeta, cnpj.isAcceptableOrUnknown(data['cnpj']!, _cnpjMeta));
    } else if (isInserting) {
      context.missing(_cnpjMeta);
    }
    if (data.containsKey('produtor_id')) {
      context.handle(
          _produtorIdMeta,
          produtorId.isAcceptableOrUnknown(
              data['produtor_id']!, _produtorIdMeta));
    } else if (isInserting) {
      context.missing(_produtorIdMeta);
    }
    if (data.containsKey('municipio')) {
      context.handle(_municipioMeta,
          municipio.isAcceptableOrUnknown(data['municipio']!, _municipioMeta));
    } else if (isInserting) {
      context.missing(_municipioMeta);
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
    } else if (isInserting) {
      context.missing(_estadoMeta);
    }
    if (data.containsKey('area_total')) {
      context.handle(_areaTotalMeta,
          areaTotal.isAcceptableOrUnknown(data['area_total']!, _areaTotalMeta));
    } else if (isInserting) {
      context.missing(_areaTotalMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  FazendasLocalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FazendasLocalData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      cnpj: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cnpj'])!,
      produtorId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}produtor_id'])!,
      municipio: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}municipio'])!,
      estado: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}estado'])!,
      areaTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}area_total'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $FazendasLocalTable createAlias(String alias) {
    return $FazendasLocalTable(attachedDatabase, alias);
  }
}

class FazendasLocalData extends DataClass
    implements Insertable<FazendasLocalData> {
  final int id;
  final String nome;
  final String cnpj;
  final int produtorId;
  final String municipio;
  final String estado;
  final String areaTotal;
  final String createdAt;
  final String updatedAt;
  const FazendasLocalData(
      {required this.id,
      required this.nome,
      required this.cnpj,
      required this.produtorId,
      required this.municipio,
      required this.estado,
      required this.areaTotal,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['cnpj'] = Variable<String>(cnpj);
    map['produtor_id'] = Variable<int>(produtorId);
    map['municipio'] = Variable<String>(municipio);
    map['estado'] = Variable<String>(estado);
    map['area_total'] = Variable<String>(areaTotal);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  FazendasLocalCompanion toCompanion(bool nullToAbsent) {
    return FazendasLocalCompanion(
      id: Value(id),
      nome: Value(nome),
      cnpj: Value(cnpj),
      produtorId: Value(produtorId),
      municipio: Value(municipio),
      estado: Value(estado),
      areaTotal: Value(areaTotal),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory FazendasLocalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FazendasLocalData(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      cnpj: serializer.fromJson<String>(json['cnpj']),
      produtorId: serializer.fromJson<int>(json['produtorId']),
      municipio: serializer.fromJson<String>(json['municipio']),
      estado: serializer.fromJson<String>(json['estado']),
      areaTotal: serializer.fromJson<String>(json['areaTotal']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'cnpj': serializer.toJson<String>(cnpj),
      'produtorId': serializer.toJson<int>(produtorId),
      'municipio': serializer.toJson<String>(municipio),
      'estado': serializer.toJson<String>(estado),
      'areaTotal': serializer.toJson<String>(areaTotal),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  FazendasLocalData copyWith(
          {int? id,
          String? nome,
          String? cnpj,
          int? produtorId,
          String? municipio,
          String? estado,
          String? areaTotal,
          String? createdAt,
          String? updatedAt}) =>
      FazendasLocalData(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        cnpj: cnpj ?? this.cnpj,
        produtorId: produtorId ?? this.produtorId,
        municipio: municipio ?? this.municipio,
        estado: estado ?? this.estado,
        areaTotal: areaTotal ?? this.areaTotal,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  FazendasLocalData copyWithCompanion(FazendasLocalCompanion data) {
    return FazendasLocalData(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      cnpj: data.cnpj.present ? data.cnpj.value : this.cnpj,
      produtorId:
          data.produtorId.present ? data.produtorId.value : this.produtorId,
      municipio: data.municipio.present ? data.municipio.value : this.municipio,
      estado: data.estado.present ? data.estado.value : this.estado,
      areaTotal: data.areaTotal.present ? data.areaTotal.value : this.areaTotal,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FazendasLocalData(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('cnpj: $cnpj, ')
          ..write('produtorId: $produtorId, ')
          ..write('municipio: $municipio, ')
          ..write('estado: $estado, ')
          ..write('areaTotal: $areaTotal, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, cnpj, produtorId, municipio, estado,
      areaTotal, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FazendasLocalData &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.cnpj == this.cnpj &&
          other.produtorId == this.produtorId &&
          other.municipio == this.municipio &&
          other.estado == this.estado &&
          other.areaTotal == this.areaTotal &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class FazendasLocalCompanion extends UpdateCompanion<FazendasLocalData> {
  final Value<int> id;
  final Value<String> nome;
  final Value<String> cnpj;
  final Value<int> produtorId;
  final Value<String> municipio;
  final Value<String> estado;
  final Value<String> areaTotal;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const FazendasLocalCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.cnpj = const Value.absent(),
    this.produtorId = const Value.absent(),
    this.municipio = const Value.absent(),
    this.estado = const Value.absent(),
    this.areaTotal = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FazendasLocalCompanion.insert({
    required int id,
    required String nome,
    required String cnpj,
    required int produtorId,
    required String municipio,
    required String estado,
    required String areaTotal,
    required String createdAt,
    required String updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        nome = Value(nome),
        cnpj = Value(cnpj),
        produtorId = Value(produtorId),
        municipio = Value(municipio),
        estado = Value(estado),
        areaTotal = Value(areaTotal),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<FazendasLocalData> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<String>? cnpj,
    Expression<int>? produtorId,
    Expression<String>? municipio,
    Expression<String>? estado,
    Expression<String>? areaTotal,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (cnpj != null) 'cnpj': cnpj,
      if (produtorId != null) 'produtor_id': produtorId,
      if (municipio != null) 'municipio': municipio,
      if (estado != null) 'estado': estado,
      if (areaTotal != null) 'area_total': areaTotal,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FazendasLocalCompanion copyWith(
      {Value<int>? id,
      Value<String>? nome,
      Value<String>? cnpj,
      Value<int>? produtorId,
      Value<String>? municipio,
      Value<String>? estado,
      Value<String>? areaTotal,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<int>? rowid}) {
    return FazendasLocalCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      cnpj: cnpj ?? this.cnpj,
      produtorId: produtorId ?? this.produtorId,
      municipio: municipio ?? this.municipio,
      estado: estado ?? this.estado,
      areaTotal: areaTotal ?? this.areaTotal,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (cnpj.present) {
      map['cnpj'] = Variable<String>(cnpj.value);
    }
    if (produtorId.present) {
      map['produtor_id'] = Variable<int>(produtorId.value);
    }
    if (municipio.present) {
      map['municipio'] = Variable<String>(municipio.value);
    }
    if (estado.present) {
      map['estado'] = Variable<String>(estado.value);
    }
    if (areaTotal.present) {
      map['area_total'] = Variable<String>(areaTotal.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FazendasLocalCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('cnpj: $cnpj, ')
          ..write('produtorId: $produtorId, ')
          ..write('municipio: $municipio, ')
          ..write('estado: $estado, ')
          ..write('areaTotal: $areaTotal, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TalhoesLocalTable extends TalhoesLocal
    with TableInfo<$TalhoesLocalTable, TalhoesLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TalhoesLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
      'nome', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fazendasIdMeta =
      const VerificationMeta('fazendasId');
  @override
  late final GeneratedColumn<int> fazendasId = GeneratedColumn<int>(
      'fazendas_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES fazendas_local(id)');
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String> area = GeneratedColumn<String>(
      'area', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _culturaMeta =
      const VerificationMeta('cultura');
  @override
  late final GeneratedColumn<String> cultura = GeneratedColumn<String>(
      'cultura', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dataPlantioMeta =
      const VerificationMeta('dataPlantio');
  @override
  late final GeneratedColumn<String> dataPlantio = GeneratedColumn<String>(
      'data_plantio', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        nome,
        fazendasId,
        area,
        cultura,
        dataPlantio,
        status,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'talhoes_local';
  @override
  VerificationContext validateIntegrity(Insertable<TalhoesLocalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('nome')) {
      context.handle(
          _nomeMeta, nome.isAcceptableOrUnknown(data['nome']!, _nomeMeta));
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('fazendas_id')) {
      context.handle(
          _fazendasIdMeta,
          fazendasId.isAcceptableOrUnknown(
              data['fazendas_id']!, _fazendasIdMeta));
    } else if (isInserting) {
      context.missing(_fazendasIdMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
          _areaMeta, area.isAcceptableOrUnknown(data['area']!, _areaMeta));
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    if (data.containsKey('cultura')) {
      context.handle(_culturaMeta,
          cultura.isAcceptableOrUnknown(data['cultura']!, _culturaMeta));
    } else if (isInserting) {
      context.missing(_culturaMeta);
    }
    if (data.containsKey('data_plantio')) {
      context.handle(
          _dataPlantioMeta,
          dataPlantio.isAcceptableOrUnknown(
              data['data_plantio']!, _dataPlantioMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TalhoesLocalData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TalhoesLocalData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nome: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nome'])!,
      fazendasId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fazendas_id'])!,
      area: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}area'])!,
      cultura: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cultura'])!,
      dataPlantio: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data_plantio']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $TalhoesLocalTable createAlias(String alias) {
    return $TalhoesLocalTable(attachedDatabase, alias);
  }
}

class TalhoesLocalData extends DataClass
    implements Insertable<TalhoesLocalData> {
  final int id;
  final String nome;
  final int fazendasId;
  final String area;
  final String cultura;
  final String? dataPlantio;
  final String status;
  final String createdAt;
  final String updatedAt;
  const TalhoesLocalData(
      {required this.id,
      required this.nome,
      required this.fazendasId,
      required this.area,
      required this.cultura,
      this.dataPlantio,
      required this.status,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nome'] = Variable<String>(nome);
    map['fazendas_id'] = Variable<int>(fazendasId);
    map['area'] = Variable<String>(area);
    map['cultura'] = Variable<String>(cultura);
    if (!nullToAbsent || dataPlantio != null) {
      map['data_plantio'] = Variable<String>(dataPlantio);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  TalhoesLocalCompanion toCompanion(bool nullToAbsent) {
    return TalhoesLocalCompanion(
      id: Value(id),
      nome: Value(nome),
      fazendasId: Value(fazendasId),
      area: Value(area),
      cultura: Value(cultura),
      dataPlantio: dataPlantio == null && nullToAbsent
          ? const Value.absent()
          : Value(dataPlantio),
      status: Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TalhoesLocalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TalhoesLocalData(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      fazendasId: serializer.fromJson<int>(json['fazendasId']),
      area: serializer.fromJson<String>(json['area']),
      cultura: serializer.fromJson<String>(json['cultura']),
      dataPlantio: serializer.fromJson<String?>(json['dataPlantio']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'fazendasId': serializer.toJson<int>(fazendasId),
      'area': serializer.toJson<String>(area),
      'cultura': serializer.toJson<String>(cultura),
      'dataPlantio': serializer.toJson<String?>(dataPlantio),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  TalhoesLocalData copyWith(
          {int? id,
          String? nome,
          int? fazendasId,
          String? area,
          String? cultura,
          Value<String?> dataPlantio = const Value.absent(),
          String? status,
          String? createdAt,
          String? updatedAt}) =>
      TalhoesLocalData(
        id: id ?? this.id,
        nome: nome ?? this.nome,
        fazendasId: fazendasId ?? this.fazendasId,
        area: area ?? this.area,
        cultura: cultura ?? this.cultura,
        dataPlantio: dataPlantio.present ? dataPlantio.value : this.dataPlantio,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  TalhoesLocalData copyWithCompanion(TalhoesLocalCompanion data) {
    return TalhoesLocalData(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      fazendasId:
          data.fazendasId.present ? data.fazendasId.value : this.fazendasId,
      area: data.area.present ? data.area.value : this.area,
      cultura: data.cultura.present ? data.cultura.value : this.cultura,
      dataPlantio:
          data.dataPlantio.present ? data.dataPlantio.value : this.dataPlantio,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TalhoesLocalData(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('fazendasId: $fazendasId, ')
          ..write('area: $area, ')
          ..write('cultura: $cultura, ')
          ..write('dataPlantio: $dataPlantio, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, fazendasId, area, cultura,
      dataPlantio, status, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TalhoesLocalData &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.fazendasId == this.fazendasId &&
          other.area == this.area &&
          other.cultura == this.cultura &&
          other.dataPlantio == this.dataPlantio &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TalhoesLocalCompanion extends UpdateCompanion<TalhoesLocalData> {
  final Value<int> id;
  final Value<String> nome;
  final Value<int> fazendasId;
  final Value<String> area;
  final Value<String> cultura;
  final Value<String?> dataPlantio;
  final Value<String> status;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const TalhoesLocalCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.fazendasId = const Value.absent(),
    this.area = const Value.absent(),
    this.cultura = const Value.absent(),
    this.dataPlantio = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TalhoesLocalCompanion.insert({
    required int id,
    required String nome,
    required int fazendasId,
    required String area,
    required String cultura,
    this.dataPlantio = const Value.absent(),
    required String status,
    required String createdAt,
    required String updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        nome = Value(nome),
        fazendasId = Value(fazendasId),
        area = Value(area),
        cultura = Value(cultura),
        status = Value(status),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TalhoesLocalData> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<int>? fazendasId,
    Expression<String>? area,
    Expression<String>? cultura,
    Expression<String>? dataPlantio,
    Expression<String>? status,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nome != null) 'nome': nome,
      if (fazendasId != null) 'fazendas_id': fazendasId,
      if (area != null) 'area': area,
      if (cultura != null) 'cultura': cultura,
      if (dataPlantio != null) 'data_plantio': dataPlantio,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TalhoesLocalCompanion copyWith(
      {Value<int>? id,
      Value<String>? nome,
      Value<int>? fazendasId,
      Value<String>? area,
      Value<String>? cultura,
      Value<String?>? dataPlantio,
      Value<String>? status,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<int>? rowid}) {
    return TalhoesLocalCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      fazendasId: fazendasId ?? this.fazendasId,
      area: area ?? this.area,
      cultura: cultura ?? this.cultura,
      dataPlantio: dataPlantio ?? this.dataPlantio,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['nome'] = Variable<String>(nome.value);
    }
    if (fazendasId.present) {
      map['fazendas_id'] = Variable<int>(fazendasId.value);
    }
    if (area.present) {
      map['area'] = Variable<String>(area.value);
    }
    if (cultura.present) {
      map['cultura'] = Variable<String>(cultura.value);
    }
    if (dataPlantio.present) {
      map['data_plantio'] = Variable<String>(dataPlantio.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TalhoesLocalCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('fazendasId: $fazendasId, ')
          ..write('area: $area, ')
          ..write('cultura: $cultura, ')
          ..write('dataPlantio: $dataPlantio, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventosManejosLocalTable extends EventosManejosLocal
    with TableInfo<$EventosManejosLocalTable, EventosManejosLocalData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventosManejosLocalTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _talhaoIdMeta =
      const VerificationMeta('talhaoId');
  @override
  late final GeneratedColumn<int> talhaoId = GeneratedColumn<int>(
      'talhao_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES talhoes_local(id)');
  static const VerificationMeta _tipoEventoMeta =
      const VerificationMeta('tipoEvento');
  @override
  late final GeneratedColumn<String> tipoEvento = GeneratedColumn<String>(
      'tipo_evento', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descricaoMeta =
      const VerificationMeta('descricao');
  @override
  late final GeneratedColumn<String> descricao = GeneratedColumn<String>(
      'descricao', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dataEventoMeta =
      const VerificationMeta('dataEvento');
  @override
  late final GeneratedColumn<String> dataEvento = GeneratedColumn<String>(
      'data_evento', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dataRegistroMeta =
      const VerificationMeta('dataRegistro');
  @override
  late final GeneratedColumn<String> dataRegistro = GeneratedColumn<String>(
      'data_registro', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _responsavelMeta =
      const VerificationMeta('responsavel');
  @override
  late final GeneratedColumn<String> responsavel = GeneratedColumn<String>(
      'responsavel', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notasMeta = const VerificationMeta('notas');
  @override
  late final GeneratedColumn<String> notas = GeneratedColumn<String>(
      'notas', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        talhaoId,
        tipoEvento,
        descricao,
        dataEvento,
        dataRegistro,
        responsavel,
        notas,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'eventos_manejos_local';
  @override
  VerificationContext validateIntegrity(
      Insertable<EventosManejosLocalData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('talhao_id')) {
      context.handle(_talhaoIdMeta,
          talhaoId.isAcceptableOrUnknown(data['talhao_id']!, _talhaoIdMeta));
    } else if (isInserting) {
      context.missing(_talhaoIdMeta);
    }
    if (data.containsKey('tipo_evento')) {
      context.handle(
          _tipoEventoMeta,
          tipoEvento.isAcceptableOrUnknown(
              data['tipo_evento']!, _tipoEventoMeta));
    } else if (isInserting) {
      context.missing(_tipoEventoMeta);
    }
    if (data.containsKey('descricao')) {
      context.handle(_descricaoMeta,
          descricao.isAcceptableOrUnknown(data['descricao']!, _descricaoMeta));
    }
    if (data.containsKey('data_evento')) {
      context.handle(
          _dataEventoMeta,
          dataEvento.isAcceptableOrUnknown(
              data['data_evento']!, _dataEventoMeta));
    } else if (isInserting) {
      context.missing(_dataEventoMeta);
    }
    if (data.containsKey('data_registro')) {
      context.handle(
          _dataRegistroMeta,
          dataRegistro.isAcceptableOrUnknown(
              data['data_registro']!, _dataRegistroMeta));
    } else if (isInserting) {
      context.missing(_dataRegistroMeta);
    }
    if (data.containsKey('responsavel')) {
      context.handle(
          _responsavelMeta,
          responsavel.isAcceptableOrUnknown(
              data['responsavel']!, _responsavelMeta));
    } else if (isInserting) {
      context.missing(_responsavelMeta);
    }
    if (data.containsKey('notas')) {
      context.handle(
          _notasMeta, notas.isAcceptableOrUnknown(data['notas']!, _notasMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  EventosManejosLocalData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventosManejosLocalData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      talhaoId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}talhao_id'])!,
      tipoEvento: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tipo_evento'])!,
      descricao: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descricao']),
      dataEvento: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data_evento'])!,
      dataRegistro: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data_registro'])!,
      responsavel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}responsavel'])!,
      notas: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notas']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $EventosManejosLocalTable createAlias(String alias) {
    return $EventosManejosLocalTable(attachedDatabase, alias);
  }
}

class EventosManejosLocalData extends DataClass
    implements Insertable<EventosManejosLocalData> {
  final int id;
  final int talhaoId;
  final String tipoEvento;
  final String? descricao;
  final String dataEvento;
  final String dataRegistro;
  final String responsavel;
  final String? notas;
  final String createdAt;
  final String updatedAt;
  const EventosManejosLocalData(
      {required this.id,
      required this.talhaoId,
      required this.tipoEvento,
      this.descricao,
      required this.dataEvento,
      required this.dataRegistro,
      required this.responsavel,
      this.notas,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['talhao_id'] = Variable<int>(talhaoId);
    map['tipo_evento'] = Variable<String>(tipoEvento);
    if (!nullToAbsent || descricao != null) {
      map['descricao'] = Variable<String>(descricao);
    }
    map['data_evento'] = Variable<String>(dataEvento);
    map['data_registro'] = Variable<String>(dataRegistro);
    map['responsavel'] = Variable<String>(responsavel);
    if (!nullToAbsent || notas != null) {
      map['notas'] = Variable<String>(notas);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  EventosManejosLocalCompanion toCompanion(bool nullToAbsent) {
    return EventosManejosLocalCompanion(
      id: Value(id),
      talhaoId: Value(talhaoId),
      tipoEvento: Value(tipoEvento),
      descricao: descricao == null && nullToAbsent
          ? const Value.absent()
          : Value(descricao),
      dataEvento: Value(dataEvento),
      dataRegistro: Value(dataRegistro),
      responsavel: Value(responsavel),
      notas:
          notas == null && nullToAbsent ? const Value.absent() : Value(notas),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory EventosManejosLocalData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventosManejosLocalData(
      id: serializer.fromJson<int>(json['id']),
      talhaoId: serializer.fromJson<int>(json['talhaoId']),
      tipoEvento: serializer.fromJson<String>(json['tipoEvento']),
      descricao: serializer.fromJson<String?>(json['descricao']),
      dataEvento: serializer.fromJson<String>(json['dataEvento']),
      dataRegistro: serializer.fromJson<String>(json['dataRegistro']),
      responsavel: serializer.fromJson<String>(json['responsavel']),
      notas: serializer.fromJson<String?>(json['notas']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'talhaoId': serializer.toJson<int>(talhaoId),
      'tipoEvento': serializer.toJson<String>(tipoEvento),
      'descricao': serializer.toJson<String?>(descricao),
      'dataEvento': serializer.toJson<String>(dataEvento),
      'dataRegistro': serializer.toJson<String>(dataRegistro),
      'responsavel': serializer.toJson<String>(responsavel),
      'notas': serializer.toJson<String?>(notas),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  EventosManejosLocalData copyWith(
          {int? id,
          int? talhaoId,
          String? tipoEvento,
          Value<String?> descricao = const Value.absent(),
          String? dataEvento,
          String? dataRegistro,
          String? responsavel,
          Value<String?> notas = const Value.absent(),
          String? createdAt,
          String? updatedAt}) =>
      EventosManejosLocalData(
        id: id ?? this.id,
        talhaoId: talhaoId ?? this.talhaoId,
        tipoEvento: tipoEvento ?? this.tipoEvento,
        descricao: descricao.present ? descricao.value : this.descricao,
        dataEvento: dataEvento ?? this.dataEvento,
        dataRegistro: dataRegistro ?? this.dataRegistro,
        responsavel: responsavel ?? this.responsavel,
        notas: notas.present ? notas.value : this.notas,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  EventosManejosLocalData copyWithCompanion(EventosManejosLocalCompanion data) {
    return EventosManejosLocalData(
      id: data.id.present ? data.id.value : this.id,
      talhaoId: data.talhaoId.present ? data.talhaoId.value : this.talhaoId,
      tipoEvento:
          data.tipoEvento.present ? data.tipoEvento.value : this.tipoEvento,
      descricao: data.descricao.present ? data.descricao.value : this.descricao,
      dataEvento:
          data.dataEvento.present ? data.dataEvento.value : this.dataEvento,
      dataRegistro: data.dataRegistro.present
          ? data.dataRegistro.value
          : this.dataRegistro,
      responsavel:
          data.responsavel.present ? data.responsavel.value : this.responsavel,
      notas: data.notas.present ? data.notas.value : this.notas,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventosManejosLocalData(')
          ..write('id: $id, ')
          ..write('talhaoId: $talhaoId, ')
          ..write('tipoEvento: $tipoEvento, ')
          ..write('descricao: $descricao, ')
          ..write('dataEvento: $dataEvento, ')
          ..write('dataRegistro: $dataRegistro, ')
          ..write('responsavel: $responsavel, ')
          ..write('notas: $notas, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, talhaoId, tipoEvento, descricao,
      dataEvento, dataRegistro, responsavel, notas, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventosManejosLocalData &&
          other.id == this.id &&
          other.talhaoId == this.talhaoId &&
          other.tipoEvento == this.tipoEvento &&
          other.descricao == this.descricao &&
          other.dataEvento == this.dataEvento &&
          other.dataRegistro == this.dataRegistro &&
          other.responsavel == this.responsavel &&
          other.notas == this.notas &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class EventosManejosLocalCompanion
    extends UpdateCompanion<EventosManejosLocalData> {
  final Value<int> id;
  final Value<int> talhaoId;
  final Value<String> tipoEvento;
  final Value<String?> descricao;
  final Value<String> dataEvento;
  final Value<String> dataRegistro;
  final Value<String> responsavel;
  final Value<String?> notas;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const EventosManejosLocalCompanion({
    this.id = const Value.absent(),
    this.talhaoId = const Value.absent(),
    this.tipoEvento = const Value.absent(),
    this.descricao = const Value.absent(),
    this.dataEvento = const Value.absent(),
    this.dataRegistro = const Value.absent(),
    this.responsavel = const Value.absent(),
    this.notas = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventosManejosLocalCompanion.insert({
    required int id,
    required int talhaoId,
    required String tipoEvento,
    this.descricao = const Value.absent(),
    required String dataEvento,
    required String dataRegistro,
    required String responsavel,
    this.notas = const Value.absent(),
    required String createdAt,
    required String updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        talhaoId = Value(talhaoId),
        tipoEvento = Value(tipoEvento),
        dataEvento = Value(dataEvento),
        dataRegistro = Value(dataRegistro),
        responsavel = Value(responsavel),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<EventosManejosLocalData> custom({
    Expression<int>? id,
    Expression<int>? talhaoId,
    Expression<String>? tipoEvento,
    Expression<String>? descricao,
    Expression<String>? dataEvento,
    Expression<String>? dataRegistro,
    Expression<String>? responsavel,
    Expression<String>? notas,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (talhaoId != null) 'talhao_id': talhaoId,
      if (tipoEvento != null) 'tipo_evento': tipoEvento,
      if (descricao != null) 'descricao': descricao,
      if (dataEvento != null) 'data_evento': dataEvento,
      if (dataRegistro != null) 'data_registro': dataRegistro,
      if (responsavel != null) 'responsavel': responsavel,
      if (notas != null) 'notas': notas,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventosManejosLocalCompanion copyWith(
      {Value<int>? id,
      Value<int>? talhaoId,
      Value<String>? tipoEvento,
      Value<String?>? descricao,
      Value<String>? dataEvento,
      Value<String>? dataRegistro,
      Value<String>? responsavel,
      Value<String?>? notas,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<int>? rowid}) {
    return EventosManejosLocalCompanion(
      id: id ?? this.id,
      talhaoId: talhaoId ?? this.talhaoId,
      tipoEvento: tipoEvento ?? this.tipoEvento,
      descricao: descricao ?? this.descricao,
      dataEvento: dataEvento ?? this.dataEvento,
      dataRegistro: dataRegistro ?? this.dataRegistro,
      responsavel: responsavel ?? this.responsavel,
      notas: notas ?? this.notas,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (talhaoId.present) {
      map['talhao_id'] = Variable<int>(talhaoId.value);
    }
    if (tipoEvento.present) {
      map['tipo_evento'] = Variable<String>(tipoEvento.value);
    }
    if (descricao.present) {
      map['descricao'] = Variable<String>(descricao.value);
    }
    if (dataEvento.present) {
      map['data_evento'] = Variable<String>(dataEvento.value);
    }
    if (dataRegistro.present) {
      map['data_registro'] = Variable<String>(dataRegistro.value);
    }
    if (responsavel.present) {
      map['responsavel'] = Variable<String>(responsavel.value);
    }
    if (notas.present) {
      map['notas'] = Variable<String>(notas.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventosManejosLocalCompanion(')
          ..write('id: $id, ')
          ..write('talhaoId: $talhaoId, ')
          ..write('tipoEvento: $tipoEvento, ')
          ..write('descricao: $descricao, ')
          ..write('dataEvento: $dataEvento, ')
          ..write('dataRegistro: $dataRegistro, ')
          ..write('responsavel: $responsavel, ')
          ..write('notas: $notas, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTable extends SyncQueue
    with TableInfo<$SyncQueueTable, SyncQueueData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entityIdLocalMeta =
      const VerificationMeta('entityIdLocal');
  @override
  late final GeneratedColumn<String> entityIdLocal = GeneratedColumn<String>(
      'entity_id_local', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entityIdRemoteMeta =
      const VerificationMeta('entityIdRemote');
  @override
  late final GeneratedColumn<int> entityIdRemote = GeneratedColumn<int>(
      'entity_id_remote', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _operationMeta =
      const VerificationMeta('operation');
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
      'operation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _payloadMeta =
      const VerificationMeta('payload');
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
      'payload', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('PENDING'));
  static const VerificationMeta _retryCountMeta =
      const VerificationMeta('retryCount');
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
      'retry_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _maxRetriesMeta =
      const VerificationMeta('maxRetries');
  @override
  late final GeneratedColumn<int> maxRetries = GeneratedColumn<int>(
      'max_retries', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(3));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
      'created_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastAttemptAtMeta =
      const VerificationMeta('lastAttemptAt');
  @override
  late final GeneratedColumn<String> lastAttemptAt = GeneratedColumn<String>(
      'last_attempt_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _errorMessageMeta =
      const VerificationMeta('errorMessage');
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
      'error_message', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _checksumMeta =
      const VerificationMeta('checksum');
  @override
  late final GeneratedColumn<String> checksum = GeneratedColumn<String>(
      'checksum', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<int> version = GeneratedColumn<int>(
      'version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _originDeviceMeta =
      const VerificationMeta('originDevice');
  @override
  late final GeneratedColumn<String> originDevice = GeneratedColumn<String>(
      'origin_device', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        entityType,
        entityIdLocal,
        entityIdRemote,
        operation,
        payload,
        status,
        retryCount,
        maxRetries,
        createdAt,
        lastAttemptAt,
        errorMessage,
        checksum,
        version,
        originDevice
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(Insertable<SyncQueueData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id_local')) {
      context.handle(
          _entityIdLocalMeta,
          entityIdLocal.isAcceptableOrUnknown(
              data['entity_id_local']!, _entityIdLocalMeta));
    } else if (isInserting) {
      context.missing(_entityIdLocalMeta);
    }
    if (data.containsKey('entity_id_remote')) {
      context.handle(
          _entityIdRemoteMeta,
          entityIdRemote.isAcceptableOrUnknown(
              data['entity_id_remote']!, _entityIdRemoteMeta));
    }
    if (data.containsKey('operation')) {
      context.handle(_operationMeta,
          operation.isAcceptableOrUnknown(data['operation']!, _operationMeta));
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(_payloadMeta,
          payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta));
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('retry_count')) {
      context.handle(
          _retryCountMeta,
          retryCount.isAcceptableOrUnknown(
              data['retry_count']!, _retryCountMeta));
    }
    if (data.containsKey('max_retries')) {
      context.handle(
          _maxRetriesMeta,
          maxRetries.isAcceptableOrUnknown(
              data['max_retries']!, _maxRetriesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_attempt_at')) {
      context.handle(
          _lastAttemptAtMeta,
          lastAttemptAt.isAcceptableOrUnknown(
              data['last_attempt_at']!, _lastAttemptAtMeta));
    }
    if (data.containsKey('error_message')) {
      context.handle(
          _errorMessageMeta,
          errorMessage.isAcceptableOrUnknown(
              data['error_message']!, _errorMessageMeta));
    }
    if (data.containsKey('checksum')) {
      context.handle(_checksumMeta,
          checksum.isAcceptableOrUnknown(data['checksum']!, _checksumMeta));
    } else if (isInserting) {
      context.missing(_checksumMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('origin_device')) {
      context.handle(
          _originDeviceMeta,
          originDevice.isAcceptableOrUnknown(
              data['origin_device']!, _originDeviceMeta));
    } else if (isInserting) {
      context.missing(_originDeviceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      entityIdLocal: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}entity_id_local'])!,
      entityIdRemote: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}entity_id_remote']),
      operation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}operation'])!,
      payload: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payload'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      retryCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}retry_count'])!,
      maxRetries: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_retries'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_at'])!,
      lastAttemptAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_attempt_at']),
      errorMessage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}error_message']),
      checksum: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}checksum'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}version'])!,
      originDevice: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}origin_device'])!,
    );
  }

  @override
  $SyncQueueTable createAlias(String alias) {
    return $SyncQueueTable(attachedDatabase, alias);
  }
}

class SyncQueueData extends DataClass implements Insertable<SyncQueueData> {
  final int id;
  final String entityType;
  final String entityIdLocal;
  final int? entityIdRemote;
  final String operation;
  final String payload;
  final String status;
  final int retryCount;
  final int maxRetries;
  final String createdAt;
  final String? lastAttemptAt;
  final String? errorMessage;
  final String checksum;
  final int version;
  final String originDevice;
  const SyncQueueData(
      {required this.id,
      required this.entityType,
      required this.entityIdLocal,
      this.entityIdRemote,
      required this.operation,
      required this.payload,
      required this.status,
      required this.retryCount,
      required this.maxRetries,
      required this.createdAt,
      this.lastAttemptAt,
      this.errorMessage,
      required this.checksum,
      required this.version,
      required this.originDevice});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id_local'] = Variable<String>(entityIdLocal);
    if (!nullToAbsent || entityIdRemote != null) {
      map['entity_id_remote'] = Variable<int>(entityIdRemote);
    }
    map['operation'] = Variable<String>(operation);
    map['payload'] = Variable<String>(payload);
    map['status'] = Variable<String>(status);
    map['retry_count'] = Variable<int>(retryCount);
    map['max_retries'] = Variable<int>(maxRetries);
    map['created_at'] = Variable<String>(createdAt);
    if (!nullToAbsent || lastAttemptAt != null) {
      map['last_attempt_at'] = Variable<String>(lastAttemptAt);
    }
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    map['checksum'] = Variable<String>(checksum);
    map['version'] = Variable<int>(version);
    map['origin_device'] = Variable<String>(originDevice);
    return map;
  }

  SyncQueueCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityIdLocal: Value(entityIdLocal),
      entityIdRemote: entityIdRemote == null && nullToAbsent
          ? const Value.absent()
          : Value(entityIdRemote),
      operation: Value(operation),
      payload: Value(payload),
      status: Value(status),
      retryCount: Value(retryCount),
      maxRetries: Value(maxRetries),
      createdAt: Value(createdAt),
      lastAttemptAt: lastAttemptAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastAttemptAt),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
      checksum: Value(checksum),
      version: Value(version),
      originDevice: Value(originDevice),
    );
  }

  factory SyncQueueData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueData(
      id: serializer.fromJson<int>(json['id']),
      entityType: serializer.fromJson<String>(json['entityType']),
      entityIdLocal: serializer.fromJson<String>(json['entityIdLocal']),
      entityIdRemote: serializer.fromJson<int?>(json['entityIdRemote']),
      operation: serializer.fromJson<String>(json['operation']),
      payload: serializer.fromJson<String>(json['payload']),
      status: serializer.fromJson<String>(json['status']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      maxRetries: serializer.fromJson<int>(json['maxRetries']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      lastAttemptAt: serializer.fromJson<String?>(json['lastAttemptAt']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
      checksum: serializer.fromJson<String>(json['checksum']),
      version: serializer.fromJson<int>(json['version']),
      originDevice: serializer.fromJson<String>(json['originDevice']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityIdLocal': serializer.toJson<String>(entityIdLocal),
      'entityIdRemote': serializer.toJson<int?>(entityIdRemote),
      'operation': serializer.toJson<String>(operation),
      'payload': serializer.toJson<String>(payload),
      'status': serializer.toJson<String>(status),
      'retryCount': serializer.toJson<int>(retryCount),
      'maxRetries': serializer.toJson<int>(maxRetries),
      'createdAt': serializer.toJson<String>(createdAt),
      'lastAttemptAt': serializer.toJson<String?>(lastAttemptAt),
      'errorMessage': serializer.toJson<String?>(errorMessage),
      'checksum': serializer.toJson<String>(checksum),
      'version': serializer.toJson<int>(version),
      'originDevice': serializer.toJson<String>(originDevice),
    };
  }

  SyncQueueData copyWith(
          {int? id,
          String? entityType,
          String? entityIdLocal,
          Value<int?> entityIdRemote = const Value.absent(),
          String? operation,
          String? payload,
          String? status,
          int? retryCount,
          int? maxRetries,
          String? createdAt,
          Value<String?> lastAttemptAt = const Value.absent(),
          Value<String?> errorMessage = const Value.absent(),
          String? checksum,
          int? version,
          String? originDevice}) =>
      SyncQueueData(
        id: id ?? this.id,
        entityType: entityType ?? this.entityType,
        entityIdLocal: entityIdLocal ?? this.entityIdLocal,
        entityIdRemote:
            entityIdRemote.present ? entityIdRemote.value : this.entityIdRemote,
        operation: operation ?? this.operation,
        payload: payload ?? this.payload,
        status: status ?? this.status,
        retryCount: retryCount ?? this.retryCount,
        maxRetries: maxRetries ?? this.maxRetries,
        createdAt: createdAt ?? this.createdAt,
        lastAttemptAt:
            lastAttemptAt.present ? lastAttemptAt.value : this.lastAttemptAt,
        errorMessage:
            errorMessage.present ? errorMessage.value : this.errorMessage,
        checksum: checksum ?? this.checksum,
        version: version ?? this.version,
        originDevice: originDevice ?? this.originDevice,
      );
  SyncQueueData copyWithCompanion(SyncQueueCompanion data) {
    return SyncQueueData(
      id: data.id.present ? data.id.value : this.id,
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      entityIdLocal: data.entityIdLocal.present
          ? data.entityIdLocal.value
          : this.entityIdLocal,
      entityIdRemote: data.entityIdRemote.present
          ? data.entityIdRemote.value
          : this.entityIdRemote,
      operation: data.operation.present ? data.operation.value : this.operation,
      payload: data.payload.present ? data.payload.value : this.payload,
      status: data.status.present ? data.status.value : this.status,
      retryCount:
          data.retryCount.present ? data.retryCount.value : this.retryCount,
      maxRetries:
          data.maxRetries.present ? data.maxRetries.value : this.maxRetries,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastAttemptAt: data.lastAttemptAt.present
          ? data.lastAttemptAt.value
          : this.lastAttemptAt,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
      checksum: data.checksum.present ? data.checksum.value : this.checksum,
      version: data.version.present ? data.version.value : this.version,
      originDevice: data.originDevice.present
          ? data.originDevice.value
          : this.originDevice,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueData(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityIdLocal: $entityIdLocal, ')
          ..write('entityIdRemote: $entityIdRemote, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('maxRetries: $maxRetries, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastAttemptAt: $lastAttemptAt, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('checksum: $checksum, ')
          ..write('version: $version, ')
          ..write('originDevice: $originDevice')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      entityType,
      entityIdLocal,
      entityIdRemote,
      operation,
      payload,
      status,
      retryCount,
      maxRetries,
      createdAt,
      lastAttemptAt,
      errorMessage,
      checksum,
      version,
      originDevice);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueData &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityIdLocal == this.entityIdLocal &&
          other.entityIdRemote == this.entityIdRemote &&
          other.operation == this.operation &&
          other.payload == this.payload &&
          other.status == this.status &&
          other.retryCount == this.retryCount &&
          other.maxRetries == this.maxRetries &&
          other.createdAt == this.createdAt &&
          other.lastAttemptAt == this.lastAttemptAt &&
          other.errorMessage == this.errorMessage &&
          other.checksum == this.checksum &&
          other.version == this.version &&
          other.originDevice == this.originDevice);
}

class SyncQueueCompanion extends UpdateCompanion<SyncQueueData> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<String> entityIdLocal;
  final Value<int?> entityIdRemote;
  final Value<String> operation;
  final Value<String> payload;
  final Value<String> status;
  final Value<int> retryCount;
  final Value<int> maxRetries;
  final Value<String> createdAt;
  final Value<String?> lastAttemptAt;
  final Value<String?> errorMessage;
  final Value<String> checksum;
  final Value<int> version;
  final Value<String> originDevice;
  const SyncQueueCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityIdLocal = const Value.absent(),
    this.entityIdRemote = const Value.absent(),
    this.operation = const Value.absent(),
    this.payload = const Value.absent(),
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.maxRetries = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastAttemptAt = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.checksum = const Value.absent(),
    this.version = const Value.absent(),
    this.originDevice = const Value.absent(),
  });
  SyncQueueCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required String entityIdLocal,
    this.entityIdRemote = const Value.absent(),
    required String operation,
    required String payload,
    this.status = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.maxRetries = const Value.absent(),
    required String createdAt,
    this.lastAttemptAt = const Value.absent(),
    this.errorMessage = const Value.absent(),
    required String checksum,
    this.version = const Value.absent(),
    required String originDevice,
  })  : entityType = Value(entityType),
        entityIdLocal = Value(entityIdLocal),
        operation = Value(operation),
        payload = Value(payload),
        createdAt = Value(createdAt),
        checksum = Value(checksum),
        originDevice = Value(originDevice);
  static Insertable<SyncQueueData> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<String>? entityIdLocal,
    Expression<int>? entityIdRemote,
    Expression<String>? operation,
    Expression<String>? payload,
    Expression<String>? status,
    Expression<int>? retryCount,
    Expression<int>? maxRetries,
    Expression<String>? createdAt,
    Expression<String>? lastAttemptAt,
    Expression<String>? errorMessage,
    Expression<String>? checksum,
    Expression<int>? version,
    Expression<String>? originDevice,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityIdLocal != null) 'entity_id_local': entityIdLocal,
      if (entityIdRemote != null) 'entity_id_remote': entityIdRemote,
      if (operation != null) 'operation': operation,
      if (payload != null) 'payload': payload,
      if (status != null) 'status': status,
      if (retryCount != null) 'retry_count': retryCount,
      if (maxRetries != null) 'max_retries': maxRetries,
      if (createdAt != null) 'created_at': createdAt,
      if (lastAttemptAt != null) 'last_attempt_at': lastAttemptAt,
      if (errorMessage != null) 'error_message': errorMessage,
      if (checksum != null) 'checksum': checksum,
      if (version != null) 'version': version,
      if (originDevice != null) 'origin_device': originDevice,
    });
  }

  SyncQueueCompanion copyWith(
      {Value<int>? id,
      Value<String>? entityType,
      Value<String>? entityIdLocal,
      Value<int?>? entityIdRemote,
      Value<String>? operation,
      Value<String>? payload,
      Value<String>? status,
      Value<int>? retryCount,
      Value<int>? maxRetries,
      Value<String>? createdAt,
      Value<String?>? lastAttemptAt,
      Value<String?>? errorMessage,
      Value<String>? checksum,
      Value<int>? version,
      Value<String>? originDevice}) {
    return SyncQueueCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityIdLocal: entityIdLocal ?? this.entityIdLocal,
      entityIdRemote: entityIdRemote ?? this.entityIdRemote,
      operation: operation ?? this.operation,
      payload: payload ?? this.payload,
      status: status ?? this.status,
      retryCount: retryCount ?? this.retryCount,
      maxRetries: maxRetries ?? this.maxRetries,
      createdAt: createdAt ?? this.createdAt,
      lastAttemptAt: lastAttemptAt ?? this.lastAttemptAt,
      errorMessage: errorMessage ?? this.errorMessage,
      checksum: checksum ?? this.checksum,
      version: version ?? this.version,
      originDevice: originDevice ?? this.originDevice,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityIdLocal.present) {
      map['entity_id_local'] = Variable<String>(entityIdLocal.value);
    }
    if (entityIdRemote.present) {
      map['entity_id_remote'] = Variable<int>(entityIdRemote.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (maxRetries.present) {
      map['max_retries'] = Variable<int>(maxRetries.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (lastAttemptAt.present) {
      map['last_attempt_at'] = Variable<String>(lastAttemptAt.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    if (checksum.present) {
      map['checksum'] = Variable<String>(checksum.value);
    }
    if (version.present) {
      map['version'] = Variable<int>(version.value);
    }
    if (originDevice.present) {
      map['origin_device'] = Variable<String>(originDevice.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueCompanion(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityIdLocal: $entityIdLocal, ')
          ..write('entityIdRemote: $entityIdRemote, ')
          ..write('operation: $operation, ')
          ..write('payload: $payload, ')
          ..write('status: $status, ')
          ..write('retryCount: $retryCount, ')
          ..write('maxRetries: $maxRetries, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastAttemptAt: $lastAttemptAt, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('checksum: $checksum, ')
          ..write('version: $version, ')
          ..write('originDevice: $originDevice')
          ..write(')'))
        .toString();
  }
}

class $SyncLogTable extends SyncLog with TableInfo<$SyncLogTable, SyncLogData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncLogTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _syncIdMeta = const VerificationMeta('syncId');
  @override
  late final GeneratedColumn<String> syncId = GeneratedColumn<String>(
      'sync_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<String> startedAt = GeneratedColumn<String>(
      'started_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _finishedAtMeta =
      const VerificationMeta('finishedAt');
  @override
  late final GeneratedColumn<String> finishedAt = GeneratedColumn<String>(
      'finished_at', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _totalItemsMeta =
      const VerificationMeta('totalItems');
  @override
  late final GeneratedColumn<int> totalItems = GeneratedColumn<int>(
      'total_items', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _successMeta =
      const VerificationMeta('success');
  @override
  late final GeneratedColumn<int> success = GeneratedColumn<int>(
      'success', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _conflictsMeta =
      const VerificationMeta('conflicts');
  @override
  late final GeneratedColumn<int> conflicts = GeneratedColumn<int>(
      'conflicts', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _errorsMeta = const VerificationMeta('errors');
  @override
  late final GeneratedColumn<int> errors = GeneratedColumn<int>(
      'errors', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        syncId,
        startedAt,
        finishedAt,
        totalItems,
        success,
        conflicts,
        errors,
        status
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_log';
  @override
  VerificationContext validateIntegrity(Insertable<SyncLogData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sync_id')) {
      context.handle(_syncIdMeta,
          syncId.isAcceptableOrUnknown(data['sync_id']!, _syncIdMeta));
    } else if (isInserting) {
      context.missing(_syncIdMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(_startedAtMeta,
          startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta));
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('finished_at')) {
      context.handle(
          _finishedAtMeta,
          finishedAt.isAcceptableOrUnknown(
              data['finished_at']!, _finishedAtMeta));
    }
    if (data.containsKey('total_items')) {
      context.handle(
          _totalItemsMeta,
          totalItems.isAcceptableOrUnknown(
              data['total_items']!, _totalItemsMeta));
    }
    if (data.containsKey('success')) {
      context.handle(_successMeta,
          success.isAcceptableOrUnknown(data['success']!, _successMeta));
    }
    if (data.containsKey('conflicts')) {
      context.handle(_conflictsMeta,
          conflicts.isAcceptableOrUnknown(data['conflicts']!, _conflictsMeta));
    }
    if (data.containsKey('errors')) {
      context.handle(_errorsMeta,
          errors.isAcceptableOrUnknown(data['errors']!, _errorsMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncLogData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncLogData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      syncId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_id'])!,
      startedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}started_at'])!,
      finishedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}finished_at']),
      totalItems: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total_items'])!,
      success: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}success'])!,
      conflicts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}conflicts'])!,
      errors: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}errors'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $SyncLogTable createAlias(String alias) {
    return $SyncLogTable(attachedDatabase, alias);
  }
}

class SyncLogData extends DataClass implements Insertable<SyncLogData> {
  final int id;
  final String syncId;
  final String startedAt;
  final String? finishedAt;
  final int totalItems;
  final int success;
  final int conflicts;
  final int errors;
  final String status;
  const SyncLogData(
      {required this.id,
      required this.syncId,
      required this.startedAt,
      this.finishedAt,
      required this.totalItems,
      required this.success,
      required this.conflicts,
      required this.errors,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sync_id'] = Variable<String>(syncId);
    map['started_at'] = Variable<String>(startedAt);
    if (!nullToAbsent || finishedAt != null) {
      map['finished_at'] = Variable<String>(finishedAt);
    }
    map['total_items'] = Variable<int>(totalItems);
    map['success'] = Variable<int>(success);
    map['conflicts'] = Variable<int>(conflicts);
    map['errors'] = Variable<int>(errors);
    map['status'] = Variable<String>(status);
    return map;
  }

  SyncLogCompanion toCompanion(bool nullToAbsent) {
    return SyncLogCompanion(
      id: Value(id),
      syncId: Value(syncId),
      startedAt: Value(startedAt),
      finishedAt: finishedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(finishedAt),
      totalItems: Value(totalItems),
      success: Value(success),
      conflicts: Value(conflicts),
      errors: Value(errors),
      status: Value(status),
    );
  }

  factory SyncLogData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncLogData(
      id: serializer.fromJson<int>(json['id']),
      syncId: serializer.fromJson<String>(json['syncId']),
      startedAt: serializer.fromJson<String>(json['startedAt']),
      finishedAt: serializer.fromJson<String?>(json['finishedAt']),
      totalItems: serializer.fromJson<int>(json['totalItems']),
      success: serializer.fromJson<int>(json['success']),
      conflicts: serializer.fromJson<int>(json['conflicts']),
      errors: serializer.fromJson<int>(json['errors']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'syncId': serializer.toJson<String>(syncId),
      'startedAt': serializer.toJson<String>(startedAt),
      'finishedAt': serializer.toJson<String?>(finishedAt),
      'totalItems': serializer.toJson<int>(totalItems),
      'success': serializer.toJson<int>(success),
      'conflicts': serializer.toJson<int>(conflicts),
      'errors': serializer.toJson<int>(errors),
      'status': serializer.toJson<String>(status),
    };
  }

  SyncLogData copyWith(
          {int? id,
          String? syncId,
          String? startedAt,
          Value<String?> finishedAt = const Value.absent(),
          int? totalItems,
          int? success,
          int? conflicts,
          int? errors,
          String? status}) =>
      SyncLogData(
        id: id ?? this.id,
        syncId: syncId ?? this.syncId,
        startedAt: startedAt ?? this.startedAt,
        finishedAt: finishedAt.present ? finishedAt.value : this.finishedAt,
        totalItems: totalItems ?? this.totalItems,
        success: success ?? this.success,
        conflicts: conflicts ?? this.conflicts,
        errors: errors ?? this.errors,
        status: status ?? this.status,
      );
  SyncLogData copyWithCompanion(SyncLogCompanion data) {
    return SyncLogData(
      id: data.id.present ? data.id.value : this.id,
      syncId: data.syncId.present ? data.syncId.value : this.syncId,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      finishedAt:
          data.finishedAt.present ? data.finishedAt.value : this.finishedAt,
      totalItems:
          data.totalItems.present ? data.totalItems.value : this.totalItems,
      success: data.success.present ? data.success.value : this.success,
      conflicts: data.conflicts.present ? data.conflicts.value : this.conflicts,
      errors: data.errors.present ? data.errors.value : this.errors,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncLogData(')
          ..write('id: $id, ')
          ..write('syncId: $syncId, ')
          ..write('startedAt: $startedAt, ')
          ..write('finishedAt: $finishedAt, ')
          ..write('totalItems: $totalItems, ')
          ..write('success: $success, ')
          ..write('conflicts: $conflicts, ')
          ..write('errors: $errors, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, syncId, startedAt, finishedAt, totalItems,
      success, conflicts, errors, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncLogData &&
          other.id == this.id &&
          other.syncId == this.syncId &&
          other.startedAt == this.startedAt &&
          other.finishedAt == this.finishedAt &&
          other.totalItems == this.totalItems &&
          other.success == this.success &&
          other.conflicts == this.conflicts &&
          other.errors == this.errors &&
          other.status == this.status);
}

class SyncLogCompanion extends UpdateCompanion<SyncLogData> {
  final Value<int> id;
  final Value<String> syncId;
  final Value<String> startedAt;
  final Value<String?> finishedAt;
  final Value<int> totalItems;
  final Value<int> success;
  final Value<int> conflicts;
  final Value<int> errors;
  final Value<String> status;
  const SyncLogCompanion({
    this.id = const Value.absent(),
    this.syncId = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.finishedAt = const Value.absent(),
    this.totalItems = const Value.absent(),
    this.success = const Value.absent(),
    this.conflicts = const Value.absent(),
    this.errors = const Value.absent(),
    this.status = const Value.absent(),
  });
  SyncLogCompanion.insert({
    this.id = const Value.absent(),
    required String syncId,
    required String startedAt,
    this.finishedAt = const Value.absent(),
    this.totalItems = const Value.absent(),
    this.success = const Value.absent(),
    this.conflicts = const Value.absent(),
    this.errors = const Value.absent(),
    required String status,
  })  : syncId = Value(syncId),
        startedAt = Value(startedAt),
        status = Value(status);
  static Insertable<SyncLogData> custom({
    Expression<int>? id,
    Expression<String>? syncId,
    Expression<String>? startedAt,
    Expression<String>? finishedAt,
    Expression<int>? totalItems,
    Expression<int>? success,
    Expression<int>? conflicts,
    Expression<int>? errors,
    Expression<String>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (syncId != null) 'sync_id': syncId,
      if (startedAt != null) 'started_at': startedAt,
      if (finishedAt != null) 'finished_at': finishedAt,
      if (totalItems != null) 'total_items': totalItems,
      if (success != null) 'success': success,
      if (conflicts != null) 'conflicts': conflicts,
      if (errors != null) 'errors': errors,
      if (status != null) 'status': status,
    });
  }

  SyncLogCompanion copyWith(
      {Value<int>? id,
      Value<String>? syncId,
      Value<String>? startedAt,
      Value<String?>? finishedAt,
      Value<int>? totalItems,
      Value<int>? success,
      Value<int>? conflicts,
      Value<int>? errors,
      Value<String>? status}) {
    return SyncLogCompanion(
      id: id ?? this.id,
      syncId: syncId ?? this.syncId,
      startedAt: startedAt ?? this.startedAt,
      finishedAt: finishedAt ?? this.finishedAt,
      totalItems: totalItems ?? this.totalItems,
      success: success ?? this.success,
      conflicts: conflicts ?? this.conflicts,
      errors: errors ?? this.errors,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (syncId.present) {
      map['sync_id'] = Variable<String>(syncId.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<String>(startedAt.value);
    }
    if (finishedAt.present) {
      map['finished_at'] = Variable<String>(finishedAt.value);
    }
    if (totalItems.present) {
      map['total_items'] = Variable<int>(totalItems.value);
    }
    if (success.present) {
      map['success'] = Variable<int>(success.value);
    }
    if (conflicts.present) {
      map['conflicts'] = Variable<int>(conflicts.value);
    }
    if (errors.present) {
      map['errors'] = Variable<int>(errors.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncLogCompanion(')
          ..write('id: $id, ')
          ..write('syncId: $syncId, ')
          ..write('startedAt: $startedAt, ')
          ..write('finishedAt: $finishedAt, ')
          ..write('totalItems: $totalItems, ')
          ..write('success: $success, ')
          ..write('conflicts: $conflicts, ')
          ..write('errors: $errors, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $IdMappingTable extends IdMapping
    with TableInfo<$IdMappingTable, IdMappingData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IdMappingTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _localUuidMeta =
      const VerificationMeta('localUuid');
  @override
  late final GeneratedColumn<String> localUuid = GeneratedColumn<String>(
      'local_uuid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<int> remoteId = GeneratedColumn<int>(
      'remote_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _entityTypeMeta =
      const VerificationMeta('entityType');
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
      'entity_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _syncedAtMeta =
      const VerificationMeta('syncedAt');
  @override
  late final GeneratedColumn<String> syncedAt = GeneratedColumn<String>(
      'synced_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [localUuid, remoteId, entityType, syncedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'id_mapping';
  @override
  VerificationContext validateIntegrity(Insertable<IdMappingData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('local_uuid')) {
      context.handle(_localUuidMeta,
          localUuid.isAcceptableOrUnknown(data['local_uuid']!, _localUuidMeta));
    } else if (isInserting) {
      context.missing(_localUuidMeta);
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    } else if (isInserting) {
      context.missing(_remoteIdMeta);
    }
    if (data.containsKey('entity_type')) {
      context.handle(
          _entityTypeMeta,
          entityType.isAcceptableOrUnknown(
              data['entity_type']!, _entityTypeMeta));
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(_syncedAtMeta,
          syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta));
    } else if (isInserting) {
      context.missing(_syncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  IdMappingData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IdMappingData(
      localUuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}local_uuid'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}remote_id'])!,
      entityType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_type'])!,
      syncedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}synced_at'])!,
    );
  }

  @override
  $IdMappingTable createAlias(String alias) {
    return $IdMappingTable(attachedDatabase, alias);
  }
}

class IdMappingData extends DataClass implements Insertable<IdMappingData> {
  final String localUuid;
  final int remoteId;
  final String entityType;
  final String syncedAt;
  const IdMappingData(
      {required this.localUuid,
      required this.remoteId,
      required this.entityType,
      required this.syncedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['local_uuid'] = Variable<String>(localUuid);
    map['remote_id'] = Variable<int>(remoteId);
    map['entity_type'] = Variable<String>(entityType);
    map['synced_at'] = Variable<String>(syncedAt);
    return map;
  }

  IdMappingCompanion toCompanion(bool nullToAbsent) {
    return IdMappingCompanion(
      localUuid: Value(localUuid),
      remoteId: Value(remoteId),
      entityType: Value(entityType),
      syncedAt: Value(syncedAt),
    );
  }

  factory IdMappingData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IdMappingData(
      localUuid: serializer.fromJson<String>(json['localUuid']),
      remoteId: serializer.fromJson<int>(json['remoteId']),
      entityType: serializer.fromJson<String>(json['entityType']),
      syncedAt: serializer.fromJson<String>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'localUuid': serializer.toJson<String>(localUuid),
      'remoteId': serializer.toJson<int>(remoteId),
      'entityType': serializer.toJson<String>(entityType),
      'syncedAt': serializer.toJson<String>(syncedAt),
    };
  }

  IdMappingData copyWith(
          {String? localUuid,
          int? remoteId,
          String? entityType,
          String? syncedAt}) =>
      IdMappingData(
        localUuid: localUuid ?? this.localUuid,
        remoteId: remoteId ?? this.remoteId,
        entityType: entityType ?? this.entityType,
        syncedAt: syncedAt ?? this.syncedAt,
      );
  IdMappingData copyWithCompanion(IdMappingCompanion data) {
    return IdMappingData(
      localUuid: data.localUuid.present ? data.localUuid.value : this.localUuid,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      entityType:
          data.entityType.present ? data.entityType.value : this.entityType,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IdMappingData(')
          ..write('localUuid: $localUuid, ')
          ..write('remoteId: $remoteId, ')
          ..write('entityType: $entityType, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(localUuid, remoteId, entityType, syncedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IdMappingData &&
          other.localUuid == this.localUuid &&
          other.remoteId == this.remoteId &&
          other.entityType == this.entityType &&
          other.syncedAt == this.syncedAt);
}

class IdMappingCompanion extends UpdateCompanion<IdMappingData> {
  final Value<String> localUuid;
  final Value<int> remoteId;
  final Value<String> entityType;
  final Value<String> syncedAt;
  final Value<int> rowid;
  const IdMappingCompanion({
    this.localUuid = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.entityType = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IdMappingCompanion.insert({
    required String localUuid,
    required int remoteId,
    required String entityType,
    required String syncedAt,
    this.rowid = const Value.absent(),
  })  : localUuid = Value(localUuid),
        remoteId = Value(remoteId),
        entityType = Value(entityType),
        syncedAt = Value(syncedAt);
  static Insertable<IdMappingData> custom({
    Expression<String>? localUuid,
    Expression<int>? remoteId,
    Expression<String>? entityType,
    Expression<String>? syncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (localUuid != null) 'local_uuid': localUuid,
      if (remoteId != null) 'remote_id': remoteId,
      if (entityType != null) 'entity_type': entityType,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IdMappingCompanion copyWith(
      {Value<String>? localUuid,
      Value<int>? remoteId,
      Value<String>? entityType,
      Value<String>? syncedAt,
      Value<int>? rowid}) {
    return IdMappingCompanion(
      localUuid: localUuid ?? this.localUuid,
      remoteId: remoteId ?? this.remoteId,
      entityType: entityType ?? this.entityType,
      syncedAt: syncedAt ?? this.syncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (localUuid.present) {
      map['local_uuid'] = Variable<String>(localUuid.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<int>(remoteId.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<String>(syncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IdMappingCompanion(')
          ..write('localUuid: $localUuid, ')
          ..write('remoteId: $remoteId, ')
          ..write('entityType: $entityType, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncMetadataTable extends SyncMetadata
    with TableInfo<$SyncMetadataTable, SyncMetadataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String> updatedAt = GeneratedColumn<String>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_metadata';
  @override
  VerificationContext validateIntegrity(Insertable<SyncMetadataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SyncMetadataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetadataData(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $SyncMetadataTable createAlias(String alias) {
    return $SyncMetadataTable(attachedDatabase, alias);
  }
}

class SyncMetadataData extends DataClass
    implements Insertable<SyncMetadataData> {
  final String key;
  final String value;
  final String updatedAt;
  const SyncMetadataData(
      {required this.key, required this.value, required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  SyncMetadataCompanion toCompanion(bool nullToAbsent) {
    return SyncMetadataCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory SyncMetadataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetadataData(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  SyncMetadataData copyWith({String? key, String? value, String? updatedAt}) =>
      SyncMetadataData(
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  SyncMetadataData copyWithCompanion(SyncMetadataCompanion data) {
    return SyncMetadataData(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataData(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncMetadataData &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class SyncMetadataCompanion extends UpdateCompanion<SyncMetadataData> {
  final Value<String> key;
  final Value<String> value;
  final Value<String> updatedAt;
  final Value<int> rowid;
  const SyncMetadataCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncMetadataCompanion.insert({
    required String key,
    required String value,
    required String updatedAt,
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        value = Value(value),
        updatedAt = Value(updatedAt);
  static Insertable<SyncMetadataData> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<String>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncMetadataCompanion copyWith(
      {Value<String>? key,
      Value<String>? value,
      Value<String>? updatedAt,
      Value<int>? rowid}) {
    return SyncMetadataCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$DeFuloDatabase extends GeneratedDatabase {
  _$DeFuloDatabase(QueryExecutor e) : super(e);
  $DeFuloDatabaseManager get managers => $DeFuloDatabaseManager(this);
  late final $UsuariosLocalTable usuariosLocal = $UsuariosLocalTable(this);
  late final $FazendasLocalTable fazendasLocal = $FazendasLocalTable(this);
  late final $TalhoesLocalTable talhoesLocal = $TalhoesLocalTable(this);
  late final $EventosManejosLocalTable eventosManejosLocal =
      $EventosManejosLocalTable(this);
  late final $SyncQueueTable syncQueue = $SyncQueueTable(this);
  late final $SyncLogTable syncLog = $SyncLogTable(this);
  late final $IdMappingTable idMapping = $IdMappingTable(this);
  late final $SyncMetadataTable syncMetadata = $SyncMetadataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        usuariosLocal,
        fazendasLocal,
        talhoesLocal,
        eventosManejosLocal,
        syncQueue,
        syncLog,
        idMapping,
        syncMetadata
      ];
}

typedef $$UsuariosLocalTableCreateCompanionBuilder = UsuariosLocalCompanion
    Function({
  required int id,
  required String email,
  required String nome,
  required String perfil,
  required String cpf,
  Value<String?> telefone,
  required String creatdAt,
  required String updatedAt,
  Value<int> rowid,
});
typedef $$UsuariosLocalTableUpdateCompanionBuilder = UsuariosLocalCompanion
    Function({
  Value<int> id,
  Value<String> email,
  Value<String> nome,
  Value<String> perfil,
  Value<String> cpf,
  Value<String?> telefone,
  Value<String> creatdAt,
  Value<String> updatedAt,
  Value<int> rowid,
});

final class $$UsuariosLocalTableReferences extends BaseReferences<
    _$DeFuloDatabase, $UsuariosLocalTable, UsuariosLocalData> {
  $$UsuariosLocalTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$FazendasLocalTable, List<FazendasLocalData>>
      _fazendasLocalRefsTable(_$DeFuloDatabase db) =>
          MultiTypedResultKey.fromTable(db.fazendasLocal,
              aliasName: $_aliasNameGenerator(
                  db.usuariosLocal.id, db.fazendasLocal.produtorId));

  $$FazendasLocalTableProcessedTableManager get fazendasLocalRefs {
    final manager = $$FazendasLocalTableTableManager($_db, $_db.fazendasLocal)
        .filter((f) => f.produtorId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_fazendasLocalRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UsuariosLocalTableFilterComposer
    extends Composer<_$DeFuloDatabase, $UsuariosLocalTable> {
  $$UsuariosLocalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get perfil => $composableBuilder(
      column: $table.perfil, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cpf => $composableBuilder(
      column: $table.cpf, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get telefone => $composableBuilder(
      column: $table.telefone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get creatdAt => $composableBuilder(
      column: $table.creatdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> fazendasLocalRefs(
      Expression<bool> Function($$FazendasLocalTableFilterComposer f) f) {
    final $$FazendasLocalTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.fazendasLocal,
        getReferencedColumn: (t) => t.produtorId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FazendasLocalTableFilterComposer(
              $db: $db,
              $table: $db.fazendasLocal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsuariosLocalTableOrderingComposer
    extends Composer<_$DeFuloDatabase, $UsuariosLocalTable> {
  $$UsuariosLocalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get perfil => $composableBuilder(
      column: $table.perfil, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cpf => $composableBuilder(
      column: $table.cpf, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get telefone => $composableBuilder(
      column: $table.telefone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get creatdAt => $composableBuilder(
      column: $table.creatdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$UsuariosLocalTableAnnotationComposer
    extends Composer<_$DeFuloDatabase, $UsuariosLocalTable> {
  $$UsuariosLocalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get perfil =>
      $composableBuilder(column: $table.perfil, builder: (column) => column);

  GeneratedColumn<String> get cpf =>
      $composableBuilder(column: $table.cpf, builder: (column) => column);

  GeneratedColumn<String> get telefone =>
      $composableBuilder(column: $table.telefone, builder: (column) => column);

  GeneratedColumn<String> get creatdAt =>
      $composableBuilder(column: $table.creatdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> fazendasLocalRefs<T extends Object>(
      Expression<T> Function($$FazendasLocalTableAnnotationComposer a) f) {
    final $$FazendasLocalTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.fazendasLocal,
        getReferencedColumn: (t) => t.produtorId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FazendasLocalTableAnnotationComposer(
              $db: $db,
              $table: $db.fazendasLocal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsuariosLocalTableTableManager extends RootTableManager<
    _$DeFuloDatabase,
    $UsuariosLocalTable,
    UsuariosLocalData,
    $$UsuariosLocalTableFilterComposer,
    $$UsuariosLocalTableOrderingComposer,
    $$UsuariosLocalTableAnnotationComposer,
    $$UsuariosLocalTableCreateCompanionBuilder,
    $$UsuariosLocalTableUpdateCompanionBuilder,
    (UsuariosLocalData, $$UsuariosLocalTableReferences),
    UsuariosLocalData,
    PrefetchHooks Function({bool fazendasLocalRefs})> {
  $$UsuariosLocalTableTableManager(
      _$DeFuloDatabase db, $UsuariosLocalTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsuariosLocalTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsuariosLocalTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsuariosLocalTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> nome = const Value.absent(),
            Value<String> perfil = const Value.absent(),
            Value<String> cpf = const Value.absent(),
            Value<String?> telefone = const Value.absent(),
            Value<String> creatdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsuariosLocalCompanion(
            id: id,
            email: email,
            nome: nome,
            perfil: perfil,
            cpf: cpf,
            telefone: telefone,
            creatdAt: creatdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String email,
            required String nome,
            required String perfil,
            required String cpf,
            Value<String?> telefone = const Value.absent(),
            required String creatdAt,
            required String updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              UsuariosLocalCompanion.insert(
            id: id,
            email: email,
            nome: nome,
            perfil: perfil,
            cpf: cpf,
            telefone: telefone,
            creatdAt: creatdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$UsuariosLocalTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({fazendasLocalRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (fazendasLocalRefs) db.fazendasLocal
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (fazendasLocalRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$UsuariosLocalTableReferences
                            ._fazendasLocalRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsuariosLocalTableReferences(db, table, p0)
                                .fazendasLocalRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.produtorId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UsuariosLocalTableProcessedTableManager = ProcessedTableManager<
    _$DeFuloDatabase,
    $UsuariosLocalTable,
    UsuariosLocalData,
    $$UsuariosLocalTableFilterComposer,
    $$UsuariosLocalTableOrderingComposer,
    $$UsuariosLocalTableAnnotationComposer,
    $$UsuariosLocalTableCreateCompanionBuilder,
    $$UsuariosLocalTableUpdateCompanionBuilder,
    (UsuariosLocalData, $$UsuariosLocalTableReferences),
    UsuariosLocalData,
    PrefetchHooks Function({bool fazendasLocalRefs})>;
typedef $$FazendasLocalTableCreateCompanionBuilder = FazendasLocalCompanion
    Function({
  required int id,
  required String nome,
  required String cnpj,
  required int produtorId,
  required String municipio,
  required String estado,
  required String areaTotal,
  required String createdAt,
  required String updatedAt,
  Value<int> rowid,
});
typedef $$FazendasLocalTableUpdateCompanionBuilder = FazendasLocalCompanion
    Function({
  Value<int> id,
  Value<String> nome,
  Value<String> cnpj,
  Value<int> produtorId,
  Value<String> municipio,
  Value<String> estado,
  Value<String> areaTotal,
  Value<String> createdAt,
  Value<String> updatedAt,
  Value<int> rowid,
});

final class $$FazendasLocalTableReferences extends BaseReferences<
    _$DeFuloDatabase, $FazendasLocalTable, FazendasLocalData> {
  $$FazendasLocalTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $UsuariosLocalTable _produtorIdTable(_$DeFuloDatabase db) =>
      db.usuariosLocal.createAlias($_aliasNameGenerator(
          db.fazendasLocal.produtorId, db.usuariosLocal.id));

  $$UsuariosLocalTableProcessedTableManager? get produtorId {
    if ($_item.produtorId == null) return null;
    final manager = $$UsuariosLocalTableTableManager($_db, $_db.usuariosLocal)
        .filter((f) => f.id($_item.produtorId!));
    final item = $_typedResult.readTableOrNull(_produtorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$TalhoesLocalTable, List<TalhoesLocalData>>
      _talhoesLocalRefsTable(_$DeFuloDatabase db) =>
          MultiTypedResultKey.fromTable(db.talhoesLocal,
              aliasName: $_aliasNameGenerator(
                  db.fazendasLocal.id, db.talhoesLocal.fazendasId));

  $$TalhoesLocalTableProcessedTableManager get talhoesLocalRefs {
    final manager = $$TalhoesLocalTableTableManager($_db, $_db.talhoesLocal)
        .filter((f) => f.fazendasId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_talhoesLocalRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$FazendasLocalTableFilterComposer
    extends Composer<_$DeFuloDatabase, $FazendasLocalTable> {
  $$FazendasLocalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cnpj => $composableBuilder(
      column: $table.cnpj, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get municipio => $composableBuilder(
      column: $table.municipio, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get estado => $composableBuilder(
      column: $table.estado, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get areaTotal => $composableBuilder(
      column: $table.areaTotal, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$UsuariosLocalTableFilterComposer get produtorId {
    final $$UsuariosLocalTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.produtorId,
        referencedTable: $db.usuariosLocal,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsuariosLocalTableFilterComposer(
              $db: $db,
              $table: $db.usuariosLocal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> talhoesLocalRefs(
      Expression<bool> Function($$TalhoesLocalTableFilterComposer f) f) {
    final $$TalhoesLocalTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.talhoesLocal,
        getReferencedColumn: (t) => t.fazendasId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TalhoesLocalTableFilterComposer(
              $db: $db,
              $table: $db.talhoesLocal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$FazendasLocalTableOrderingComposer
    extends Composer<_$DeFuloDatabase, $FazendasLocalTable> {
  $$FazendasLocalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cnpj => $composableBuilder(
      column: $table.cnpj, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get municipio => $composableBuilder(
      column: $table.municipio, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get estado => $composableBuilder(
      column: $table.estado, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get areaTotal => $composableBuilder(
      column: $table.areaTotal, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$UsuariosLocalTableOrderingComposer get produtorId {
    final $$UsuariosLocalTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.produtorId,
        referencedTable: $db.usuariosLocal,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsuariosLocalTableOrderingComposer(
              $db: $db,
              $table: $db.usuariosLocal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FazendasLocalTableAnnotationComposer
    extends Composer<_$DeFuloDatabase, $FazendasLocalTable> {
  $$FazendasLocalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get cnpj =>
      $composableBuilder(column: $table.cnpj, builder: (column) => column);

  GeneratedColumn<String> get municipio =>
      $composableBuilder(column: $table.municipio, builder: (column) => column);

  GeneratedColumn<String> get estado =>
      $composableBuilder(column: $table.estado, builder: (column) => column);

  GeneratedColumn<String> get areaTotal =>
      $composableBuilder(column: $table.areaTotal, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$UsuariosLocalTableAnnotationComposer get produtorId {
    final $$UsuariosLocalTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.produtorId,
        referencedTable: $db.usuariosLocal,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsuariosLocalTableAnnotationComposer(
              $db: $db,
              $table: $db.usuariosLocal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> talhoesLocalRefs<T extends Object>(
      Expression<T> Function($$TalhoesLocalTableAnnotationComposer a) f) {
    final $$TalhoesLocalTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.talhoesLocal,
        getReferencedColumn: (t) => t.fazendasId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TalhoesLocalTableAnnotationComposer(
              $db: $db,
              $table: $db.talhoesLocal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$FazendasLocalTableTableManager extends RootTableManager<
    _$DeFuloDatabase,
    $FazendasLocalTable,
    FazendasLocalData,
    $$FazendasLocalTableFilterComposer,
    $$FazendasLocalTableOrderingComposer,
    $$FazendasLocalTableAnnotationComposer,
    $$FazendasLocalTableCreateCompanionBuilder,
    $$FazendasLocalTableUpdateCompanionBuilder,
    (FazendasLocalData, $$FazendasLocalTableReferences),
    FazendasLocalData,
    PrefetchHooks Function({bool produtorId, bool talhoesLocalRefs})> {
  $$FazendasLocalTableTableManager(
      _$DeFuloDatabase db, $FazendasLocalTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FazendasLocalTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FazendasLocalTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FazendasLocalTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nome = const Value.absent(),
            Value<String> cnpj = const Value.absent(),
            Value<int> produtorId = const Value.absent(),
            Value<String> municipio = const Value.absent(),
            Value<String> estado = const Value.absent(),
            Value<String> areaTotal = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FazendasLocalCompanion(
            id: id,
            nome: nome,
            cnpj: cnpj,
            produtorId: produtorId,
            municipio: municipio,
            estado: estado,
            areaTotal: areaTotal,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String nome,
            required String cnpj,
            required int produtorId,
            required String municipio,
            required String estado,
            required String areaTotal,
            required String createdAt,
            required String updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              FazendasLocalCompanion.insert(
            id: id,
            nome: nome,
            cnpj: cnpj,
            produtorId: produtorId,
            municipio: municipio,
            estado: estado,
            areaTotal: areaTotal,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$FazendasLocalTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {produtorId = false, talhoesLocalRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (talhoesLocalRefs) db.talhoesLocal],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (produtorId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.produtorId,
                    referencedTable:
                        $$FazendasLocalTableReferences._produtorIdTable(db),
                    referencedColumn:
                        $$FazendasLocalTableReferences._produtorIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (talhoesLocalRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$FazendasLocalTableReferences
                            ._talhoesLocalRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$FazendasLocalTableReferences(db, table, p0)
                                .talhoesLocalRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.fazendasId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$FazendasLocalTableProcessedTableManager = ProcessedTableManager<
    _$DeFuloDatabase,
    $FazendasLocalTable,
    FazendasLocalData,
    $$FazendasLocalTableFilterComposer,
    $$FazendasLocalTableOrderingComposer,
    $$FazendasLocalTableAnnotationComposer,
    $$FazendasLocalTableCreateCompanionBuilder,
    $$FazendasLocalTableUpdateCompanionBuilder,
    (FazendasLocalData, $$FazendasLocalTableReferences),
    FazendasLocalData,
    PrefetchHooks Function({bool produtorId, bool talhoesLocalRefs})>;
typedef $$TalhoesLocalTableCreateCompanionBuilder = TalhoesLocalCompanion
    Function({
  required int id,
  required String nome,
  required int fazendasId,
  required String area,
  required String cultura,
  Value<String?> dataPlantio,
  required String status,
  required String createdAt,
  required String updatedAt,
  Value<int> rowid,
});
typedef $$TalhoesLocalTableUpdateCompanionBuilder = TalhoesLocalCompanion
    Function({
  Value<int> id,
  Value<String> nome,
  Value<int> fazendasId,
  Value<String> area,
  Value<String> cultura,
  Value<String?> dataPlantio,
  Value<String> status,
  Value<String> createdAt,
  Value<String> updatedAt,
  Value<int> rowid,
});

final class $$TalhoesLocalTableReferences extends BaseReferences<
    _$DeFuloDatabase, $TalhoesLocalTable, TalhoesLocalData> {
  $$TalhoesLocalTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FazendasLocalTable _fazendasIdTable(_$DeFuloDatabase db) =>
      db.fazendasLocal.createAlias($_aliasNameGenerator(
          db.talhoesLocal.fazendasId, db.fazendasLocal.id));

  $$FazendasLocalTableProcessedTableManager? get fazendasId {
    if ($_item.fazendasId == null) return null;
    final manager = $$FazendasLocalTableTableManager($_db, $_db.fazendasLocal)
        .filter((f) => f.id($_item.fazendasId!));
    final item = $_typedResult.readTableOrNull(_fazendasIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$EventosManejosLocalTable,
      List<EventosManejosLocalData>> _eventosManejosLocalRefsTable(
          _$DeFuloDatabase db) =>
      MultiTypedResultKey.fromTable(db.eventosManejosLocal,
          aliasName: $_aliasNameGenerator(
              db.talhoesLocal.id, db.eventosManejosLocal.talhaoId));

  $$EventosManejosLocalTableProcessedTableManager get eventosManejosLocalRefs {
    final manager =
        $$EventosManejosLocalTableTableManager($_db, $_db.eventosManejosLocal)
            .filter((f) => f.talhaoId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_eventosManejosLocalRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TalhoesLocalTableFilterComposer
    extends Composer<_$DeFuloDatabase, $TalhoesLocalTable> {
  $$TalhoesLocalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get area => $composableBuilder(
      column: $table.area, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cultura => $composableBuilder(
      column: $table.cultura, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dataPlantio => $composableBuilder(
      column: $table.dataPlantio, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$FazendasLocalTableFilterComposer get fazendasId {
    final $$FazendasLocalTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fazendasId,
        referencedTable: $db.fazendasLocal,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FazendasLocalTableFilterComposer(
              $db: $db,
              $table: $db.fazendasLocal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> eventosManejosLocalRefs(
      Expression<bool> Function($$EventosManejosLocalTableFilterComposer f) f) {
    final $$EventosManejosLocalTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.eventosManejosLocal,
        getReferencedColumn: (t) => t.talhaoId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EventosManejosLocalTableFilterComposer(
              $db: $db,
              $table: $db.eventosManejosLocal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TalhoesLocalTableOrderingComposer
    extends Composer<_$DeFuloDatabase, $TalhoesLocalTable> {
  $$TalhoesLocalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nome => $composableBuilder(
      column: $table.nome, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get area => $composableBuilder(
      column: $table.area, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cultura => $composableBuilder(
      column: $table.cultura, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dataPlantio => $composableBuilder(
      column: $table.dataPlantio, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$FazendasLocalTableOrderingComposer get fazendasId {
    final $$FazendasLocalTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fazendasId,
        referencedTable: $db.fazendasLocal,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FazendasLocalTableOrderingComposer(
              $db: $db,
              $table: $db.fazendasLocal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TalhoesLocalTableAnnotationComposer
    extends Composer<_$DeFuloDatabase, $TalhoesLocalTable> {
  $$TalhoesLocalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  GeneratedColumn<String> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  GeneratedColumn<String> get cultura =>
      $composableBuilder(column: $table.cultura, builder: (column) => column);

  GeneratedColumn<String> get dataPlantio => $composableBuilder(
      column: $table.dataPlantio, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$FazendasLocalTableAnnotationComposer get fazendasId {
    final $$FazendasLocalTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fazendasId,
        referencedTable: $db.fazendasLocal,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FazendasLocalTableAnnotationComposer(
              $db: $db,
              $table: $db.fazendasLocal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> eventosManejosLocalRefs<T extends Object>(
      Expression<T> Function($$EventosManejosLocalTableAnnotationComposer a)
          f) {
    final $$EventosManejosLocalTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.eventosManejosLocal,
            getReferencedColumn: (t) => t.talhaoId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$EventosManejosLocalTableAnnotationComposer(
                  $db: $db,
                  $table: $db.eventosManejosLocal,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$TalhoesLocalTableTableManager extends RootTableManager<
    _$DeFuloDatabase,
    $TalhoesLocalTable,
    TalhoesLocalData,
    $$TalhoesLocalTableFilterComposer,
    $$TalhoesLocalTableOrderingComposer,
    $$TalhoesLocalTableAnnotationComposer,
    $$TalhoesLocalTableCreateCompanionBuilder,
    $$TalhoesLocalTableUpdateCompanionBuilder,
    (TalhoesLocalData, $$TalhoesLocalTableReferences),
    TalhoesLocalData,
    PrefetchHooks Function({bool fazendasId, bool eventosManejosLocalRefs})> {
  $$TalhoesLocalTableTableManager(_$DeFuloDatabase db, $TalhoesLocalTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TalhoesLocalTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TalhoesLocalTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TalhoesLocalTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> nome = const Value.absent(),
            Value<int> fazendasId = const Value.absent(),
            Value<String> area = const Value.absent(),
            Value<String> cultura = const Value.absent(),
            Value<String?> dataPlantio = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TalhoesLocalCompanion(
            id: id,
            nome: nome,
            fazendasId: fazendasId,
            area: area,
            cultura: cultura,
            dataPlantio: dataPlantio,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String nome,
            required int fazendasId,
            required String area,
            required String cultura,
            Value<String?> dataPlantio = const Value.absent(),
            required String status,
            required String createdAt,
            required String updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              TalhoesLocalCompanion.insert(
            id: id,
            nome: nome,
            fazendasId: fazendasId,
            area: area,
            cultura: cultura,
            dataPlantio: dataPlantio,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TalhoesLocalTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {fazendasId = false, eventosManejosLocalRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (eventosManejosLocalRefs) db.eventosManejosLocal
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (fazendasId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.fazendasId,
                    referencedTable:
                        $$TalhoesLocalTableReferences._fazendasIdTable(db),
                    referencedColumn:
                        $$TalhoesLocalTableReferences._fazendasIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventosManejosLocalRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$TalhoesLocalTableReferences
                            ._eventosManejosLocalRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TalhoesLocalTableReferences(db, table, p0)
                                .eventosManejosLocalRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.talhaoId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TalhoesLocalTableProcessedTableManager = ProcessedTableManager<
    _$DeFuloDatabase,
    $TalhoesLocalTable,
    TalhoesLocalData,
    $$TalhoesLocalTableFilterComposer,
    $$TalhoesLocalTableOrderingComposer,
    $$TalhoesLocalTableAnnotationComposer,
    $$TalhoesLocalTableCreateCompanionBuilder,
    $$TalhoesLocalTableUpdateCompanionBuilder,
    (TalhoesLocalData, $$TalhoesLocalTableReferences),
    TalhoesLocalData,
    PrefetchHooks Function({bool fazendasId, bool eventosManejosLocalRefs})>;
typedef $$EventosManejosLocalTableCreateCompanionBuilder
    = EventosManejosLocalCompanion Function({
  required int id,
  required int talhaoId,
  required String tipoEvento,
  Value<String?> descricao,
  required String dataEvento,
  required String dataRegistro,
  required String responsavel,
  Value<String?> notas,
  required String createdAt,
  required String updatedAt,
  Value<int> rowid,
});
typedef $$EventosManejosLocalTableUpdateCompanionBuilder
    = EventosManejosLocalCompanion Function({
  Value<int> id,
  Value<int> talhaoId,
  Value<String> tipoEvento,
  Value<String?> descricao,
  Value<String> dataEvento,
  Value<String> dataRegistro,
  Value<String> responsavel,
  Value<String?> notas,
  Value<String> createdAt,
  Value<String> updatedAt,
  Value<int> rowid,
});

final class $$EventosManejosLocalTableReferences extends BaseReferences<
    _$DeFuloDatabase, $EventosManejosLocalTable, EventosManejosLocalData> {
  $$EventosManejosLocalTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TalhoesLocalTable _talhaoIdTable(_$DeFuloDatabase db) =>
      db.talhoesLocal.createAlias($_aliasNameGenerator(
          db.eventosManejosLocal.talhaoId, db.talhoesLocal.id));

  $$TalhoesLocalTableProcessedTableManager? get talhaoId {
    if ($_item.talhaoId == null) return null;
    final manager = $$TalhoesLocalTableTableManager($_db, $_db.talhoesLocal)
        .filter((f) => f.id($_item.talhaoId!));
    final item = $_typedResult.readTableOrNull(_talhaoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$EventosManejosLocalTableFilterComposer
    extends Composer<_$DeFuloDatabase, $EventosManejosLocalTable> {
  $$EventosManejosLocalTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tipoEvento => $composableBuilder(
      column: $table.tipoEvento, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get descricao => $composableBuilder(
      column: $table.descricao, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dataEvento => $composableBuilder(
      column: $table.dataEvento, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dataRegistro => $composableBuilder(
      column: $table.dataRegistro, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get responsavel => $composableBuilder(
      column: $table.responsavel, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notas => $composableBuilder(
      column: $table.notas, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$TalhoesLocalTableFilterComposer get talhaoId {
    final $$TalhoesLocalTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.talhaoId,
        referencedTable: $db.talhoesLocal,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TalhoesLocalTableFilterComposer(
              $db: $db,
              $table: $db.talhoesLocal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EventosManejosLocalTableOrderingComposer
    extends Composer<_$DeFuloDatabase, $EventosManejosLocalTable> {
  $$EventosManejosLocalTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tipoEvento => $composableBuilder(
      column: $table.tipoEvento, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get descricao => $composableBuilder(
      column: $table.descricao, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dataEvento => $composableBuilder(
      column: $table.dataEvento, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dataRegistro => $composableBuilder(
      column: $table.dataRegistro,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get responsavel => $composableBuilder(
      column: $table.responsavel, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notas => $composableBuilder(
      column: $table.notas, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$TalhoesLocalTableOrderingComposer get talhaoId {
    final $$TalhoesLocalTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.talhaoId,
        referencedTable: $db.talhoesLocal,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TalhoesLocalTableOrderingComposer(
              $db: $db,
              $table: $db.talhoesLocal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EventosManejosLocalTableAnnotationComposer
    extends Composer<_$DeFuloDatabase, $EventosManejosLocalTable> {
  $$EventosManejosLocalTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tipoEvento => $composableBuilder(
      column: $table.tipoEvento, builder: (column) => column);

  GeneratedColumn<String> get descricao =>
      $composableBuilder(column: $table.descricao, builder: (column) => column);

  GeneratedColumn<String> get dataEvento => $composableBuilder(
      column: $table.dataEvento, builder: (column) => column);

  GeneratedColumn<String> get dataRegistro => $composableBuilder(
      column: $table.dataRegistro, builder: (column) => column);

  GeneratedColumn<String> get responsavel => $composableBuilder(
      column: $table.responsavel, builder: (column) => column);

  GeneratedColumn<String> get notas =>
      $composableBuilder(column: $table.notas, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$TalhoesLocalTableAnnotationComposer get talhaoId {
    final $$TalhoesLocalTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.talhaoId,
        referencedTable: $db.talhoesLocal,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TalhoesLocalTableAnnotationComposer(
              $db: $db,
              $table: $db.talhoesLocal,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EventosManejosLocalTableTableManager extends RootTableManager<
    _$DeFuloDatabase,
    $EventosManejosLocalTable,
    EventosManejosLocalData,
    $$EventosManejosLocalTableFilterComposer,
    $$EventosManejosLocalTableOrderingComposer,
    $$EventosManejosLocalTableAnnotationComposer,
    $$EventosManejosLocalTableCreateCompanionBuilder,
    $$EventosManejosLocalTableUpdateCompanionBuilder,
    (EventosManejosLocalData, $$EventosManejosLocalTableReferences),
    EventosManejosLocalData,
    PrefetchHooks Function({bool talhaoId})> {
  $$EventosManejosLocalTableTableManager(
      _$DeFuloDatabase db, $EventosManejosLocalTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventosManejosLocalTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventosManejosLocalTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventosManejosLocalTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> talhaoId = const Value.absent(),
            Value<String> tipoEvento = const Value.absent(),
            Value<String?> descricao = const Value.absent(),
            Value<String> dataEvento = const Value.absent(),
            Value<String> dataRegistro = const Value.absent(),
            Value<String> responsavel = const Value.absent(),
            Value<String?> notas = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EventosManejosLocalCompanion(
            id: id,
            talhaoId: talhaoId,
            tipoEvento: tipoEvento,
            descricao: descricao,
            dataEvento: dataEvento,
            dataRegistro: dataRegistro,
            responsavel: responsavel,
            notas: notas,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required int talhaoId,
            required String tipoEvento,
            Value<String?> descricao = const Value.absent(),
            required String dataEvento,
            required String dataRegistro,
            required String responsavel,
            Value<String?> notas = const Value.absent(),
            required String createdAt,
            required String updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              EventosManejosLocalCompanion.insert(
            id: id,
            talhaoId: talhaoId,
            tipoEvento: tipoEvento,
            descricao: descricao,
            dataEvento: dataEvento,
            dataRegistro: dataRegistro,
            responsavel: responsavel,
            notas: notas,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$EventosManejosLocalTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({talhaoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (talhaoId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.talhaoId,
                    referencedTable:
                        $$EventosManejosLocalTableReferences._talhaoIdTable(db),
                    referencedColumn: $$EventosManejosLocalTableReferences
                        ._talhaoIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$EventosManejosLocalTableProcessedTableManager = ProcessedTableManager<
    _$DeFuloDatabase,
    $EventosManejosLocalTable,
    EventosManejosLocalData,
    $$EventosManejosLocalTableFilterComposer,
    $$EventosManejosLocalTableOrderingComposer,
    $$EventosManejosLocalTableAnnotationComposer,
    $$EventosManejosLocalTableCreateCompanionBuilder,
    $$EventosManejosLocalTableUpdateCompanionBuilder,
    (EventosManejosLocalData, $$EventosManejosLocalTableReferences),
    EventosManejosLocalData,
    PrefetchHooks Function({bool talhaoId})>;
typedef $$SyncQueueTableCreateCompanionBuilder = SyncQueueCompanion Function({
  Value<int> id,
  required String entityType,
  required String entityIdLocal,
  Value<int?> entityIdRemote,
  required String operation,
  required String payload,
  Value<String> status,
  Value<int> retryCount,
  Value<int> maxRetries,
  required String createdAt,
  Value<String?> lastAttemptAt,
  Value<String?> errorMessage,
  required String checksum,
  Value<int> version,
  required String originDevice,
});
typedef $$SyncQueueTableUpdateCompanionBuilder = SyncQueueCompanion Function({
  Value<int> id,
  Value<String> entityType,
  Value<String> entityIdLocal,
  Value<int?> entityIdRemote,
  Value<String> operation,
  Value<String> payload,
  Value<String> status,
  Value<int> retryCount,
  Value<int> maxRetries,
  Value<String> createdAt,
  Value<String?> lastAttemptAt,
  Value<String?> errorMessage,
  Value<String> checksum,
  Value<int> version,
  Value<String> originDevice,
});

class $$SyncQueueTableFilterComposer
    extends Composer<_$DeFuloDatabase, $SyncQueueTable> {
  $$SyncQueueTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityIdLocal => $composableBuilder(
      column: $table.entityIdLocal, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get entityIdRemote => $composableBuilder(
      column: $table.entityIdRemote,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxRetries => $composableBuilder(
      column: $table.maxRetries, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastAttemptAt => $composableBuilder(
      column: $table.lastAttemptAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get errorMessage => $composableBuilder(
      column: $table.errorMessage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get checksum => $composableBuilder(
      column: $table.checksum, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get originDevice => $composableBuilder(
      column: $table.originDevice, builder: (column) => ColumnFilters(column));
}

class $$SyncQueueTableOrderingComposer
    extends Composer<_$DeFuloDatabase, $SyncQueueTable> {
  $$SyncQueueTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityIdLocal => $composableBuilder(
      column: $table.entityIdLocal,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get entityIdRemote => $composableBuilder(
      column: $table.entityIdRemote,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get payload => $composableBuilder(
      column: $table.payload, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxRetries => $composableBuilder(
      column: $table.maxRetries, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastAttemptAt => $composableBuilder(
      column: $table.lastAttemptAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get errorMessage => $composableBuilder(
      column: $table.errorMessage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get checksum => $composableBuilder(
      column: $table.checksum, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get originDevice => $composableBuilder(
      column: $table.originDevice,
      builder: (column) => ColumnOrderings(column));
}

class $$SyncQueueTableAnnotationComposer
    extends Composer<_$DeFuloDatabase, $SyncQueueTable> {
  $$SyncQueueTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => column);

  GeneratedColumn<String> get entityIdLocal => $composableBuilder(
      column: $table.entityIdLocal, builder: (column) => column);

  GeneratedColumn<int> get entityIdRemote => $composableBuilder(
      column: $table.entityIdRemote, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => column);

  GeneratedColumn<int> get maxRetries => $composableBuilder(
      column: $table.maxRetries, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get lastAttemptAt => $composableBuilder(
      column: $table.lastAttemptAt, builder: (column) => column);

  GeneratedColumn<String> get errorMessage => $composableBuilder(
      column: $table.errorMessage, builder: (column) => column);

  GeneratedColumn<String> get checksum =>
      $composableBuilder(column: $table.checksum, builder: (column) => column);

  GeneratedColumn<int> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get originDevice => $composableBuilder(
      column: $table.originDevice, builder: (column) => column);
}

class $$SyncQueueTableTableManager extends RootTableManager<
    _$DeFuloDatabase,
    $SyncQueueTable,
    SyncQueueData,
    $$SyncQueueTableFilterComposer,
    $$SyncQueueTableOrderingComposer,
    $$SyncQueueTableAnnotationComposer,
    $$SyncQueueTableCreateCompanionBuilder,
    $$SyncQueueTableUpdateCompanionBuilder,
    (
      SyncQueueData,
      BaseReferences<_$DeFuloDatabase, $SyncQueueTable, SyncQueueData>
    ),
    SyncQueueData,
    PrefetchHooks Function()> {
  $$SyncQueueTableTableManager(_$DeFuloDatabase db, $SyncQueueTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> entityType = const Value.absent(),
            Value<String> entityIdLocal = const Value.absent(),
            Value<int?> entityIdRemote = const Value.absent(),
            Value<String> operation = const Value.absent(),
            Value<String> payload = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> retryCount = const Value.absent(),
            Value<int> maxRetries = const Value.absent(),
            Value<String> createdAt = const Value.absent(),
            Value<String?> lastAttemptAt = const Value.absent(),
            Value<String?> errorMessage = const Value.absent(),
            Value<String> checksum = const Value.absent(),
            Value<int> version = const Value.absent(),
            Value<String> originDevice = const Value.absent(),
          }) =>
              SyncQueueCompanion(
            id: id,
            entityType: entityType,
            entityIdLocal: entityIdLocal,
            entityIdRemote: entityIdRemote,
            operation: operation,
            payload: payload,
            status: status,
            retryCount: retryCount,
            maxRetries: maxRetries,
            createdAt: createdAt,
            lastAttemptAt: lastAttemptAt,
            errorMessage: errorMessage,
            checksum: checksum,
            version: version,
            originDevice: originDevice,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String entityType,
            required String entityIdLocal,
            Value<int?> entityIdRemote = const Value.absent(),
            required String operation,
            required String payload,
            Value<String> status = const Value.absent(),
            Value<int> retryCount = const Value.absent(),
            Value<int> maxRetries = const Value.absent(),
            required String createdAt,
            Value<String?> lastAttemptAt = const Value.absent(),
            Value<String?> errorMessage = const Value.absent(),
            required String checksum,
            Value<int> version = const Value.absent(),
            required String originDevice,
          }) =>
              SyncQueueCompanion.insert(
            id: id,
            entityType: entityType,
            entityIdLocal: entityIdLocal,
            entityIdRemote: entityIdRemote,
            operation: operation,
            payload: payload,
            status: status,
            retryCount: retryCount,
            maxRetries: maxRetries,
            createdAt: createdAt,
            lastAttemptAt: lastAttemptAt,
            errorMessage: errorMessage,
            checksum: checksum,
            version: version,
            originDevice: originDevice,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncQueueTableProcessedTableManager = ProcessedTableManager<
    _$DeFuloDatabase,
    $SyncQueueTable,
    SyncQueueData,
    $$SyncQueueTableFilterComposer,
    $$SyncQueueTableOrderingComposer,
    $$SyncQueueTableAnnotationComposer,
    $$SyncQueueTableCreateCompanionBuilder,
    $$SyncQueueTableUpdateCompanionBuilder,
    (
      SyncQueueData,
      BaseReferences<_$DeFuloDatabase, $SyncQueueTable, SyncQueueData>
    ),
    SyncQueueData,
    PrefetchHooks Function()>;
typedef $$SyncLogTableCreateCompanionBuilder = SyncLogCompanion Function({
  Value<int> id,
  required String syncId,
  required String startedAt,
  Value<String?> finishedAt,
  Value<int> totalItems,
  Value<int> success,
  Value<int> conflicts,
  Value<int> errors,
  required String status,
});
typedef $$SyncLogTableUpdateCompanionBuilder = SyncLogCompanion Function({
  Value<int> id,
  Value<String> syncId,
  Value<String> startedAt,
  Value<String?> finishedAt,
  Value<int> totalItems,
  Value<int> success,
  Value<int> conflicts,
  Value<int> errors,
  Value<String> status,
});

class $$SyncLogTableFilterComposer
    extends Composer<_$DeFuloDatabase, $SyncLogTable> {
  $$SyncLogTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncId => $composableBuilder(
      column: $table.syncId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get finishedAt => $composableBuilder(
      column: $table.finishedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get totalItems => $composableBuilder(
      column: $table.totalItems, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get success => $composableBuilder(
      column: $table.success, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get conflicts => $composableBuilder(
      column: $table.conflicts, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get errors => $composableBuilder(
      column: $table.errors, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$SyncLogTableOrderingComposer
    extends Composer<_$DeFuloDatabase, $SyncLogTable> {
  $$SyncLogTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncId => $composableBuilder(
      column: $table.syncId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get finishedAt => $composableBuilder(
      column: $table.finishedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get totalItems => $composableBuilder(
      column: $table.totalItems, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get success => $composableBuilder(
      column: $table.success, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get conflicts => $composableBuilder(
      column: $table.conflicts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get errors => $composableBuilder(
      column: $table.errors, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$SyncLogTableAnnotationComposer
    extends Composer<_$DeFuloDatabase, $SyncLogTable> {
  $$SyncLogTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get syncId =>
      $composableBuilder(column: $table.syncId, builder: (column) => column);

  GeneratedColumn<String> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<String> get finishedAt => $composableBuilder(
      column: $table.finishedAt, builder: (column) => column);

  GeneratedColumn<int> get totalItems => $composableBuilder(
      column: $table.totalItems, builder: (column) => column);

  GeneratedColumn<int> get success =>
      $composableBuilder(column: $table.success, builder: (column) => column);

  GeneratedColumn<int> get conflicts =>
      $composableBuilder(column: $table.conflicts, builder: (column) => column);

  GeneratedColumn<int> get errors =>
      $composableBuilder(column: $table.errors, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$SyncLogTableTableManager extends RootTableManager<
    _$DeFuloDatabase,
    $SyncLogTable,
    SyncLogData,
    $$SyncLogTableFilterComposer,
    $$SyncLogTableOrderingComposer,
    $$SyncLogTableAnnotationComposer,
    $$SyncLogTableCreateCompanionBuilder,
    $$SyncLogTableUpdateCompanionBuilder,
    (SyncLogData, BaseReferences<_$DeFuloDatabase, $SyncLogTable, SyncLogData>),
    SyncLogData,
    PrefetchHooks Function()> {
  $$SyncLogTableTableManager(_$DeFuloDatabase db, $SyncLogTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncLogTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncLogTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncLogTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> syncId = const Value.absent(),
            Value<String> startedAt = const Value.absent(),
            Value<String?> finishedAt = const Value.absent(),
            Value<int> totalItems = const Value.absent(),
            Value<int> success = const Value.absent(),
            Value<int> conflicts = const Value.absent(),
            Value<int> errors = const Value.absent(),
            Value<String> status = const Value.absent(),
          }) =>
              SyncLogCompanion(
            id: id,
            syncId: syncId,
            startedAt: startedAt,
            finishedAt: finishedAt,
            totalItems: totalItems,
            success: success,
            conflicts: conflicts,
            errors: errors,
            status: status,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String syncId,
            required String startedAt,
            Value<String?> finishedAt = const Value.absent(),
            Value<int> totalItems = const Value.absent(),
            Value<int> success = const Value.absent(),
            Value<int> conflicts = const Value.absent(),
            Value<int> errors = const Value.absent(),
            required String status,
          }) =>
              SyncLogCompanion.insert(
            id: id,
            syncId: syncId,
            startedAt: startedAt,
            finishedAt: finishedAt,
            totalItems: totalItems,
            success: success,
            conflicts: conflicts,
            errors: errors,
            status: status,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncLogTableProcessedTableManager = ProcessedTableManager<
    _$DeFuloDatabase,
    $SyncLogTable,
    SyncLogData,
    $$SyncLogTableFilterComposer,
    $$SyncLogTableOrderingComposer,
    $$SyncLogTableAnnotationComposer,
    $$SyncLogTableCreateCompanionBuilder,
    $$SyncLogTableUpdateCompanionBuilder,
    (SyncLogData, BaseReferences<_$DeFuloDatabase, $SyncLogTable, SyncLogData>),
    SyncLogData,
    PrefetchHooks Function()>;
typedef $$IdMappingTableCreateCompanionBuilder = IdMappingCompanion Function({
  required String localUuid,
  required int remoteId,
  required String entityType,
  required String syncedAt,
  Value<int> rowid,
});
typedef $$IdMappingTableUpdateCompanionBuilder = IdMappingCompanion Function({
  Value<String> localUuid,
  Value<int> remoteId,
  Value<String> entityType,
  Value<String> syncedAt,
  Value<int> rowid,
});

class $$IdMappingTableFilterComposer
    extends Composer<_$DeFuloDatabase, $IdMappingTable> {
  $$IdMappingTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get localUuid => $composableBuilder(
      column: $table.localUuid, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncedAt => $composableBuilder(
      column: $table.syncedAt, builder: (column) => ColumnFilters(column));
}

class $$IdMappingTableOrderingComposer
    extends Composer<_$DeFuloDatabase, $IdMappingTable> {
  $$IdMappingTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get localUuid => $composableBuilder(
      column: $table.localUuid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncedAt => $composableBuilder(
      column: $table.syncedAt, builder: (column) => ColumnOrderings(column));
}

class $$IdMappingTableAnnotationComposer
    extends Composer<_$DeFuloDatabase, $IdMappingTable> {
  $$IdMappingTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get localUuid =>
      $composableBuilder(column: $table.localUuid, builder: (column) => column);

  GeneratedColumn<int> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get entityType => $composableBuilder(
      column: $table.entityType, builder: (column) => column);

  GeneratedColumn<String> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$IdMappingTableTableManager extends RootTableManager<
    _$DeFuloDatabase,
    $IdMappingTable,
    IdMappingData,
    $$IdMappingTableFilterComposer,
    $$IdMappingTableOrderingComposer,
    $$IdMappingTableAnnotationComposer,
    $$IdMappingTableCreateCompanionBuilder,
    $$IdMappingTableUpdateCompanionBuilder,
    (
      IdMappingData,
      BaseReferences<_$DeFuloDatabase, $IdMappingTable, IdMappingData>
    ),
    IdMappingData,
    PrefetchHooks Function()> {
  $$IdMappingTableTableManager(_$DeFuloDatabase db, $IdMappingTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IdMappingTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IdMappingTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IdMappingTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> localUuid = const Value.absent(),
            Value<int> remoteId = const Value.absent(),
            Value<String> entityType = const Value.absent(),
            Value<String> syncedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              IdMappingCompanion(
            localUuid: localUuid,
            remoteId: remoteId,
            entityType: entityType,
            syncedAt: syncedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String localUuid,
            required int remoteId,
            required String entityType,
            required String syncedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              IdMappingCompanion.insert(
            localUuid: localUuid,
            remoteId: remoteId,
            entityType: entityType,
            syncedAt: syncedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$IdMappingTableProcessedTableManager = ProcessedTableManager<
    _$DeFuloDatabase,
    $IdMappingTable,
    IdMappingData,
    $$IdMappingTableFilterComposer,
    $$IdMappingTableOrderingComposer,
    $$IdMappingTableAnnotationComposer,
    $$IdMappingTableCreateCompanionBuilder,
    $$IdMappingTableUpdateCompanionBuilder,
    (
      IdMappingData,
      BaseReferences<_$DeFuloDatabase, $IdMappingTable, IdMappingData>
    ),
    IdMappingData,
    PrefetchHooks Function()>;
typedef $$SyncMetadataTableCreateCompanionBuilder = SyncMetadataCompanion
    Function({
  required String key,
  required String value,
  required String updatedAt,
  Value<int> rowid,
});
typedef $$SyncMetadataTableUpdateCompanionBuilder = SyncMetadataCompanion
    Function({
  Value<String> key,
  Value<String> value,
  Value<String> updatedAt,
  Value<int> rowid,
});

class $$SyncMetadataTableFilterComposer
    extends Composer<_$DeFuloDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$SyncMetadataTableOrderingComposer
    extends Composer<_$DeFuloDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$SyncMetadataTableAnnotationComposer
    extends Composer<_$DeFuloDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SyncMetadataTableTableManager extends RootTableManager<
    _$DeFuloDatabase,
    $SyncMetadataTable,
    SyncMetadataData,
    $$SyncMetadataTableFilterComposer,
    $$SyncMetadataTableOrderingComposer,
    $$SyncMetadataTableAnnotationComposer,
    $$SyncMetadataTableCreateCompanionBuilder,
    $$SyncMetadataTableUpdateCompanionBuilder,
    (
      SyncMetadataData,
      BaseReferences<_$DeFuloDatabase, $SyncMetadataTable, SyncMetadataData>
    ),
    SyncMetadataData,
    PrefetchHooks Function()> {
  $$SyncMetadataTableTableManager(_$DeFuloDatabase db, $SyncMetadataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncMetadataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncMetadataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<String> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncMetadataCompanion(
            key: key,
            value: value,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            required String value,
            required String updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncMetadataCompanion.insert(
            key: key,
            value: value,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncMetadataTableProcessedTableManager = ProcessedTableManager<
    _$DeFuloDatabase,
    $SyncMetadataTable,
    SyncMetadataData,
    $$SyncMetadataTableFilterComposer,
    $$SyncMetadataTableOrderingComposer,
    $$SyncMetadataTableAnnotationComposer,
    $$SyncMetadataTableCreateCompanionBuilder,
    $$SyncMetadataTableUpdateCompanionBuilder,
    (
      SyncMetadataData,
      BaseReferences<_$DeFuloDatabase, $SyncMetadataTable, SyncMetadataData>
    ),
    SyncMetadataData,
    PrefetchHooks Function()>;

class $DeFuloDatabaseManager {
  final _$DeFuloDatabase _db;
  $DeFuloDatabaseManager(this._db);
  $$UsuariosLocalTableTableManager get usuariosLocal =>
      $$UsuariosLocalTableTableManager(_db, _db.usuariosLocal);
  $$FazendasLocalTableTableManager get fazendasLocal =>
      $$FazendasLocalTableTableManager(_db, _db.fazendasLocal);
  $$TalhoesLocalTableTableManager get talhoesLocal =>
      $$TalhoesLocalTableTableManager(_db, _db.talhoesLocal);
  $$EventosManejosLocalTableTableManager get eventosManejosLocal =>
      $$EventosManejosLocalTableTableManager(_db, _db.eventosManejosLocal);
  $$SyncQueueTableTableManager get syncQueue =>
      $$SyncQueueTableTableManager(_db, _db.syncQueue);
  $$SyncLogTableTableManager get syncLog =>
      $$SyncLogTableTableManager(_db, _db.syncLog);
  $$IdMappingTableTableManager get idMapping =>
      $$IdMappingTableTableManager(_db, _db.idMapping);
  $$SyncMetadataTableTableManager get syncMetadata =>
      $$SyncMetadataTableTableManager(_db, _db.syncMetadata);
}
