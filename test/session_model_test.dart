import 'package:flutter_test/flutter_test.dart';
import 'package:app/models/session.dart';

void main() {
  test('Session.fromJson creates a valid session', () {
    final json = {
      'id': '1',
      'name': 'Test Session',
      'status': 'Active',
      'uptime': '1h 30m',
    };

    final session = Session.fromJson(json);

    expect(session.id, '1');
    expect(session.name, 'Test Session');
    expect(session.status, 'Active');
    expect(session.uptime, '1h 30m');
  });
}
