class StoryModel {
  final String title;
  final String storyUrl;
  final List stories;

  StoryModel({
    required this.title,
    required this.storyUrl,
    required this.stories,
  });
}

class UserModel {
  Map<String, dynamic> toMap(data) {
    return {
      'storyTitle': data.storyTitle,
      'storyImageUrl': data.storyImageUrl,
      'stories': data.guardianName,
    };
  }
}
