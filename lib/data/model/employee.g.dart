// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Employee _$$_EmployeeFromJson(Map<String, dynamic> json) => _$_Employee(
      id: json['id'] as int?,
      name: json['name'] as String?,
      yearBorn: json['yearBorn'] as int?,
      salary: (json['salary'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_EmployeeToJson(_$_Employee instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'yearBorn': instance.yearBorn,
      'salary': instance.salary,
    };
