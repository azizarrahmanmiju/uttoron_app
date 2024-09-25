import 'package:flutter/material.dart';
import 'package:uttoron_app/Screen/add_new.dart';
import 'package:uttoron_app/model/mealitembp.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Mealitembp> _addedMeals = [];

  void _removed (Mealitembp item){
    setState(() {
      _addedMeals.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Uttoron App"),
        actions: [
          IconButton(
            onPressed: () async {
              final newData = await Navigator.of(context).push<Mealitembp>(
                MaterialPageRoute(builder: (context) => const AddNew()),
              );

              if (newData != null) {
                setState(() {
                  _addedMeals.add(newData);
                });
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: _addedMeals.length,
          itemBuilder: (ctx, index) {
            final meal = _addedMeals[index];
            return Dismissible(
              onDismissed: (direction)=> _removed(meal),
              key: ValueKey(meal.id),
              child: Card(
                clipBehavior:Clip.hardEdge,
                color: Theme.of(context).colorScheme.background,
                child: ListTile(
                  title: Text(meal.name),
                  leading: Container(
                   color: meal.catagory.color,
                    height: 20,
                    width: 20,
                  ),
                  trailing: Text(meal.quantity.toString()),
                ),
              ),
            );
          },
        ),
      
    );
  }
}
