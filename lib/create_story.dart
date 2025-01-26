import 'package:create_story/app/components/overlay/overlay_widget.dart';
import 'package:flutter/material.dart';

class CreateStory extends StatelessWidget {
  const CreateStory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Create Story',
      home: Story(),
    );
  }
}

class Story extends StatefulWidget {
  const Story({super.key});

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  List<Widget> widgets = [];
  bool showDeleteButton = false;

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
          children: [for (int i = 0; i < widgets.length; i++) widgets[i]],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (widgets.length < dummyWidget.length) {
              setState(() {
                widgets.add(OverlayWidget(
                    onDragStart: () {},
                    onDragEnd: () {},
                    child: dummyWidget.elementAt(widgets.length)));
              });
            }
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  final List<Widget> dummyWidget = [
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
}
