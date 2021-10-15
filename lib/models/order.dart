class Order {
  final String id;
  final String date;
  final double price;
  final String description;
  final String tumbnailUrl;

  const Order({
    required this.id,
    required this.date,
    required this.price,
    required this.description,
    required this.tumbnailUrl,
  });
}
