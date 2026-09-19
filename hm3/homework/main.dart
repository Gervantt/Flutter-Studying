import 'ebook.dart';
import 'audiobook.dart';
import 'shopping_cart.dart';

void main() {
  ShoppingCart cart = ShoppingCart();

  var book = EBook(
    id: "1",
    title: "The Great Gatsby",
    price: 25.0,
    fileSizeMB: 5.4,
    author: "Daulet Ozhanov",
  );

  var audio = Audiobook(
    id: "2",
    title: "Atomic Habits",
    price: 15.0,
    durationHours: 5.5,
    narrator: "Charlie Chaplin",
  );

  cart.addItem(book);
  cart.addItem(audio);

  cart.printReceipt();
}