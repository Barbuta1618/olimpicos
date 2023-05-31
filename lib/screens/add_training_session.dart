import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/constants.dart';

import '../widgets/input_widgets.dart';

class AddTSession extends StatefulWidget {
  const AddTSession({super.key});

  @override
  State<AddTSession> createState() => _AddTSessionState();
}

class _AddTSessionState extends State<AddTSession> {
  List<Map<String, dynamic>> times = [
    {'day': 'Monday', 'time': ''},
    {'day': 'Tuesday', 'time': ''},
    {'day': 'Wednesday', 'time': ''},
    {'day': 'Thursday', 'time': ''},
    {'day': 'Friday', 'time': ''},
    {'day': 'Saturday', 'time': ''},
    {'day': 'Sunday', 'time': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Container(
                child: const Text('Add ',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87)),
              ),
              const Text('Training',
                  style: TextStyle(
                      fontSize: 31,
                      fontWeight: FontWeight.bold,
                      color: primaryColor)),
              const Text(' Session',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 40),
            child: Row(
              children: times.map((e) {
                // make a time picker for each day
                return Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      Text(e['day'], style: GoogleFonts.inter(fontSize: 15)),
                      const SizedBox(height: 2),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(color: primaryColor)),
                            ),
                          ),
                          onPressed: () async {
                            TimeOfDay? time = await showTimePicker(
                                context: context, initialTime: TimeOfDay.now());
                            if (time != null) {
                              setState(() {
                                e['time'] = time.format(context);
                              });
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              e['time'] == '' ? 'Select Time' : e['time'],
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ))
                    ],
                  ),
                );
              }).toList(),
            )),

        SizedBox(height: 40),
        // set the sport as a dropt down
        Row(
          children: [
            Container(
              // input for location
              padding: EdgeInsets.only(top: 20),
              width: 580,
              child: const TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  focusColor: primaryColor,
                  prefixIconColor: primaryColor,
                  suffixIconColor: primaryColor,
                  iconColor: primaryColor,
                  labelText: "Location",
                  hintText: "Enter a location",
                  labelStyle: TextStyle(color: primaryColor),
                  filled: true,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Container(
                padding: EdgeInsets.only(top: 20),
                width: 200,
                child: DropdownSearch<String>(
                  items: sports,
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      focusColor: primaryColor,
                      hoverColor: primaryColor,
                      prefixIconColor: primaryColor,
                      suffixIconColor: primaryColor,
                      iconColor: primaryColor,
                      labelText: "Sport",
                      hintText: "Select a sport",
                      labelStyle: TextStyle(color: primaryColor),
                      filled: true,
                    ),
                  ),
                )),
            const SizedBox(width: 20),
            // drop down for the proficiency level
            Container(
                padding: EdgeInsets.only(top: 20),
                width: 200,
                child: DropdownSearch<String>(
                  items: ['Beginner', 'Intermediate', 'Advanced'],
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      focusColor: primaryColor,
                      hoverColor: primaryColor,
                      prefixIconColor: primaryColor,
                      suffixIconColor: primaryColor,
                      iconColor: primaryColor,
                      labelText: "Level",
                      hintText: "Select a level",
                      labelStyle: TextStyle(color: primaryColor),
                      filled: true,
                    ),
                  ),
                )),
          ],
        ),
        SizedBox(height: 40),
        // input for max capacity

        Column(
          children: [
            Row(
              children: [
                Container(
                  child: const Text('Don\'t forget to add a ',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87)),
                ),
                const Text('capacity',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: primaryColor)),
                const Text('!',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              width: 200,
              height: 65,
              child: const TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  focusColor: primaryColor,
                  prefixIconColor: primaryColor,
                  suffixIconColor: primaryColor,
                  iconColor: primaryColor,
                  labelText: "Max Capacity",
                  hintText: "Enter a number",
                  labelStyle: TextStyle(color: primaryColor),
                  filled: true,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: primaryColor)),
                    ),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.5),
                    child: Text(
                      'Add Session',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
