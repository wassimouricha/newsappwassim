class NewsApiModel {
  String title, imageUrl, content, description,publishedAt,author;

  NewsApiModel(
      {required this.title,
      required this.description,
      required this.content,
       required this.publishedAt,
        required this.author,
      required this.imageUrl});

  factory NewsApiModel.fromJson(Map<String, dynamic> jsonData) {
    return NewsApiModel(
      title: jsonData['title'] ?? "",
      description: jsonData['description'] ?? "",
      publishedAt: jsonData['publishedAt'] ?? "",
      content: jsonData['content'] ?? "",
      author: jsonData['author'] ?? "",
      imageUrl: jsonData['urlToImage'] ?? "",
    );
  }
}
