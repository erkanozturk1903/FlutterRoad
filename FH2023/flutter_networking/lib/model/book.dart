class Book {
  final int? id;
  final String title;
  final String author;
  final String? description;

  const Book(
      {this.id, required this.title, required this.author, this.description});

// TODO: implement (de)serialization
}
