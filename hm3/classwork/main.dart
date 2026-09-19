import 'book.dart';
import 'library.dart';

void main() {
  Library myLibrary = Library();

  myLibrary.addBook(Book(title: "1984", author: "George", price: 15.99));
  myLibrary.addBook(Book(title: "Dune", author: "Nurdaulet", price: 20.50, isBorrowed: true));
  myLibrary.addBook(Book(title: "The Hobbit", author: "Daulet", price: 12.00));

  var available = myLibrary.getAvailableBooks();
  for (var book in available) {
    print("${book.title} by ${book.author} (\$${book.price})");
  }

  print("\nTotal Library Value: \$${myLibrary.getTotalValue()}");
}