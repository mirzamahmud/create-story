import 'package:create_story/app/modules/bindings/story_binding.dart';
import 'package:create_story/app/modules/story.dart';
import 'package:create_story/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(name: Routes.story, page: () => Story(), binding: StoryBinding())
  ];
}
