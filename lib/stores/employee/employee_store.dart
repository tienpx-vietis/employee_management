import 'package:employee_management/core/validation/validation_result.dart';
import 'package:employee_management/data/model/employee.dart';
import 'package:mobx/mobx.dart';

part 'employee_store.g.dart';

class EmployeeStore = _EmployeeStore with _$EmployeeStore;

abstract class _EmployeeStore with Store {
  int? id;

  @observable
  String? name;

  @observable
  ValidationResult nameValidation = ValidationResult.invalid();

  @observable
  int? yearBorn;

  @observable
  ValidationResult yearBornValidation = ValidationResult.invalid();

  @observable
  double? salary;

  @observable
  ValidationResult salaryValidation = ValidationResult.invalid();

  @action
  void set(Employee employee) {
    id = employee.id;
    name = employee.name;
    yearBorn = employee.yearBorn;
    salary = employee.salary;
  }

  @action
  void setName(String value) => name = value;

  @action
  void setYearBorn(String value) => yearBorn = int.tryParse(value);

  @action
  void setSalary(String value) => salary = double.tryParse(value);

  @computed
  bool get isValid =>
      nameValidation.valid &&
      yearBornValidation.valid &&
      salaryValidation.valid;

  @action
  void validateName(String? value) {
    nameValidation = value?.isNotEmpty ?? false
        ? ValidationResult.valid()
        : ValidationResult.invalid('Invalid Name');
  }

  @action
  void validateYearBorn(int? value) {
    yearBornValidation = (value ?? 0) > 0
        ? ValidationResult.valid()
        : ValidationResult.invalid('Invalid Year Born');
  }

  @action
  void validateSalary(double? value) {
    salaryValidation = (value ?? 0) > 0
        ? ValidationResult.valid()
        : ValidationResult.invalid('Invalid Salary');
  }
  
  late List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => name, validateName),
      reaction((_) => yearBorn, validateYearBorn),
      reaction((_) => salary, validateSalary)
    ];
  }

  void dispose() {
    _disposers.forEach((d) => d());
  }
}
