import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:olimpicos/controllers/api_client.dart';
import 'package:olimpicos/utils/constants.dart';
import 'package:olimpicos/widgets/new_user_card.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 200,
        child: Row(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width - 600,
                child: Container(
                    child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: HelloCard(),
                    )
                  ],
                ))),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  width: 300,
                  height: 300,
                  child: SfCalendar(
                    view: CalendarView.week,
                    todayHighlightColor: primaryColor,
                    dataSource: MeetingDataSource(_getDataSource()),
                    headerHeight: 0,
                    monthViewSettings: const MonthViewSettings(
                        appointmentDisplayMode:
                            MonthAppointmentDisplayMode.appointment),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  width: 300,
                  height: 300,
                  child: SfCalendar(
                    view: CalendarView.month,
                    todayHighlightColor: primaryColor,
                    dataSource: MeetingDataSource(_getDataSource()),
                    monthViewSettings: const MonthViewSettings(
                        appointmentDisplayMode:
                            MonthAppointmentDisplayMode.appointment),
                  ),
                ),
              ],
            )
          ],
        ));
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

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
