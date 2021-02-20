import 'package:HearMe/Utils/authentication.dart';
import 'package:flutter/material.dart';
import '../Pages/login.dart';
import '../Pages/playlist.dart';
import '../Pages/developers.dart';
import '../Pages/likedSongs.dart';

Widget drawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: FutureBuilder(
            future: getUserDetail(),
            builder: (context, snapasht) {
              if (snapasht.hasData) {
                return Text(
                    user.displayName == null ? "User" : user.displayName,
                    style: TextStyle(fontSize: 20.0));
              } else {
                return Text("User", style: TextStyle(fontSize: 20.0));
              }
            },
          ),
          accountEmail: FutureBuilder(
            future: getUserDetail(),
            builder: (context, snapasht) {
              if (snapasht.hasData) {
                return Text(user.email == null ? "User" : user.email,
                    style: TextStyle(fontSize: 20.0));
              } else {
                return Text("", style: TextStyle(fontSize: 20.0));
              }
            },
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.greenAccent,
            child: Text(
              "G",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
          ),
          title: Text("Home", style: TextStyle(fontSize: 20.0)),
        ),
        ListTile(
            leading: Icon(
              Icons.music_note,
            ),
            title: Text(
              "Playlist",
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Playlist()),
              );
            }),
        ListTile(
            leading: Icon(
              Icons.thumb_up,
            ),
            title: Text(
              "Liked Songs",
              style: TextStyle(fontSize: 20.0),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LikedSongs()),
              );
            }),
        ListTile(
          leading: Icon(
            Icons.supervisor_account,
          ),
          title: Text("Developers", style: TextStyle(fontSize: 20.0)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Developers()),
            );
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
          ),
          title: Text("Setting", style: TextStyle(fontSize: 20.0)),
        ),
        ListTile(
          //TODO:
          onTap: () async {
            await logOut();
            //   if (await signOutUser()) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
            //             }
            //             else{
            //               print("Sign in not done");
            //             }
          },
          leading: Icon(
            Icons.settings,
          ),
          title: Text("Sign out", style: TextStyle(fontSize: 20.0)),
        )
        //Text("Home"),
      ],
    ),
  );
}
