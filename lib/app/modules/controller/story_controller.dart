import 'package:create_story/app/components/overlay/overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryController extends GetxController {
  Rx<List<Widget>> widgets = Rx([]);
  Rx<bool> showDeleteButton = false.obs;
  Rx<bool> isDeleteButtonActive = false.obs;

  // =========================================== dummy widget ===================================
  List<Widget> dummyWidget = [
    // ================ emoji
    Text("😀", style: TextStyle(fontSize: 120)),

    // ================ text
    Container(
      height: 80,
      width: 120,
      padding: EdgeInsets.all(12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Text("Hello World!",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.black)),
    )
  ];

  void addWidget() {
    if (widgets.value.length < dummyWidget.length) {
      widgets.value.add(OverlayWidget(
          key: Key(widgets.value.length.toString()),
          onDragStart: onDragStart,
          onDragEnd: (offset, key) {
            showDeleteButton.value = false;
            if (offset.dy > (Get.height - 100)) {
              widgets.value.removeWhere((widget) => widget.key == key);
              widgets.refresh();
            }
          },
          onDragUpdate: (offset, key) {
            if (offset.dy > (Get.height - 100)) {
              if (!isDeleteButtonActive.value) {
                isDeleteButtonActive.value = true;
              }
            } else {
              if (isDeleteButtonActive.value) {
                isDeleteButtonActive.value = false;
              }
            }
          },
          child: dummyWidget.elementAt(widgets.value.length)));
      widgets.refresh();
    }
  }

  void onDragStart() {
    showDeleteButton.value = true;
  }
}
