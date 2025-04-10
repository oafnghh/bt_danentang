import 'package:client/lab7/story.dart';

class StoryBrain {
  int _storyNumber = 0;

  final List<Story> _storyData = [
    Story(
      storyTitle: 'You see a fork in the road.',
      choice1: 'Take the left path.',
      choice2: 'Take the right path.',
    ),
    Story(
      storyTitle: 'You see a river.',
      choice1: 'Swim across.',
      choice2: 'Look for a bridge.',
    ),
    Story(
      storyTitle: 'You see a cave.',
      choice1: 'Enter the cave.',
      choice2: 'Walk past it.',
    ),
    Story(
      storyTitle: 'You found treasure!',
      choice1: 'Restart',
      choice2: '',
    ),
    Story(
      storyTitle: 'You got lost!',
      choice1: 'Restart',
      choice2: '',
    ),
    Story(
      storyTitle: 'A wild animal attacks you!',
      choice1: 'Restart',
      choice2: '',
    ),
  ];

  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  void nextStory(int choiceNumber) {
    if (_storyNumber == 0) {
      _storyNumber = (choiceNumber == 1) ? 2 : 1;
    } else if (_storyNumber == 1) {
      _storyNumber = (choiceNumber == 1) ? 2 : 3;
    } else if (_storyNumber == 2) {
      _storyNumber = (choiceNumber == 1) ? 5 : 4;
    } else {
      restart();
    }
  }

  void restart() {
    _storyNumber = 0;
  }

  bool buttonShouldBeVisible() {
    return _storyNumber < 3;
  }
}
