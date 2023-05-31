import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:olimpicos/screens/dashboard.dart';
import 'package:olimpicos/screens/profile_screen.dart';
import 'package:olimpicos/screens/register_screen.dart';
import 'package:routemaster/routemaster.dart';
import 'package:provider/provider.dart';
import 'utils/constants.dart';
import 'controllers/api_client.dart';
import 'screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

//check in secure storage if user is logged in

class Global {
  static String authToken = "";
}

Future<void> checkStorage() async {
  final storage = FlutterSecureStorage();
  String? token = await storage.read(key: "authToken");

  Global.authToken = token ?? "";
}

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await checkStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var apiClient = ApiClient(
        apiUrl, Global.authToken, null, ApiClientState.unauthenticated);
    return MultiProvider(
        providers: [
          // ignore: prefer_const_constructors
          ChangeNotifierProvider(create: (_) => apiClient),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: RoutemasterDelegate(
              routesBuilder: (context) => RouteMap(routes: {
                    loginPath: (routeData) =>
                        Provider.of<ApiClient>(context, listen: false).state ==
                                ApiClientState.authenticated
                            ? const Redirect(dashboardPath)
                            : MaterialPage(child: LoginScreen()),
                    registerPath: (routeData) =>
                        MaterialPage(child: RegisterScreen()),
                    profilePath: (routeData) =>
                        Provider.of<ApiClient>(context, listen: false).state ==
                                ApiClientState.authenticated
                            ? MaterialPage(child: ProfileScreen())
                            : const Redirect(loginPath),
                    dashboardPath: (routeData) =>
                        MaterialPage(child: Dashboard()),
                    '/': (_) => const Redirect(loginPath),
                  })),
          // ignore: prefer_const_constructors
          routeInformationParser: RoutemasterParser(),
          title: 'Olimpicos',
          // darkTheme: buildDarkThemeData(context),
          // theme: buildLightThemeData(context)
        ));
  }
}

class Unauthorized extends StatelessWidget {
  const Unauthorized({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      const Text('You are not authorized to access this page'),
      ElevatedButton(
          onPressed: () {
            Routemaster.of(context).replace(loginPath);
          },
          child: const Text('Login'))
    ])));
  }
}
