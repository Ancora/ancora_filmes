import 'package:ancorafilmes/widgets/bg_login.dart';
import 'package:flutter/material.dart';
import 'package:ancorafilmes/login/login_page.dart';
import 'package:ancorafilmes/utils/nav.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            BgLogin(),
            ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  accountName: Text("Anderson Rocha"),
                  accountEmail: Text("anderson@anderson.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://img-a.udemycdn.com/user/50x50/39336524_a89c.jpg",
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  onTap: () {
                    print("Item 1");
                  },
                  title: Text(
                    "Item 1",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  onTap: () {
                    print("Item 2");
                  },
                  title: Text(
                    "Item 2",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  onTap: () {
                    print("Item 3");
                  },
                  title: Text(
                    "Item 3",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  onTap: () {
                    print("Configurações");
                  },
                  title: Text(
                    "Configurações",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  onTap: () {
                    print("Ajuda");
                  },
                  title: Text(
                    "Ajuda",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.help,
                    color: Colors.white,
                  ),
                ),
                ListTile(
                  onTap: () {
                    _logout(context);
                  },
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
          /* child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Anderson Rocha"),
                accountEmail: Text("anderson@anderson.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://img-a.udemycdn.com/user/50x50/39336524_a89c.jpg",
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  print("Item 1");
                },
                title: Text("Item 1"),
                leading: Icon(Icons.star),
              ),
              ListTile(
                onTap: () {
                  print("Item 2");
                },
                title: Text("Item 2"),
                leading: Icon(Icons.star),
              ),
              ListTile(
                onTap: () {
                  print("Item 3");
                },
                title: Text("Item 3"),
                leading: Icon(Icons.star),
              ),
              ListTile(
                onTap: () {
                  print("Configurações");
                },
                title: Text("Configurações"),
                leading: Icon(Icons.settings),
              ),
              ListTile(
                onTap: () {
                  print("Ajuda");
                },
                title: Text("Ajuda"),
                leading: Icon(Icons.help),
              ),
              ListTile(
                onTap: () {
                  _logout(context);
                },
                title: Text("Logout"),
                leading: Icon(Icons.close),
              )
            ],
          ), */
        ),
      ),
    );
  }

  void _logout(context) {
    pushReplacement(context, LoginPage());
  }
}
