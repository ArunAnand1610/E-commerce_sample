import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commerce_project/Provider/productprovider.dart';
import 'package:e_commerce_project/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Duration  duration=Duration( seconds: 10) ;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController=AnimationController(vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        backgroundColor: Colors.orangeAccent,
        pageTransitionType: PageTransitionType.leftToRight,
        nextScreen: const ProductList(),
         splash: Lottie.network("https://assets10.lottiefiles.com/packages/lf20_5ngs2ksb.json",controller: _animationController,
         onLoaded: (load){
          _animationController
          ..duration=load.duration..forward();
         }
         ),splashIconSize: 400,
         //duration: 800,
         );
  }}