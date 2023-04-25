import 'package:flutter/material.dart';
import 'package:olimpicos/screens/profile_screen.dart';
import 'package:olimpicos/screens/register_screen.dart';
import 'package:routemaster/routemaster.dart';
import 'package:provider/provider.dart';
import 'utils/constants.dart';
import 'controllers/api_client.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // ignore: prefer_const_constructors
          ChangeNotifierProvider(
              create: (_) => ApiClient(
                  apiUrl, null, null, ApiClientState.unauthenticated)),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerDelegate: RoutemasterDelegate(
              routesBuilder: (context) => RouteMap(routes: {
                    '/': (_) => const Redirect(loginPath),
                    loginPath: (routeData) =>
                        // Provider.of<ApiClient>(context, listen: false).state ==
                        //         ApiClientState.authenticated
                        //     ? const Redirect(foldersPath)
                        //     :
                        const MaterialPage(child: LoginScreen()),
                    registerPath: (routeData) =>
                        MaterialPage(child: RegisterScreen()),
                    profilePath: (routeData) =>
                        Provider.of<ApiClient>(context, listen: false).state ==
                                ApiClientState.authenticated
                            ? MaterialPage(child: ProfileScreen())
                            : const Redirect(loginPath),
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
