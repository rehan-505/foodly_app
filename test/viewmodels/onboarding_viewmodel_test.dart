import 'package:flutter_test/flutter_test.dart';
import 'package:foodly_app/app/app.locator.dart';

import '../../test/helpers/test_helpers.dart';

void main() {
  group('OnboardingViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}

