// bindings/app_bindings.dart
import 'package:get/get.dart';
import 'package:roqqu_assessment/presentation/controllers/balance_controller.dart';
import 'package:roqqu_assessment/presentation/controllers/crypto_controller.dart';
import 'package:roqqu_assessment/presentation/controllers/dashboard_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CryptoController(), fenix: true);
    Get.lazyPut(() => DashboardController(), fenix: true);
    Get.lazyPut(() => BalanceController(), fenix: true);
  }
}