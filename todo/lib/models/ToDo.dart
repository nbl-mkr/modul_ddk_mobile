class Todo {
  late int albumId;
  late int id;
  late String title;
  late String url;
  late String thumbnailUrl;

  Todo(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  Todo.fromJson(Map<String, dynamic> parsedJson) {
    this.albumId = parsedJson['albumId'];
    this.id = parsedJson['id'];
    this.title = parsedJson['title'];
    this.url = parsedJson['url'];
    this.thumbnailUrl = parsedJson['thumbnailUrl'];
  }
}
