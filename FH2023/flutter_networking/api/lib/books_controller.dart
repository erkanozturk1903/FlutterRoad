import 'package:conduit_core/conduit_core.dart';

import 'bookstore.dart';

class BooksController extends ResourceController {
  final _bookstore = Bookstore.getInstance();

  @Operation.get()
  Future<Response> getAllBooks() async {
    return Response.ok(_bookstore.books);
  }

  @Operation.get('id')
  Future<Response> getBookById(@Bind.path('id') int id) async {
    final hero = _bookstore.getOrNull(id);

    if (hero == null) {
      return Response.notFound();
    }

    return Response.ok(hero);
  }

  @Operation.delete('id')
  Future<Response> deleteBookById(@Bind.path('id') int id) async {
    _bookstore.delete(id);
    return Response.noContent();
  }

  @Operation.post()
  Future<Response> createBook(@Bind.body() Map<String, Object> rawBook) async {
    final id = _bookstore.create(rawBook);
    return Response.created("/books/$id");
  }

  @Operation.put('id')
  Future<Response> updateBook(
      @Bind.body() Map<String, Object> book, @Bind.path('id') int id) async {
    book['id'] = id;
    if (_bookstore.update(book)) {
      return Response.noContent();
    }
    return Response.created("/books/${book['id']}");
  }
}
