class PostModel {
  final String writer;
  final String title;
  final String description;
  final int views;
  final int comments;
  final int likes;
  final int minutes;
  final String category;

  PostModel({
    required this.writer,
    required this.title,
    required this.description,
    required this.views,
    required this.comments,
    required this.likes,
    required this.minutes,
    required this.category,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    writer: json['writer'],
    title: json['title'],
    description: json['description'],
    views: json['views'],
    comments: json['comments'],
    likes: json['likes'],
    minutes: json['minutes'],
    category: json['category'],
  );
}
