class User {
  String pseudo;
  String address;
  String description;
  String profilePicLink;
  int followers;
  int subscribed;

  User(
      {required this.pseudo,
      required this.address,
      required this.description,
      required this.profilePicLink,
      required this.followers,
      required this.subscribed});
}
