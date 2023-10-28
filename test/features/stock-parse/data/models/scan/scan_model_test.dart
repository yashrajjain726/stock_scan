import 'package:flutter_test/flutter_test.dart';
import 'package:stock_scan/features/stock-parse/data/models/scan/scan_model.dart';

import '../../../../../utils/utils.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('ScanModel Tests', () {
    test('fromJson should create a ScanModel from JSON', () async {
      final json = await getJsonData('assets/test/scan_model.json');

      final scan = ScanModel.fromJson(json);

      expect(scan.id, 1);
      expect(scan.name, 'Example Scan');
      expect(scan.tag, 'example_tag');
      expect(scan.color, 'example_color');
      expect(scan.criterias.length, 2);
      expect(scan.criterias[0].type, 'type1');
      expect(scan.criterias[0].text, 'text1');
      expect(scan.criterias[0].variables, {'key1': 'value1', 'key2': 'value2'});
      expect(scan.criterias[1].type, 'type2');
      expect(scan.criterias[1].text, 'text2');
      expect(scan.criterias[1].variables, {'key3': 'value3'});
    });
  });
}
