import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:roohi_sample/resources/resources.dart';

void main() {
  test('asset_icons assets test', () {
    expect(File(AssetIcons.academiIcon).existsSync(), isTrue);
  });
}
