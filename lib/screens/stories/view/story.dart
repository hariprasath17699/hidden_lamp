import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/story_view.dart';

class Story extends StatefulWidget {
   Map stories;
   Story({Key? key, required this.stories}) : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  void initState() {
    super.initState();
  }

  final controller = StoryController();

  @override
  Widget build(context) {
    List<StoryItem> storyItems = [];
            storyItems.add(
              StoryItem.inlineImage(
                url: widget.stories['video'],
                controller: controller,
                caption: Text(
                  "${widget.stories['Description']}",
                  style: const TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.black54,
                    fontSize: 17,
                  ),
                ),
              ),
            );
      setState(() {});


    return StoryView(
      controller: controller, // pass controller here too
      repeat: true, // should the stories be slid forever
      onComplete: () {},
      onVerticalSwipeComplete: (direction) {
        if (direction == Direction.down) {
          Navigator.pop(context);
        }
      },
      storyItems:
          storyItems, // To disable vertical swipe gestures, ignore this parameter.
      // Preferrably for inline storyp view.
    );
  }
}
