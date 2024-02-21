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

import 'package:flutter/material.dart';

import '../model/book.dart';
import '../network/data_source.dart';

class AddOrUpdateBookScreen extends StatefulWidget {
  final DataSource dataSource;
  final Book? book;

  const AddOrUpdateBookScreen({super.key, required this.dataSource, this.book});

  @override
  State<AddOrUpdateBookScreen> createState() => _AddOrUpdateBookScreenState();
}

class _AddOrUpdateBookScreenState extends State<AddOrUpdateBookScreen> {
  late final _authorController =
      TextEditingController(text: widget.book?.author ?? '');
  late final _titleController =
      TextEditingController(text: widget.book?.title ?? '');
  late final _descriptionController =
      TextEditingController(text: widget.book?.description ?? '');

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Add Book'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              bookTitleTextField(),
              const SizedBox(height: 10.0),
              bookAuthorTextField(),
              const SizedBox(height: 10.0),
              bookDescriptionTextField(),
              const SizedBox(height: 10.0),
              submitButton(),
            ],
          ),
        ),
      );

  @override
  void dispose() {
    _authorController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Widget bookTitleTextField() => TextField(
        controller: _titleController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Book Title',
          labelText: 'Title',
        ),
      );

  Widget bookAuthorTextField() => TextField(
        controller: _authorController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Book Author',
          labelText: 'Author',
        ),
      );

  Widget bookDescriptionTextField() => TextField(
        maxLines: 4,
        controller: _descriptionController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Book Description',
          labelText: 'Description',
        ),
      );

  Widget submitButton() => TextButton(
        onPressed: () async {
          final book = Book(
            id: widget.book?.id,
            title: _titleController.text,
            author: _authorController.text,
            description: _descriptionController.text,
          );
          // TODO: implement network call
        },
        child: const Text('Submit'),
      );
}
