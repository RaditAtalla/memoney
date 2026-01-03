import 'package:flutter/material.dart';
import 'package:memoney/home_screen.dart';
import 'package:memoney/insight_screen.dart';
import 'package:memoney/plan_screen.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  PageController pageC = PageController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0F0F),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "MeMoney",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),

      body: PageView(
        controller: pageC,
        children: [HomeScreen(), PlanScreen(), InsightScreen()],
      ),

      bottomNavigationBar: NavigationBar(
        backgroundColor: Color(0xFF0F0F0F),
        elevation: 0,
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
          pageC.animateToPage(
            index,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        },
        indicatorColor: Colors.tealAccent,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home,), label: "Home"),
          NavigationDestination(
            icon: Icon(Icons.collections_bookmark),
            label: "Plan",
          ),
          NavigationDestination(
            icon: Icon(Icons.leaderboard),
            label: "Insight",
          ),
        ],
      ),
    );
  }
}
