import 'package:flutter/material.dart';
import 'package:rahulandaisha/home.dart';

Color primary = Color.fromARGB(255, 195, 143, 255);
Color secondary = Color.fromARGB(255, 255, 206, 251);
Color button = Color.fromARGB(255, 245, 88, 70);
Color textColor = Colors.white.withOpacity(0.9);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rahul and Aisha',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String password = '';

  void homePage(String password) {
    if (password == 'r') {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
          transitionDuration: Duration(milliseconds: 1000), // adjust as needed
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Heartbeat animation
            var curve = Curves.easeInOut;
            var pulseTween = Tween<double>(begin: 0.95, end: 1.0)
                .chain(CurveTween(curve: curve));
            var pulseAnimation = animation.drive(pulseTween);

            // Fade animation
            var fadeTween = Tween<double>(begin: 0.0, end: 1.0)
                .chain(CurveTween(curve: curve));
            var fadeAnimation = animation.drive(fadeTween);

            return ScaleTransition(
              scale: pulseAnimation,
              child: FadeTransition(
                opacity: fadeAnimation,
                child: child,
              ),
            );
          },
        ),
      );
    } else {
      final snackBar = SnackBar(
        content: Text('Wrong password'),
        backgroundColor: primary,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          bool isLargeScreen = constraints.maxWidth > 800;

          double containerWidth = isLargeScreen ? width * 0.45 : width * 0.8;
          double containerHeight =
              isLargeScreen ? height * 0.45 : height * 0.85;
          double textFieldWidth = isLargeScreen ? width * 0.3 : width * 0.7;
          double buttonWidth = isLargeScreen ? width * 0.2 : width * 0.5;
          double buttonHeight = isLargeScreen ? height * 0.06 : height * 0.1;

          return Scaffold(
            body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                bool isLargeScreen = constraints.maxWidth > 800;

                double containerWidth =
                    isLargeScreen ? width * 0.45 : width * 0.8;
                double containerHeight =
                    isLargeScreen ? height * 0.4 : height * 0.8;
                double textFieldWidth =
                    isLargeScreen ? width * 0.3 : width * 0.7;
                double buttonWidth = isLargeScreen ? width * 0.2 : width * 0.5;
                double buttonHeight =
                    isLargeScreen ? height * 0.06 : height * 0.1;

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: width,
                      color: secondary,
                    ),
                    Container(
                      width: containerWidth,
                      height: containerHeight,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(
                            20), // This makes the corners rounded
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('password',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: textColor,
                                  fontFamily: 'playpenSans')),
                          SizedBox(height: height * 0.03),
                          Container(
                            width: textFieldWidth,
                            child: TextField(
                              obscureText: true,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily:
                                    'playPenSans', // Set input text color to black
                              ),
                              decoration: InputDecoration(
                                labelText: 'enter your password',
                                labelStyle: TextStyle(
                                  color: textColor,
                                  fontFamily:
                                      'playpenSans', // Set hint text color to black
                                ),
                                fillColor: Colors.white.withOpacity(
                                    0.2), // Set background color of the text field to white
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 15), // Add some internal padding
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      15), // Very rounded corners
                                  borderSide: BorderSide.none, // Remove border
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      15), // Very rounded corners when focused
                                  borderSide:
                                      BorderSide.none, // Remove focused border
                                ),
                              ),
                              onChanged: (value) {
                                password = value;
                              },
                            ),
                          ),
                          SizedBox(height: height * 0.03),
                          Container(
                            width: buttonWidth,
                            height: buttonHeight,
                            child: ElevatedButton(
                              onPressed: () {
                                homePage(password);
                              },
                              child: Text(
                                'submit',
                                style: TextStyle(
                                    color: textColor,
                                    fontFamily: 'playpenSans'),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: button,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
