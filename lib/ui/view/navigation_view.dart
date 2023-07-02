import 'package:flutter/material.dart';
import 'package:task/ui/view/canceled_screen.dart';
import 'package:task/ui/view/completed_screen.dart';
import 'package:task/ui/view/new_screen.dart';
import 'package:task/ui/view/progress_screen.dart';
import '../widget/app_bar_widget.dart';
import 'add_task_view.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({Key? key}) : super(key: key);

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {

  int currentIndex = 0;
  List screens = [
    NewScreen(),
    CompletedScreen(),
    CanceledScreen(),
    ProgressScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskView()));
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            print(currentIndex);
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: "New"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: "Completed"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: "Canceled"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books), label: "Progress"),
        ],
      ),
      appBar: AppBar(
        title: AppBarWidget(),
      ),
      body: screens[currentIndex],
    );
  }
}
