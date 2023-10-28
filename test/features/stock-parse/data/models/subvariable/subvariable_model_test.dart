import 'package:flutter_test/flutter_test.dart';
import 'package:stock_scan/features/stock-parse/data/models/subvariable/subvariable_model.dart';

import '../../../../../utils/utils.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('SubVariableModel Tests', () {
    test('fromJson should create a SubVariableModel from JSON', () async {
      final json = await getJsonData('assets/test/subvariable_model.json');
      final subVariable = SubVariableModel.fromJson(json);

      expect(subVariable.type, 'example_type');
      expect(subVariable.values, [1.0, 2.0, 3.0]);
      expect(subVariable.studyType, 'example_study_type');
      expect(subVariable.parameterName, 'example_parameter_name');
      expect(subVariable.minValue, 0);
      expect(subVariable.maxValue, 10);
      expect(subVariable.defaultValue, 5);
    });

    test('fromJson should handle missing values', () async {
      final json =
          await getJsonData('assets/test/subvariable_model_null_case.json');
      final subVariable = SubVariableModel.fromJson(json);
      expect(subVariable.type, 'example_type');
      expect(subVariable.values, isNull);
      expect(subVariable.studyType, 'example_study_type');
      expect(subVariable.parameterName, 'example_parameter_name');
      expect(subVariable.minValue, 0);
      expect(subVariable.maxValue, 10);
      expect(subVariable.defaultValue, 5);
    });
  });
}
