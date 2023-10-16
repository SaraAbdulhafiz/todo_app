import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/shared/network/firebase/firebase_manager.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            textAlign: TextAlign.center,
            "Add New Task",
            style: GoogleFonts.poppins(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              label: Text("Task Title"),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
          SizedBox(height: 18),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
              label: Text("Task Description"),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
          SizedBox(height: 18),
          Text(
            "Select Date",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 9),
          InkWell(
            onTap: () {
              selectDate();
            },
            child: Text(
              textAlign: TextAlign.center,
              selectedDate.toString().substring(0, 10),
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(height: 18),
          ElevatedButton(
            style: ElevatedButton.styleFrom(),
            onPressed: () {
              TaskModel task = TaskModel(
                title: titleController.text,
                description: descriptionController.text,
                date: DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch,
              );
              FirebaseManager.addTask(task);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Successfully"),
                    content: Text("Task Added to firebase "),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text("Thank You"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text("Add Task"),
          ),
        ],
      ),
    );
  }

  selectDate() async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate == null) {
      return;
    }
    selectedDate = chosenDate;
    setState(() {});
  }
}
