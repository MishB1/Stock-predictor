import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stock_predictor/screens/News/news.dart';
import 'package:stock_predictor/screens/Notificattions/notifications.dart';
import 'package:stock_predictor/screens/SettingsPage/settings.dart';
import 'package:stock_predictor/screens/UpdatesPage/updates.dart';
import 'package:stock_predictor/screens/about/aboutScreen.dart';
import 'package:share/share.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  final String shareText = 'Check out the Stock Prediction App! 📈🚀';

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(        
        padding: EdgeInsets.zero,        
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Hamish Blay'), 
            accountEmail: Text('hamishblay@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('assets/images/me.jpg', 
                width: 90,
                height: 90,
                fit: BoxFit.cover,),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('assets/images/four.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),

          SizedBox(height: 30,),
          ListTile(
            leading: Icon(Icons.favorite_outline, color: Colors.lightBlue,),
            title: Text('Favorites'),
            onTap: () {},  
          ),

          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.share_outlined, color: Colors.lightBlue,),
            title: Text('Share with Friends'),
            onTap: () {
              Share.share(shareText);
            },
          ),

          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.newspaper_outlined, color: Colors.lightBlue,),
            title: Text('News'),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewsScreen()),
             );
            },
          ),

          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.notifications_outlined, color: Colors.lightBlue,),
            title: Text('Notifications'),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationsScreen()),
             );
            },
          ),

          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.person_outline, color: Colors.lightBlue,),
            title: Text('About'),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => aboutScreen()),
             );
            },
          ),

          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.settings_outlined, color: Colors.lightBlue,),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
             );
            },
          ),

          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.update_outlined, color: Colors.lightBlue,),
            title: Text('Updates'),
            onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UpdatesPage()),
             );
            },
          ),
          
          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.lightBlue,),
            title: Text('SignOut'),
            onTap: () {signOut();},
          ),
        ],
      ),
    );
  }
}
