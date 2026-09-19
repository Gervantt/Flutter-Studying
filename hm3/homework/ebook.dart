import 'media_item.dart';
import 'downloadable.dart';

class EBook extends MediaItem with Downloadable {
  double fileSizeMB;
  String author;

  EBook({
    required String id,
    required String title,
    required double price,
    required this.fileSizeMB,
    required this.author,
  }) : super(id: id, title: title, price: price);

  @override
  String getDetails() {
    return "EBook: $title by $author ($fileSizeMB MB) - \$$price";
  }
}