abstract class IProduct {
  const IProduct({
    this.id,
    this.name,
    this.image,
    this.categoryId,
  });

  final int? id;
  final String? name;
  final String? image;
  final int? categoryId;
}
