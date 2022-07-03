import '../models/user.dart';

class Users {
  static User john = User(
      pseudo: "John John",
      address: "XxJohnJohnDu59xX",
      followers: 456,
      profilePicLink:
          "https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80");

  static User pierre = User(
      pseudo: "Pierrrrrrrrrre",
      address: "TahLeπR",
      followers: 87,
      profilePicLink:
          "https://images.unsplash.com/photo-1551847812-f815b31ae67c?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464");
  static User jean = User(
      pseudo: "Jean...juste Jean",
      address: "JeanLaD",
      followers: 714,
      profilePicLink:
          "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80");

  static List<String> genericProfileList = <String>[
    "https://images.unsplash.com/photo-1551847812-f815b31ae67c?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464",
    "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"
  ];
}
