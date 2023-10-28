import 'package:flutter_test/flutter_test.dart';
import 'package:stock_scan/features/stock-parse/data/models/criteria/criteria_model.dart';
import '../../../../../utils/utils.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('CriteriaModel Tests', () {
    test('fromJson should create a CriteriaModel from JSON', () async {
      final json = await getJsonData('assets/test/criteria_model.json');
      final criteria = CriteriaModel.fromJson(json);
      expect(criteria.type, 'example_type');
      expect(criteria.text, 'example_text');
      expect(criteria.variables, {'key1': 'value1', 'key2': 'value2'});
    });

    test('fromJson should handle missing variables', () async {
      final json =
          await getJsonData('assets/test/criteria_model_null_case.json');
      final criteria = CriteriaModel.fromJson(json);
      expect(criteria.type, 'example_type');
      expect(criteria.text, 'example_text');
      expect(criteria.variables, {});
    });
  });
}
