import 'book.dart';

class Library {
  final List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
  }

  List<Book> getAvailableBooks() {
    return books.where((book) => !book.isBorrowed).toList();
  }

  double getTotalValue() {
    double total = 0.0;

    for (var book in books) {
      total += book.price;
    }
    
    return total;
  }

}