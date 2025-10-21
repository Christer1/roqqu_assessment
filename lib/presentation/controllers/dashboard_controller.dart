import 'package:get/get.dart';

class DashboardController extends GetxController {
  // my variables
  final RxInt currentIndex = 0.obs;
  final RxBool isModalOpen = false.obs;

  // Methods
  void onItemTapped(int index) {
    currentIndex.value = index;
  }

  void openModal() {
    isModalOpen.value = true;
  }

  void closeModal() {
    isModalOpen.value = false;
  }

  // Getters
  bool get isHomePage => currentIndex.value == 0;
}