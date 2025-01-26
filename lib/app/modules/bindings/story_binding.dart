import 'package:create_story/app/modules/controller/story_controller.dart';
import 'package:get/get.dart';

class StoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoryController());
  }
}
