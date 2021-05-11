import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_shopping_app/Constants/Constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.preferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserDetail>(
      create: (context) => UserDetail(),
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //Expanded is used to divide the screen into different Sections ...

            Expanded(
                flex:
                    6, //This is the number of divisions it can had there are 6 sections for this Expanded Widget
                child: Container(
                    color: Colors.black,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.width * 0.3,
                          horizontal:
                              MediaQuery.of(context).size.width * 0.007),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        )),
                        shadowColor: Colors.pinkAccent,
                        elevation: 8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 10),
                                  child: Text(
                                    "Log In",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.07,
                                    ),
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "With",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06,
                                  ),
                                )),
                            Divider(
                              thickness: 2,
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  IconButton(
                                      icon: FaIcon(FontAwesomeIcons.twitter),
                                      iconSize:
                                          MediaQuery.of(context).size.width *
                                              0.15,
                                      color: Colors.blue,
                                      splashRadius: 1,
                                      onPressed: () {
                                        print("twitter");
                                      }),
                                  Text(
                                    "Twitter",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  IconButton(
                                      icon: FaIcon(FontAwesomeIcons.facebook),
                                      iconSize:
                                          MediaQuery.of(context).size.width *
                                              0.15,
                                      color: Colors.blue,
                                      splashRadius: 1,
                                      onPressed: () {
                                        print("facebook");
                                        print("Hello");
                                      }),
                                  Text("Facebook",
                                      style: TextStyle(fontSize: 20))
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  IconButton(
                                      icon: FaIcon(FontAwesomeIcons.google),
                                      iconSize:
                                          MediaQuery.of(context).size.width *
                                              0.15,
                                      color: Colors.red,
                                      splashRadius: 1,
                                      onPressed: () {
                                        print("Google");
                                      }),
                                  Text("Google", style: TextStyle(fontSize: 20))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))),
            Expanded(
              flex: 14,
              child: Container(
                color: Colors.black,
                child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "I love Shriya",
                        style: TextStyle(color: Colors.pink, fontSize: 40),
                      ),
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class UserDetail extends ChangeNotifier {
  UserCredential userData;

  void setUserData(UserCredential user) {
    this.userData = user;
    notifyListeners();
  }
}
