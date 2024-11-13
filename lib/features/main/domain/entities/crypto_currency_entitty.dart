class CryptoCurrencyEntity {
  final String fullName;
  final String name;
  final String price;
  final double changePCT24Hour;
  final String imageUrl;

  CryptoCurrencyEntity({
    required this.fullName,
    required this.name,
    required this.price,
    required this.changePCT24Hour,
    required this.imageUrl,
  });
}
