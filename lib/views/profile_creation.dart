import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:spotify/spotify.dart' as spotify;
import 'package:veebz_front_flutter/data/spotify_connect.dart';

import '../my_colors.dart';

class ProfileCreationView extends StatefulWidget {
  const ProfileCreationView({Key? key, required this.user}) : super(key: key);

  final User? user;

  @override
  State<ProfileCreationView> createState() => _ProfileCreationViewState();
}

class _ProfileCreationViewState extends State<ProfileCreationView> {
  final _formKey = GlobalKey<FormState>();

  String pseudo = "";
  String description = "";
  String photoUrl =
      "https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80";

  spotify.SpotifyApi? player;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight,
                colors: [
                  MyColors.BackgroundAppColor,
                  MyColors.NewPrimaryColor,
                ],
                stops: [
                  0.3,
                  1
                ])),
        child: Form(
          key: _formKey,
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: Text(
                "Créer un profil",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.05),
              ),
            ),
            TextFormField(
              maxLines: 1,
              onFieldSubmitted: (String value) => pseudo = value,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  filled: true,
                  hintText: "Pseudo",
                  hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontStyle: FontStyle.italic),
                  fillColor: Colors.white.withOpacity(0.5)),
              style: const TextStyle(color: Colors.white),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Un pseudo est nécessaire';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              maxLines: 4,
              onFieldSubmitted: (String value) => description = value,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  filled: true,
                  hintText: "Description",
                  hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontStyle: FontStyle.italic),
                  fillColor: Colors.white.withOpacity(0.5)),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
                maxLines: 1,
                onFieldSubmitted: (String value) => photoUrl = value,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    filled: true,
                    hintText: "Url Photo de profil",
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontStyle: FontStyle.italic),
                    fillColor: Colors.white.withOpacity(0.5)),
                style: const TextStyle(color: Colors.white)),
            ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 20)),
                  backgroundColor: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return const Color(0xFF24be4e);
                    }
                    return const Color(0xFF33ce6f);
                  }),
                  shape: MaterialStateProperty.all<StadiumBorder>(
                      const StadiumBorder())),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Connect with Spotify"),
                    Icon(MdiIcons.spotify)
                  ]),
              onPressed: () async {
                player = (await spotifyConnect())!;
                setState(() {});
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 20)),
                  backgroundColor: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return const Color(0xFF24be4e);
                    }
                    return const Color(0xFF33ce6f);
                  }),
                  shape: MaterialStateProperty.all<StadiumBorder>(
                      const StadiumBorder())),
              child: const Text("Test"),
              onPressed: () async {
                var test = await player!.me.currentlyPlaying();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(test.item!.name!)));
                print(test.item!.name);
              },
            ),
            // (player != null)
            //     ? FutureBuilder<String?>(
            //         future: getDisplayName(player),
            //         builder:
            //             (BuildContext context, AsyncSnapshot<String?> text) {
            //           return Text(text.data!);
            //         },
            //       )
            //     : Container()
          ]),
        ),
      ),
    );
  }
}
