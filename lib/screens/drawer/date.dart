import 'package:flutter/material.dart';
import 'package:stylish/screens/home/home_screen.dart';

class DatePage extends StatefulWidget {
  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${date.day}/${date.month}/${date.year}',style: TextStyle(fontSize: 20),),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: Text(
                'Date',
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(1970),
                  lastDate: DateTime(2050),
                );
                if (newDate == null) return;
                setState(() {
                  date = newDate;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
