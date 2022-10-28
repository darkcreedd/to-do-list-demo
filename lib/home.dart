import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showWidget = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<DataClass>(
        builder: ((context, value, child) => Scaffold(
              appBar: AppBar(
                elevation: 1,
                centerTitle: true,
                title: const Text('To Do App'),
              ),
              body: Stack(children: [
                showWidget
                    ? ListView.builder(
                        itemCount: value.purpose.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            title: Text('${value.purpose[index]}'),
                            subtitle: Text('${value.date[index]}'),
                            trailing: IconButton(
                              splashRadius: 20,
                              icon: const Icon(Icons.delete),
                              onPressed: () =>
                                  context.read<DataClass>().popFromList(0),
                            ),
                          );
                        }))
                    : Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Card(
                          elevation: 10,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: value.purposeController,
                                    decoration: const InputDecoration(
                                      hintText: 'Purpose',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: value.dateController,
                                    decoration: const InputDecoration(
                                      hintText: 'Date',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: value.timeController,
                                    decoration: const InputDecoration(
                                      hintText: 'Time',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 100,
                                  child: OutlinedButton(
                                      onPressed: () {
                                        context.read<DataClass>().addToList(
                                            value.purposeController.text,
                                            value.timeController.text,
                                            value.dateController.text);
                                      },
                                      child: const Text('Save')),
                                )
                              ]),
                            ),
                          ),
                        ),
                      )
              ]),
              floatingActionButton: FloatingActionButton(
                tooltip: 'Add new task',
                onPressed: () {
                  setState(() {
                    showWidget = !showWidget;
                  });
                },
                child: const Icon(Icons.add),
              ),
            )));
  }
}
