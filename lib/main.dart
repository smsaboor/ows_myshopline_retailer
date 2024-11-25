import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ows_myshopline_retailer/constants/app_constants.dart';
import 'package:ows_myshopline_retailer/providers/product_provider.dart';
import 'package:ows_myshopline_retailer/providers/providers.dart';
import 'package:ows_myshopline_retailer/route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ows_myshopline_retailer/bloc_core/theme/theme_cubit.dart';
import 'package:ows_myshopline_retailer/bloc_core/data_connection_checker/network_cubit.dart';
import 'package:ows_myshopline_retailer/bloc_core/bottom_nav/bottom_nav_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NetworkCubit.init();
  HttpOverrides.global = new MyHttpOverrides();
  await Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final isLogin = preferences.getBool('isLogin') ?? false;
  final isFirst = preferences.getBool('onboarding') ?? true;
  runApp(MyApp(
    prefs: preferences,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({required this.prefs});
  final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final fontFamily = 'Poppins';
  bool displaySplashImage = true;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) =>
              AuthProvider(
                firebaseAuth: FirebaseAuth.instance,
                googleSignIn: GoogleSignIn(),
                prefs: this.prefs,
                firebaseFirestore: this.firebaseFirestore,
              ),
        ),
        Provider<SettingProvider>(
          create: (_) =>
              SettingProvider(
                prefs: this.prefs,
                firebaseFirestore: this.firebaseFirestore,
                firebaseStorage: this.firebaseStorage,
              ),
        ),
        Provider<HomeProvider>(
          create: (_) =>
              HomeProvider(
                firebaseFirestore: this.firebaseFirestore,
              ),
        ),
        Provider<ChatProvider>(
          create: (_) =>
              ChatProvider(
                prefs: this.prefs,
                firebaseFirestore: this.firebaseFirestore,
                firebaseStorage: this.firebaseStorage,
              ),
        ),
        Provider<ProductProvider>(
          create: (_) =>
              ProductProvider(
                prefs: this.prefs,
                firebaseFirestore: this.firebaseFirestore,
                firebaseStorage: this.firebaseStorage,
              ),
        ),
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => ThemeCubit(),
        ),
        BlocProvider<NetworkCubit>(
          create: (BuildContext context) => NetworkCubit.instence,
        ),
        BlocProvider<BottomNavCubit>(
          create: (BuildContext context) => BottomNavCubit(),
        ),
      ],
      child:
      BlocBuilder<ThemeCubit, ThemeState>(builder: (context, themeState) {
        return MaterialApp(
          title: AppConstants.appTitle,
          debugShowCheckedModeBanner: false,
          theme: themeState.currentTheme,
          initialRoute: "/splash",
          onGenerateRoute: (route) => RouteGenerator.generateRoute(route),
        );
      }),
    );
  }
}
