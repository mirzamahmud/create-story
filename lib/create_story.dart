import 'package:create_story/app/modules/bindings/story_binding.dart';
import 'package:create_story/app/routes/app_pages.dart';
import 'package:create_story/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateStory extends StatelessWidget {
  const CreateStory({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Create Story',
      initialRoute: Routes.story,
      initialBinding: StoryBinding(),
      getPages: AppPages.pages,
    );
  }
}
