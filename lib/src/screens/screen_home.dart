import 'package:app/src/core/constants/constant.dart';
import 'package:app/src/screens/screen_dashboard.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondFond,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        //actionsIconTheme: const IconThemeData(color: Colors.red),
        backgroundColor: primaryFond,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.home)),
        title: Text(
          "home",
          style: TextStyle(color: white),
        ),
        //elevation: 30,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.messenger_rounded,
                size: 20,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: white,
              )),
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer(); // Open the right drawer
                },
              );
            },
          )
        ],
      ),
      endDrawer: Drawer(
        width: 250,
        backgroundColor: primaryFond,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: primaryFond),
              accountName: Text("Stéphan"),
              accountEmail: Text("stephan@gmail.com"),
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(110),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard, color: white),
              selectedColor: Colors.grey,
              title: const Text("Dashboard", style: TextStyle(color: white)),

              ///onTap: () => _selectPage(0),
              onFocusChange: (bool value) {
                ///_isSelected = value;
              },
            ),
            Divider(
              height: 1,
              endIndent: 10,
              indent: 10,
            ),
            ListTile(
              leading: const Icon(
                Icons.add_chart,
                color: white,
              ),
              title: const Text("OverView", style: TextStyle(color: white)),
              //onTap: () => _selectPage(1),
            ),
            Divider(
              height: 1,
              endIndent: 10,
              indent: 10,
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: white),
              title: const Text(
                "Settings",
                style: TextStyle(color: white),
              ),
              //onTap: () => _selectPage(2),
            ),
            Divider(
              height: 1,
              endIndent: 10,
              indent: 10,
            ),
            ListTile(
              leading: const Icon(Icons.interests, color: white),
              title: const Text(
                "About",
                style: TextStyle(color: white),
              ),
              onTap: () {},
            ),
            Divider(
              height: 1,
              endIndent: 10,
              indent: 10,
            ),
            ListTile(
              leading: Icon(Icons.logout, color: white),
              title: const Text("logout", style: TextStyle(color: white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: DashboardScreen(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: primaryFond,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Discussion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Emploi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Aide',
          ),
          //BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Aide'),
        ],
      ),
    );
  }
}
