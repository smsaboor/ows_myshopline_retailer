import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ows_myshopline_retailer/bloc_core/bottom_nav/bottom_nav_cubit.dart';
import 'package:ows_myshopline_retailer/screens/chat/home_page.dart';
import 'drawer.dart';
import 'package:ows_myshopline_retailer/screens/tabs/home_tab/home_tab.dart';

class ScreenBottomNav extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<ScreenBottomNav> {
  final _pageNavigation = [
    HomeTab(),
    Container(child: Center(child: Text('Screen 2'),),),
    HomePageChatApp()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.purple,
                    size: 24, // Changing Drawer Icon Size
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(onTap: (){}, child: Icon(Icons.notifications_none)),
              )
              // buildPopupMenu()
            ],
            actionsIconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            title: Image.asset(
              "assets/logo1.jpg",
              width: MediaQuery.of(context).size.width * .5,
              height: 40,
            ),
            centerTitle: true,
          ),
          drawer: ArgonDrawer(currentPage: 'Home'),
          // appBar: AppBar(
          //   title: Text('Switch themes'),
          //   actions: [
          //     BlocBuilder<ThemeCubit, ThemeState>(
          //       builder: (context, state) {
          //         return Switch(
          //           value: state.isDarkThemeOn,
          //           onChanged: (newValue) {
          //             context.read<ThemeCubit>().toggleSwitch(newValue);
          //           },
          //         );
          //       },
          //     ),
          //   ],
          // ),
          body: _buildBody(state),
          bottomNavigationBar: _buildBottomNav(),
        );
      },
    );
  }

  Widget _buildBody(int index) {
    /// Check if index is in range
    /// else return Not Found widget
    return _pageNavigation.elementAt(index);
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: context.read<BottomNavCubit>().state,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.orange,
      onTap: _getChangeBottomNav,
      selectedIconTheme: IconThemeData(size: 27),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedFontSize: 14,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.book), label: "Get Trained"),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: "Chat"),
      ],
    );
  }

  void _getChangeBottomNav(int index) {
    context.read<BottomNavCubit>().updateIndex(index);
  }
}