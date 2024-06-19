import 'package:flutter/material.dart';

class DateInputPage extends StatefulWidget {
  @override
  _DateInputPageState createState() => _DateInputPageState();
}

class _DateInputPageState extends State<DateInputPage> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  bool _isStartDateWeekend = false;
  bool _isEndDateWeekend = false;

  bool isWeekend(DateTime date) {
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }

  void _checkDates() {
    DateTime? startDate;
    DateTime? endDate;

    try {
      startDate = DateTime.parse(_startDateController.text);
    } catch (e) {
      startDate = null;
    }

    try {
      endDate = DateTime.parse(_endDateController.text);
    } catch (e) {
      endDate = null;
    }

    setState(() {
      _isStartDateWeekend = startDate != null && isWeekend(startDate);
      _isEndDateWeekend = endDate != null && isWeekend(endDate);
    });

    if (startDate == null || endDate == null) {
      _showErrorDialog('Please enter valid dates.');
    } else {
      _showResultDialog();
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showResultDialog() {
    String message = '';
    if (_isStartDateWeekend) {
      message += 'Start Date is a weekend.\n';
    }
    if (_isEndDateWeekend) {
      message += 'End Date is a weekend.\n';
    }
    if (message.isEmpty) {
      message = 'Neither date is a weekend.';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Date Check Result'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Input Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _startDateController,
              decoration: InputDecoration(
                labelText: 'Start Date (yyyy-mm-dd)',
                hintText: 'Enter start date',
              ),
              keyboardType: TextInputType.datetime,
            ),
            TextField(
              controller: _endDateController,
              decoration: InputDecoration(
                labelText: 'End Date (yyyy-mm-dd)',
                hintText: 'Enter end date',
              ),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkDates,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
