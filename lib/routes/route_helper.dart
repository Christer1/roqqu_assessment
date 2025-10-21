

import 'package:get/get.dart';
import 'package:roqqu_assessment/presentation/screens/copy_trading/amount_screen.dart';
import 'package:roqqu_assessment/presentation/screens/copy_trading/confirmation_pin_section.dart';
import 'package:roqqu_assessment/presentation/screens/copy_trading/copier_dashboard.dart';
import 'package:roqqu_assessment/presentation/screens/copy_trading/copy_trading_dashboard.dart';
import 'package:roqqu_assessment/presentation/screens/copy_trading/copy_trading_details.dart';
import 'package:roqqu_assessment/presentation/screens/copy_trading/copy_trading_intro.dart';
import 'package:roqqu_assessment/presentation/screens/copy_trading/copy_trading_risk.dart';
import 'package:roqqu_assessment/presentation/screens/copy_trading/success_screen.dart';
import 'package:roqqu_assessment/presentation/screens/dashboard/crypto_dashboard_screen.dart';

class RRouteHelper {
// Authenticationl
  static const String initial = "/",
      cryptoDashboard = "/crypto-dashboard",
      copyTradingIntro = "/crypto-trading-intro",
      copyTradingRisk = "/copy-trading-risks",
      copyTradingDashboard = "/copy-trading-dashboard",
      copierDashboard = "/copier-dashboard",
      copyTradingDetails = "/copy-trading-details",
      amountScreen = "/amount-screen",
      confirmTransactionPin = "/transaction-pin",
      successScreen = "/sucess-page";

  static List<GetPage> routes = [
    GetPage(name: cryptoDashboard, page: () => CryptoDashboardScreen()),
    GetPage(name: copyTradingIntro, page: () => CopyTradingIntro()),
    GetPage(name: copyTradingRisk, page: () => CopyTradingRisk()),
    GetPage(name: copyTradingDashboard, page: () => CopyTradingDashboard()),
    GetPage(name: copierDashboard, page: () => CopierDashboard()),
    GetPage(name: copyTradingDetails, page: () => CopyTradingDetails()),
    GetPage(name: amountScreen, page: () => AmountScreen()),
    GetPage(name: confirmTransactionPin, page: () => ConfirmationPinSection()),
    GetPage(name: successScreen, page: () => SuccessScreen()),
    
  ];
}
