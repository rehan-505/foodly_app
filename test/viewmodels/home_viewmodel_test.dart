// import 'package:flutter_test/flutter_test.dart';
// import 'package:foodly_app/ui/views/login/login_viewmodel.dart';
// import 'package:mockito/mockito.dart';
// import 'package:foodly_app/app/app.locator.dart';
// import 'package:foodly_app/enums/bottom_sheet_type.dart';
// import 'package:foodly_app/ui/common/app_strings.dart';
//
// import '../helpers/test_helpers.dart';
//
//
// void main() {
//   LoginViewModel _getModel() => LoginViewModel();
//
//   group('HomeViewmodelTest -', () {
//     setUp(() => registerServices());
//     tearDown(() => locator.reset());
//
//     group('incrementCounter -', () {
//       test('When called once should return  Counter is: 1', () {
//         final model = _getModel();
//         model.incrementCounter();
//         expect(model.counterLabel, 'Counter is: 1');
//       });
//     });
//
//     group('showBottomSheet -', () {
//       test('When called, should show custom bottom sheet using notice variant',
//           () {
//         final bottomSheetService = getAndRegisterBottomSheetService();
//
//         final model = _getModel();
//         model.showBottomSheet();
//         verify(bottomSheetService.showCustomSheet(
//           variant: BottomSheetType.notice,
//           title: ksHomeBottomSheetTitle,
//           description: ksHomeBottomSheetDescription,
//         ));
//       });
//     });
//   });
// }
//
