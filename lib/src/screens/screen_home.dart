import 'package:app/src/core/constants/constant.dart';
import 'package:app/src/screens/screen_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Track the selected tab index
  int notificationCount = 3;
  int messagerCount = 15;
  bool _isBottomNavVisible = true;
  final ScrollController _scrollController = ScrollController();

  // Define the list of pages
  late List<Widget> _pages;

  // Handle BottomNavigationBar tap
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // Ajoute un écouteur pour détecter le défilement

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isBottomNavVisible) {
          setState(() {
            _isBottomNavVisible = false;
          });
        }
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isBottomNavVisible) {
          setState(() {
            _isBottomNavVisible = true;
          });
        }
      }
    });
    _pages = [
      DashboardScreen(
        scrollController: _scrollController,
      ),
    ];
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondFond,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        //actionsIconTheme: const IconThemeData(color: Colors.red),
        backgroundColor: primaryFond,
        leading: _currentIndex == 0
            ? Icon(Icons.home)
            : _currentIndex == 1
                ? Icon(Icons.work)
                : Icon(Icons.help),
        title: Text(
          _currentIndex == 0
              ? "Home"
              : _currentIndex == 1
                  ? "Emploi"
                  : "Aides",
          style: TextStyle(color: white, fontSize: 15),
        ),

        //elevation: 30,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.messenger,
                  size: 20,
                ),
                onPressed: () {
                  // Handle notification icon tap
                },
              ),
              if (messagerCount >
                  0) // Only show badge if there are notifications
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      messagerCount >= 9 ? '9+' : '$messagerCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // Handle notification icon tap
                },
              ),
              if (notificationCount >
                  0) // Only show badge if there are notifications
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      notificationCount >= 9 ? '9+' : '$notificationCount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          Builder(
            builder: (context) {
              return IconButton(
                iconSize: 10,
                icon: CircleAvatar(
                  maxRadius: 16,
                  backgroundImage: AssetImage('assets/images/family1.jpeg'),
                ),
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
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/family1.jpeg'),
                ),
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
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: _isBottomNavVisible ? kBottomNavigationBarHeight : 0,
        child: Wrap(
          // set bottomnavigationbar to show and to hidden slowly with animation
          children: [
            BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: _onItemTapped,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              backgroundColor: primaryFond,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.work),
                  label: 'Emplois',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.help),
                  label: 'Aides',
                ),
                //BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Aide'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
