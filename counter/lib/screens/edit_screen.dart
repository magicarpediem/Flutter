import 'package:counter/data/counter.dart';
import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  final Counter counter;

  const EditScreen({Key key, @required this.counter}) : super(key: key);
  @override
  _EditScreenState createState() => _EditScreenState(counter: counter);
}

class _EditScreenState extends State<EditScreen> {
  Counter counter;
  TextEditingController nameTextController;
  TextEditingController descriptionTextController;
  TextEditingController countTextController;

  _EditScreenState({this.counter});

  @override
  void initState() {
    super.initState();
    nameTextController = TextEditingController();
    nameTextController.text = '${counter.name}';
    descriptionTextController = TextEditingController();
    descriptionTextController.text = '${counter.description}';
    countTextController = TextEditingController();
    countTextController.text = '${counter.count}';
  }

  @override
  void dispose() {
    nameTextController.dispose();
    descriptionTextController.dispose();
    countTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.save),
        label: Text(
          'Save',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        onPressed: () => Navigator.pop(context, counter),
        heroTag: 'editFab',
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: FractionallySizedBox(
                        widthFactor: 0.75,
                        child: TextField(
                          controller: nameTextController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0.0),
                            hintText: 'Name',
                            hintStyle: Theme.of(context).textTheme.caption,
                          ),
                          onChanged: (value) => setState(() {
                            counter.name = value;
                          }),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.9,
                      child: TextField(
                        controller: descriptionTextController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0.0),
                          hintText: 'Description',
                          hintStyle: Theme.of(context).textTheme.caption,
                        ),
                        onChanged: (value) => setState(() {
                          counter.description = value;
                        }),
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: FractionallySizedBox(
                          widthFactor: 0.4,
                          child: TextField(
                            controller: countTextController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0.0),
                              hintText: 'Starting Count',
                              hintStyle: Theme.of(context).textTheme.caption,
                            ),
                            onChanged: (value) => setState(() {
                              counter.count = int.parse(value);
                            }),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
