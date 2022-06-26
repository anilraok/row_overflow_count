import 'package:flutter/material.dart';
import 'package:row_overflow_count/row_overflow_count.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Row Overflow Count',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget getTextContainer(String name) {
      return Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(right: 8),
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Row",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  getTextContainer("Anil Rao K"),
                  getTextContainer("Amanda Klein"),
                  getTextContainer("Christopher Mendoza"),
                  getTextContainer("James Burton"),
                  getTextContainer("Judy Wright"),
                  getTextContainer("Steven Reid"),
                ],
              ),
              SizedBox(height: 32),
              Text(
                "ListView (Horizontal ScrollDirection)",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 50,
                child: Scrollbar(
                  thumbVisibility: true,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      getTextContainer("Anil Rao K"),
                      getTextContainer("Amanda Klein"),
                      getTextContainer("Christopher Mendoza"),
                      getTextContainer("James Burton"),
                      getTextContainer("Judy Wright"),
                      getTextContainer("Steven Reid"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32),
              Text(
                "RowOverflowCount",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              RowOverflowCount(
                labels: const [
                  "Anil Rao K",
                  "Amanda Klein",
                  "Christopher Mendoza",
                  "James Burton",
                  "Judy Wright",
                  "Steven Reid",
                  "Megan Morrow",
                  "Michael Davis",
                  "Richard Hamilton",
                  "James Clark",
                  "Hannah Dunlap",
                  "Paul Myers",
                  "Sylvia Boone",
                  "Evelyn Ballard",
                  "George Davis",
                  "Tracy Riley",
                ],
                labelTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                labelPadding: const EdgeInsets.all(8),
                labelMargin: const EdgeInsets.only(right: 8),
                labelClickListener: (label) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('$label Clicked'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
                overflowTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                overflowPadding: const EdgeInsets.all(8),
                overflowMargin: const EdgeInsets.all(8),
                overflowClickListener: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Overflow Clicked'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              RowOverflowCount(
                labels: const [
                  "Anil Rao",
                  "Amanda Klein",
                  "Christopher",
                  "James Burton",
                  "Judy Wright",
                  "Steven Reid",
                  "Megan Morrow",
                  "Michael Davis",
                  "Richard Hamilton",
                  "James Clark",
                  "Hannah Dunlap",
                  "Paul Myers",
                  "Sylvia Boone",
                  "Evelyn Ballard",
                  "George Davis",
                  "Tracy Riley",
                ],
                labelTextStyle: TextStyle(),
                labelPadding: EdgeInsets.all(8),
                labelMargin: EdgeInsets.symmetric(horizontal: 4),
                labelDecoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                overflowTextStyle: TextStyle(
                  color: Colors.deepPurpleAccent.shade700,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                overflowPadding: EdgeInsets.all(8),
                overflowMargin: EdgeInsets.all(8),
                overflowDecoration: BoxDecoration(),
                overflowTextBuilder: (int count) => "+ $count more",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
