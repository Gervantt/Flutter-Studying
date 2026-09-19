import 'media_item.dart';
import 'downloadable.dart';

class ShoppingCart {
  final List<MediaItem> _items = [];

  void addItem(MediaItem item) {
    _items.add(item);
  }

  double calculateTotalWithTax({double taxRate = 0.12}) {
    double subtotal = 0.0;
    for (var item in _items) {
      subtotal += item.price;
    }
    return subtotal * (1 + taxRate);
  }

  List<MediaItem> filterByMaxPrice(double maxPrice) {
    return _items.where((item) => item.price <= maxPrice).toList();
  }

  void printReceipt() {
    for (var item in _items) {
      print(item.getDetails());

      if (item is Downloadable) {
        (item as Downloadable).download(item.title);
      }
    }

    double total = calculateTotalWithTax();
    print("Total with 12% Tax: \$${total.toStringAsFixed(2)}");
  }
}
