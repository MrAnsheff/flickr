class ItemModel {
  String title;
  String link;
  String media;
  String dateTaken;
  String description;
  String published;
  String author;
  String authorId;
  String tags;
  bool liked;

  ItemModel(
      {this.title,
      this.link,
      this.media,
      this.dateTaken,
      this.description,
      this.published,
      this.author,
      this.authorId,
      this.tags,
      this.liked = false});

  ItemModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    media = json['media']['m'];
    dateTaken = json['date_taken'];
    description = json['description'];
    published = json['published'];
    author = json['author'];
    authorId = json['author_id'];
    tags = json['tags'];
    liked = false;
  }
}
