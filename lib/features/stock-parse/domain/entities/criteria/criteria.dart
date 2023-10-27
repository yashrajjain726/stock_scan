import 'package:equatable/equatable.dart';

class Criteria extends Equatable {
  final String type;
  final String text;
  final Map<String, dynamic>? variables;

  const Criteria({required this.type, required this.text, this.variables});

  @override
  List<Object?> get props => [type, text, variables];
}
