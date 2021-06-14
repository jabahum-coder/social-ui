import 'package:flutter/material.dart';
import 'package:social_ui/data/data.dart';
import 'package:social_ui/screens/home_screen.dart';
import 'package:social_ui/screens/login_screen.dart';
import 'package:social_ui/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  _buildDrawerOptions(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(
                image: AssetImage(currentUser.backgroundImageUrl),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3.0,
                              color: Theme.of(context).primaryColor)),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      currentUser.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    )
                  ],
                ),
                bottom: 20.0,
                left: 20.0,
              )
            ],
          ),
          _buildDrawerOptions(
              Icon(Icons.dashboard),
              "Home",
              () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()))),
          _buildDrawerOptions(Icon(Icons.chat), "Chat", () {}),
          _buildDrawerOptions(Icon(Icons.location_on), "Map", () {}),
          _buildDrawerOptions(
              Icon(Icons.account_circle),
              "Profile",
              () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ProfileScreen()))),
          _buildDrawerOptions(Icon(Icons.settings), "Settings", () {}),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOptions(
                  Icon(Icons.directions_run),
                  "Logout",
                  () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()))),
            ),
          )
        ],
      ),
    );
  }
}
