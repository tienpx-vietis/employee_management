// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'employee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Employee _$EmployeeFromJson(Map<String, dynamic> json) {
  return _Employee.fromJson(json);
}

/// @nodoc
class _$EmployeeTearOff {
  const _$EmployeeTearOff();

  _Employee call({int? id, String? name, int? yearBorn, double? salary}) {
    return _Employee(
      id: id,
      name: name,
      yearBorn: yearBorn,
      salary: salary,
    );
  }

  Employee fromJson(Map<String, Object?> json) {
    return Employee.fromJson(json);
  }
}

/// @nodoc
const $Employee = _$EmployeeTearOff();

/// @nodoc
mixin _$Employee {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get yearBorn => throw _privateConstructorUsedError;
  double? get salary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeCopyWith<Employee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeCopyWith<$Res> {
  factory $EmployeeCopyWith(Employee value, $Res Function(Employee) then) =
      _$EmployeeCopyWithImpl<$Res>;
  $Res call({int? id, String? name, int? yearBorn, double? salary});
}

/// @nodoc
class _$EmployeeCopyWithImpl<$Res> implements $EmployeeCopyWith<$Res> {
  _$EmployeeCopyWithImpl(this._value, this._then);

  final Employee _value;
  // ignore: unused_field
  final $Res Function(Employee) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? yearBorn = freezed,
    Object? salary = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      yearBorn: yearBorn == freezed
          ? _value.yearBorn
          : yearBorn // ignore: cast_nullable_to_non_nullable
              as int?,
      salary: salary == freezed
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$EmployeeCopyWith<$Res> implements $EmployeeCopyWith<$Res> {
  factory _$EmployeeCopyWith(_Employee value, $Res Function(_Employee) then) =
      __$EmployeeCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? name, int? yearBorn, double? salary});
}

/// @nodoc
class __$EmployeeCopyWithImpl<$Res> extends _$EmployeeCopyWithImpl<$Res>
    implements _$EmployeeCopyWith<$Res> {
  __$EmployeeCopyWithImpl(_Employee _value, $Res Function(_Employee) _then)
      : super(_value, (v) => _then(v as _Employee));

  @override
  _Employee get _value => super._value as _Employee;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? yearBorn = freezed,
    Object? salary = freezed,
  }) {
    return _then(_Employee(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      yearBorn: yearBorn == freezed
          ? _value.yearBorn
          : yearBorn // ignore: cast_nullable_to_non_nullable
              as int?,
      salary: salary == freezed
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Employee implements _Employee {
  _$_Employee({this.id, this.name, this.yearBorn, this.salary});

  factory _$_Employee.fromJson(Map<String, dynamic> json) =>
      _$$_EmployeeFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? yearBorn;
  @override
  final double? salary;

  @override
  String toString() {
    return 'Employee(id: $id, name: $name, yearBorn: $yearBorn, salary: $salary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Employee &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.yearBorn, yearBorn) &&
            const DeepCollectionEquality().equals(other.salary, salary));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(yearBorn),
      const DeepCollectionEquality().hash(salary));

  @JsonKey(ignore: true)
  @override
  _$EmployeeCopyWith<_Employee> get copyWith =>
      __$EmployeeCopyWithImpl<_Employee>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmployeeToJson(this);
  }
}

abstract class _Employee implements Employee {
  factory _Employee({int? id, String? name, int? yearBorn, double? salary}) =
      _$_Employee;

  factory _Employee.fromJson(Map<String, dynamic> json) = _$_Employee.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get yearBorn;
  @override
  double? get salary;
  @override
  @JsonKey(ignore: true)
  _$EmployeeCopyWith<_Employee> get copyWith =>
      throw _privateConstructorUsedError;
}
