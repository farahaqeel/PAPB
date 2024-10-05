import 'package:flutter/material.dart';

void main() => runApp(AddRoutineApp());

class AddRoutineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Add Routine',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddRoutinePage(),
    );
  }
}

class AddRoutinePage extends StatefulWidget {
  @override
  _AddRoutinePageState createState() => _AddRoutinePageState();
}

class _AddRoutinePageState extends State<AddRoutinePage> {
  final _formKey = GlobalKey<FormState>();
  String _activityName = '';
  TimeOfDay _selectedTime = TimeOfDay.now();
  String? _selectedPeriod; // To store selected period (Morning, Noon, Night)
  
  final List<String> _periodOptions = ['Morning', 'Noon', 'Night'];

  // Function to select a time
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  // Function to handle form submission
  void _addRoutine() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Saves the form
      
      // Determine if a time period was selected
      String routineTime = _selectedPeriod != null 
          ? '$_selectedPeriod (${_selectedTime.format(context)})' 
          : _selectedTime.format(context);
      
      // Now _activityName and routineTime are used here
      print('Activity: $_activityName, Time: $routineTime');
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Routine added: $_activityName at $routineTime')),
      );
    }
  }

  // Function to handle the period selection and update the selected time
  void _onPeriodSelected(String? value) {
    setState(() {
      _selectedPeriod = value;
      if (value == 'Morning') {
        _selectedTime = TimeOfDay(hour: 8, minute: 0);
      } else if (value == 'Noon') {
        _selectedTime = TimeOfDay(hour: 12, minute: 0);
      } else if (value == 'Night') {
        _selectedTime = TimeOfDay(hour: 20, minute: 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Routine'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Activity Name',
                ),
                onSaved: (value) {
                  _activityName = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an activity name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _selectedPeriod,
                hint: Text('Select a Period'),
                items: _periodOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: _onPeriodSelected,
                decoration: InputDecoration(
                  labelText: 'Select Time Period',
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Text(
                    "Selected Time: ${_selectedTime.format(context)}",
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => _selectTime(context),
                    child: Text('Choose Time'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _addRoutine, // Call the function to handle form submission
                  child: Text('Add Routine'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
