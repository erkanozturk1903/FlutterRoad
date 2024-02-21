/* 
 * Copyright (c) 2022 Kodeco LLC
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical 
 * or instructional purposes related to programming, coding, application 
 * development, or information technology.  Permission for such use, copying,
 * modification, merger, publication, distribution, sublicensing, creation of 
 * derivative works, or sale is expressly withheld.
 * 
 * This project and source code may use libraries or frameworks that are
 * released under various Open-Source licenses. Use of those libraries and
 * frameworks are governed by their own individual licenses.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'dart:async';

import 'package:flutter/material.dart';

import '../model/book.dart';
import '../network/data_source.dart';
import 'add_or_update_book_screen.dart';

class BookshelfScreen extends StatefulWidget {
  const BookshelfScreen({super.key});

  @override
  State<BookshelfScreen> createState() => _BookshelfScreenState();
}

class _BookshelfScreenState extends State<BookshelfScreen> {
  final _dataSource = DataSource();

  // TODO: add book stream controller

  @override
  void initState() {
    super.initState();
    unawaited(refreshBooks());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Favorite Books'),
          actions: [
            IconButton(
              onPressed: refreshBooks,
              icon: const Icon(Icons.refresh),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async => navigateToAddOrUpdateScreen(context, null),
          child: const Icon(Icons.add),
        ),
        body: StreamBuilder(
            // TODO: bind data source
            stream: Stream.value(const [Book(title: 'lorem', author: 'ipsum')]),
            builder: (_, AsyncSnapshot<List<Book>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index) =>
                        bookListItem(index, snapshot.data!, context));
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return const CircularProgressIndicator();
              }
            }),
      );

  Widget bookListItem(int index, List<Book> books, BuildContext context) =>
      Dismissible(
        onDismissed: (_) {
          // TODO: implement DELETE network call
        },
        background: const ColoredBox(color: Colors.red),
        key: Key(books[index].id.toString()),
        child: ListTile(
          onTap: () async => navigateToAddOrUpdateScreen(context, books[index]),
          title: Text(books[index].title),
          subtitle: Text(
            books[index].description ?? '',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          isThreeLine: true,
          trailing: Text(
            books[index].author,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      );

  Future<void> navigateToAddOrUpdateScreen(
    BuildContext context,
    Book? book,
  ) async {
    final result = await Navigator.push<bool>(
        context,
        MaterialPageRoute<bool>(
          builder: (context) => AddOrUpdateBookScreen(
            dataSource: _dataSource,
            book: book,
          ),
        ));
    if (result != null) {
      await refreshBooks();
    }
  }

  Future<void> refreshBooks() async {} // TODO: implement GET network call

  @override
  Future<void> dispose() async {
    // TODO: clean up resources
    super.dispose();
  }
}
