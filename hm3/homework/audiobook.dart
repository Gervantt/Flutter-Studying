import 'media_item.dart';
import 'downloadable.dart';

class Audiobook extends MediaItem with Downloadable {
  double durationHours;
  String narrator;

  Audiobook({
    required String id,
    required String title,
    required double price,
    required this.durationHours,
    required this.narrator,
  }) : super(id: id, title: title, price: price);

  @override
  String getDetails() {
    return "Audiobook: $title ($durationHours hrs, narrated by $narrator) - \$$price";
  }
}