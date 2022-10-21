class NewsModel {
  late final String status;
  late final int totalResults;
  late final List<Articles> articles;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  NewsModel.fromJson(Map<String, dynamic> map) {
    status = map["status"] ?? "";
    totalResults = map["totalResults"] ?? "";
    articles =
        List.from(map["articles"]).map((e) => Articles.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["status"] = status;
    data["totalResults"] = totalResults;
    data["articles"] = articles.map((e) => e.toJson()).toList();
    return data;
  }
}

class Articles {
  Articles({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  late final Source source;
  late final String author;
  late final String title;
  late final String description;
  late final String url;
  late final String urlToImage;
  late final String publishedAt;
  late final String content;

  Articles.fromJson(Map<String, dynamic> json) {
    source = Source.fromJson(json['source']);
    author = json["author"] ?? "";
    title = json['title'] ?? "";
    description = json["description"] ?? "";
    url = json['url'] ?? "";
    urlToImage = json["urlToImage"] ?? "";
    publishedAt = json['publishedAt'] ?? "";
    content = json["content"] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['source'] = source.toJson();
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

class Source {
  Source({
    this.id,
    this.name,
  });

  late final String? id;
  late final String? name;

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
