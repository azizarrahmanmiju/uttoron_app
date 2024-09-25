import 'package:flutter/material.dart';
import 'package:uttoron_app/data/cetagories.dart';
import 'package:uttoron_app/model/Category.dart';
import 'package:uttoron_app/model/mealitembp.dart';

class AddNew extends StatefulWidget {
  const AddNew({super.key});

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  final _formKey = GlobalKey<FormState>();
  Catagory? dropdownValue = categories.values.first;
  String enteredName = '';
  int enteredQuantity = 1;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop(
        Mealitembp(
          catagory: dropdownValue!,
          name: enteredName,
          quantity: enteredQuantity,
          id: DateTime.now().toString(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onSaved: (newValue) {
                  enteredName = newValue!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Enter Meal",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onSaved: (value) {
                        if (value != null) {
                          enteredQuantity = int.parse(value);
                        }
                      },
                      initialValue: enteredQuantity.toString(),
                      decoration: InputDecoration(
                        labelText: "Add Quantity",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  DropdownButton<Catagory>(
                    value: dropdownValue,
                    items: categories.entries.map((category) {
                      return DropdownMenuItem<Catagory>(
                        value: category.value,
                        child: Row(
                          children: [
                            Container(height: 16, width: 16, color: category.value.color),
                            const SizedBox(width: 10),
                            Text(category.value.title),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value;
                      });
                    },
                    hint: const Text("Select a Category"),
                  ),
                ],
              ),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                      setState(() {
                        enteredName = '';
                        enteredQuantity = 1;
                        dropdownValue = categories.values.first;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Data Cleared")));
                    },
                    child: Text("Reset"),
                  ),
                  TextButton(
                    onPressed: _submit,
                    child: Text("Save"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
