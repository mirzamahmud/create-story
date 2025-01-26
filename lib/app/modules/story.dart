import 'package:create_story/app/modules/controller/story_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Story extends GetView<StoryController> {
  const Story({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Story Screen",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            for (Widget widget in controller.widgets.value) widget,
            // ======================= Delete Button ===========================
            Obx(
              () => controller.showDeleteButton.value
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.all(60),
                        child: controller.isDeleteButtonActive.value
                            ? SizedBox(
                                height: 64,
                                width: 64,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: 32,
                                width: 32,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                  child: const Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                      ),
                    )
                  : const SizedBox(),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.addWidget();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
