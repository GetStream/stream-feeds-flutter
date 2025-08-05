class UserData {
  const UserData({
    required this.id,
    this.name,
    this.imageUrl,
  });

  final String id;
  final String? name;
  final String? imageUrl;
}
