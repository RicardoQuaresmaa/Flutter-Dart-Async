// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
import 'package:personas/main.dart';

void main() {
  test('Utility formatdate function must return only date', () {
    final formatedDate = Utility.formatDate('2019-04-01T18:43:40.564Z');

    expect(formatedDate, '2019-04-01');
  });

  test('Utility formatdatetime function must return only date', () {
    final formatedDate = Utility.formatDateTime('2019-04-01T18:43:40.564Z');

    expect(formatedDate, '2019-04-01 06:43 PM');
  });
}
