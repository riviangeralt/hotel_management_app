import 'package:get/get.dart';

class ViewController extends GetxController {
  static ViewController get instance => Get.find();

  RxInt selectedTab = 0.obs;

  void onTabChange(int tab) => selectedTab.value = tab;
}
