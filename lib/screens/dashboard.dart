import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:olimpicos/controllers/api_client.dart';
import 'package:olimpicos/screens/add_training_session.dart';
import 'package:olimpicos/screens/home_screen.dart';
import 'package:olimpicos/screens/search_screen.dart';
import 'package:olimpicos/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import '../widgets/menu_bar_widget.dart';
import '../widgets/vertical_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class UpTile extends StatefulWidget {
  final String title;
  final Function setPage;
  const UpTile({super.key, required this.title, required this.setPage});

  @override
  State<UpTile> createState() => _UpTileState();
}

class _UpTileState extends State<UpTile> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          widget.setPage(1, [widget.title]);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 15,
              color: primaryColor,
              fontWeight: isHover ? FontWeight.bold : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class _DashboardState extends State<Dashboard> {
  int pageNumber = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> params = [];
  List<Widget> screens = [Container(), Container()];
  ApiClient? apiClient;
  void changePageNumber(int number) {
    setState(() {
      pageNumber = number;
    });
  }

  void setPage(int page, List<String> params) {
    setState(() {
      pageNumber = page;
      this.params = params;
    });
  }

  void initState() {
    super.initState();
    apiClient = Provider.of<ApiClient>(context, listen: false);

    String role = apiClient!.role;
    if (role == 'trainee') {
      screens = [
        const HomeScreen(),
        SearchScreen(params: params),
      ];
    }
    if (role == "trainer") {
      screens = [
        const HomeScreen(),
        const AddTSession(),
      ];
    }
    if (role == 'manager') {
      screens = [
        const HomeScreen(),
        const AddTrainee(),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    apiClient = Provider.of<ApiClient>(context, listen: false);
    if (apiClient!.state == ApiClientState.unauthenticated) {
      Routemaster.of(context).replace(loginPath);
    }
    Size size = MediaQuery.of(context).size;
    bool isMobile = size.width < 900;
    final width = size.width * 0.15;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          title: Row(
            children: [
              logo(1),
              SizedBox(width: MediaQuery.of(context).size.width - 600),
              UpTile(title: 'Clubs', setPage: setPage),
              UpTile(title: "Trainers", setPage: setPage),
              UpTile(title: "Training Sessions", setPage: setPage),
              UpTile(title: "Athletes", setPage: setPage),
            ],
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black,
          )),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (!isMobile)
                CustomVerticalAppBar(
                  width: 250,
                  // width: width,
                  changePageNumber: changePageNumber,
                  number: pageNumber,
                  menus: menus,
                ),
              Expanded(child: screens[pageNumber])
            ],
          ),
        ],
      ),
    );
  }
}

class AddTrainee extends StatefulWidget {
  const AddTrainee({super.key});

  @override
  State<AddTrainee> createState() => _AddTraineeState();
}

class _AddTraineeState extends State<AddTrainee> {
  String token = "";
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Generate an invite link to add a trainee"),
        ElevatedButton(
            onPressed: () async {
              ApiClient apiClient =
                  Provider.of<ApiClient>(context, listen: false);
              String inviteCode = await apiClient.generateInvite();
              setState(() {
                token = inviteCode;
              });
            },
            child: const Text("Generate")),
        Container(
          padding: EdgeInsets.only(top: 20),
          width: 200,
          height: 65,
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: primaryColor),
              ),
              focusColor: primaryColor,
              prefixIconColor: primaryColor,
              suffixIconColor: primaryColor,
              iconColor: primaryColor,
              labelText: "Token",
              hintText: "",
              labelStyle: TextStyle(color: primaryColor),
              filled: true,
            ),
          ),
        ),
      ],
    );
  }
}
