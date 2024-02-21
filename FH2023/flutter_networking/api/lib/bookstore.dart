import 'package:collection/collection.dart';

class Bookstore {
  factory Bookstore.getInstance() => _instance;

  Bookstore._();

  static final Bookstore _instance = Bookstore._();

  final _books = [
    {
      'id': 1,
      'title': 'To Kill a Mockingbird',
      'author': 'Harper Lee',
      'description':
          'This classic novel tells the story of Scout Finch, a girl growing up in the Deep South in the 1930s.'
    },
    {
      'id': 2,
      'title': 'The Great Gatsby',
      'author': 'F. Scott Fitzgerald',
      'description':
          'This novel portrays the decadence and excess of the Roaring Twenties, as seen through the eyes of narrator Nick Carraway.'
    },
    {
      'id': 3,
      'title': 'Pride and Prejudice',
      'author': 'Jane Austen',
      'description':
          'This classic novel explores themes such as love, marriage, and social expectations in 19th century England.'
    },
    {
      'id': 4,
      'title': 'The Catcher in the Rye',
      'author': 'J.D. Salinger',
      'description':
          'This novel is a coming-of-age story that follows the journey of Holden Caulfield, a disillusioned teenager, in New York City.'
    },
    {
      'id': 5,
      'title': '1984',
      'author': 'George Orwell',
      'description':
          'This dystopian novel depicts a totalitarian future society in which individualism and free thought are suppressed.'
    },
  ];

  List<Map<String, Object>> get books =>
      _books.sorted((a, b) => (a['id'] as int).compareTo(b['id'] as int));

  Map<String, Object>? getOrNull(int id) =>
      _books.firstWhereOrNull((book) => book['id'] == id);

  void delete(int id) => _books.removeWhere((book) => book['id'] == id);

  int create(Map<String, Object> rawBook) {
    final maxId = _books.map((book) => book['id'] as int).maxOrNull;
    final id = (maxId ?? 0) + 1;
    rawBook['id'] = id;
    _books.add(rawBook);
    return id;
  }

  bool update(Map<String, Object> book) {
    final newBookId = book['id'];
    final existingBook =
        _books.firstWhereOrNull((item) => item['id'] == newBookId);
    if (existingBook != null) {
      _books.remove(existingBook);
    }
    _books.add(book);
    return existingBook != null;
  }
}
