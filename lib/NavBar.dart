import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

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
            leading: Icon(Icons.favorite, color: Colors.lightBlue,),
            title: Text('Favorites'),
            onTap: () => null,
          ),
          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.share, color: Colors.lightBlue,),
            title: Text('Share with Friends'),
            onTap: () => null,
          ),
          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.person, color: Colors.lightBlue,),
            title: Text('About'),
            onTap: () => null,
          ),
          SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.lightBlue,),
            title: Text('Settings'),
            onTap: () => null,
          ),
          SizedBox(height: 10,),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.lightBlue,),
            title: Text('Exit'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}