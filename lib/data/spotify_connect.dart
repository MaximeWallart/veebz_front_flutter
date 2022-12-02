import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:spotify/spotify.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

// var credentials = SpotifyApiCredentials(
//     'fe93c19a89a94bb09d26c61a9954d8ba', 'bc9522732cfa4927a9069a6ba95b146e');
// var spotify = SpotifyApi(credentials);

Future<SpotifyApi?> spotifyConnect() async {
  try {
    var accessToken = await SpotifySdk.getAccessToken(
      clientId: dotenv.env['CLIENT_ID'].toString(),
      redirectUrl: dotenv.env['REDIRECT_URL'].toString(),
      scope: 'user-read-email, user-top-read, user-read-currently-playing',
    );

    return SpotifyApi.withAccessToken(accessToken);

    // var player = await spotify.me.currentlyPlaying();
    // print(player.item!.name);
    // var mySavedAlbums = await spotify.albums.get("6L6kiix92x3AvupahG0Sc4");
    // print(mySavedAlbums.popularity);
  } on PlatformException catch (e) {
    print(e);
    return null;
  }
}

Future<String?> getDisplayName(SpotifyApi? player) async {
  await player!.me.get().then((value) {
    return value.displayName;
  });
  return null;
}
