import 'package:equatable/equatable.dart';

class SubVariable extends Equatable {
  final String type;
  final List<num>? values;
  final String? studyType;
  final String? parameterName;
  final int? minValue;
  final int? maxValue;
  final int? defaultValue;
  const SubVariable({
    required this.type,
    this.values,
    this.studyType,
    this.parameterName,
    this.minValue,
    this.maxValue,
    this.defaultValue,
  });

  @override
  List<Object?> get props {
    return [
      type,
      values,
      studyType,
      parameterName,
      minValue,
      maxValue,
      defaultValue,
    ];
  }
}
