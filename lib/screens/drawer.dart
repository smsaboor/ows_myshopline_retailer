import 'package:flutter/material.dart';
import 'package:ows_myshopline_retailer/constants/components.dart';
import 'package:ows_myshopline_retailer/providers/auth_provider.dart';
import 'package:ows_myshopline_retailer/screens/add_product_nd_offer/create_new_offer.dart';
import 'theme.dart';
import 'drawer_title.dart';
import 'common_container.dart';
import 'package:ows_myshopline_retailer/screens/add_product_nd_offer/select_product_options.dart';
import 'package:ows_myshopline_retailer/screens/view_update_product/view_update_product.dart';
import 'package:ows_myshopline_retailer/screens/update_shop_setting/update_shop_setting.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ows_myshopline_retailer/screens/login/login2.dart';
import 'package:provider/provider.dart';
import 'package:ows_myshopline_retailer/welcome.dart';

const Color primaryColor = Colors.orange;
const Color secondaryColor = Colors.purple;

class ArgonDrawer extends StatefulWidget {
  final String? currentPage;
  ArgonDrawer({this.currentPage});
  @override
  State<ArgonDrawer> createState() => _ArgonDrawerState();
}

class _ArgonDrawerState extends State<ArgonDrawer> {
  late AuthProvider authProvider;
  late String currentUserId;
  late String currentUserName;
  late String currentUserPhtoUrl;

  @override
  void initState() {
    super.initState();
    authProvider = context.read<AuthProvider>();
    // homeProvider = context.read<HomeProvider>();
    if (authProvider.getUserFirebaseId()?.isNotEmpty == true) {
      currentUserId = authProvider.getUserFirebaseId()!;
      currentUserName = authProvider.getUserFirebaseName()!;
      currentUserPhtoUrl = authProvider.getUserFirebasePhotoUrl()!;
      print('----------------------------${currentUserPhtoUrl}');
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
            (Route<dynamic> route) => false,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: MediaQuery.of(context).size.width * .7,
        child: Column(children: [
          Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.105,
              width: MediaQuery.of(context).size.width * 0.85,
              child: SafeArea(
                bottom: false,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/logo1.jpg",
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                  ),
                ),
              )),
          Container(
            height: 50,
            color: primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22.0,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            currentUserName,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'ankit12@gmail.com',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
              padding: EdgeInsets.only(left: 8, right: 16),
              height: MediaQuery.of(context).size.height * .8,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DrawerTile(
                        icon: Icons.arrow_circle_right,
                        onTap: () {
                          navigateTo(context,SelectProductOptions());
                        },
                        iconColor: ArgonColors.error,
                        title: "Add New Product",
                        isSelected: widget.currentPage == "Home" ? true : false),
                    DrawerTile(
                        icon: Icons.arrow_circle_right,
                        onTap: () {
                          navigateTo(context,ViewUpdateProduct());
                        },
                        iconColor: ArgonColors.error,
                        title: "View/Update Product",
                        isSelected: widget.currentPage == "Account" ? true : false),
                    DrawerTile(
                        icon: Icons.arrow_circle_right,
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => CommonContainer(
                                title: "Manage Stock",
                              )));
                          // if (currentPage != "change_password")
                          //   Navigator.pushReplacementNamed(context, '/profile');
                        },
                        iconColor: ArgonColors.error,
                        title: "Manage Stock",
                        isSelected: widget.currentPage == "Profile" ? true : false),
                    DrawerTile(
                        icon: Icons.arrow_circle_right,
                        onTap: () {
                          navigateTo(context,CreateNewOffer());
                        },
                        iconColor: ArgonColors.error,
                        title: "Create New Offer",
                        isSelected: widget.currentPage == "Elements" ? true : false),
                    DrawerTile(
                        icon: Icons.arrow_circle_right,
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => CommonContainer(
                                title: "Change Store Banner",
                              )));
                          // if (currentPage != "Elements")
                          //   Navigator.pushReplacementNamed(context, '/elements');
                        },
                        iconColor: ArgonColors.error,
                        title: "Change Store Banner",
                        isSelected: widget.currentPage == "Elements" ? true : false),
                    DrawerTile(
                        icon: Icons.arrow_circle_right,
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => CommonContainer(
                                title: "Public/Private/Hidden",
                              )));
                        },
                        iconColor: ArgonColors.error,
                        title: "Public/Private/Hidden",
                        isSelected: widget.currentPage == "Elements" ? true : false),
                    DrawerTile(
                        icon: Icons.arrow_circle_right,
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => CommonContainer(
                                title: "Dummy Text",
                              )));
                        },
                        iconColor: ArgonColors.error,
                        title: "Dummy Text",
                        isSelected: widget.currentPage == "Articles" ? true : false),
                    DrawerTile(
                        icon: Icons.arrow_circle_right,
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => CommonContainer(
                                title: "Update Delivery Terms",
                              )));
                        },
                        iconColor: ArgonColors.error,
                        title: "Update Delivery Terms",
                        isSelected: widget.currentPage == "Articles" ? true : false),
                    DrawerTile(
                        icon: Icons.arrow_circle_right,
                        onTap: () {
                         navigateTo(context, UpdateShopSetting());
                        },
                        iconColor: ArgonColors.error,
                        title: "Update Shop Setting",
                        isSelected: widget.currentPage == "Articles" ? true : false),
                    Divider(height: 4, thickness: 0, color: ArgonColors.muted),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Terms and Conditions'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('How to Use Tutorials'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Customer Policy'),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Upgrade Your Profiles',style: TextStyle(color: Colors.red),),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                          child: Text(
                              "Sign Out".toUpperCase(),
                              style: TextStyle(fontSize: 12)
                          ),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(color: Colors.red)
                                  )
                              )
                          ),
                          onPressed: ()async{
                            authProvider.handleSignOut();
                            SharedPreferences preferences = await SharedPreferences.getInstance();
                            preferences.setBool('isLogin', false);
                            navigateAndFinsh(context, WelcomeScreen());
                          }
                      ),
                    )
                  ],
                ),
              )),

          // Container(
          //     height: MediaQuery.of(context).size.height * 0.04,
          //     child: Center(
          //       child: Text(
          //         'Upgrade Your Profiles',
          //         style: TextStyle(color: Colors.red, fontSize: 16),
          //       ),
          //     )),
        ]));
  }

  Future<void> handleSignOut() async {
    authProvider.handleSignOut();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false,
    );
  }
}
