import 'package:client/lab7/story_brain.dart';
import 'package:flutter/material.dart';

class lab7 extends StatefulWidget {
  const lab7({super.key});

  @override
  State<lab7> createState() => _lab7State();
}

class _lab7State extends State<lab7> {
  StoryBrain storyBrain = StoryBrain();
  void updateStory(int choice) {
    setState(() {
      storyBrain.nextStory(choice);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/background.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  storyBrain.getStory(),
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.red),
                child: Text(
                  storyBrain.getChoice1(),
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                onPressed: () {
                  updateStory(1);
                },
              ),
            ),
            SizedBox(height: 20.0),
            Visibility(
              visible: storyBrain.buttonShouldBeVisible(),
              child: Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    storyBrain.getChoice2(),
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  onPressed: () {
                    updateStory(2);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}