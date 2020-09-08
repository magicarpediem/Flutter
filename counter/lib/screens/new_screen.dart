import 'package:counter/data/counter.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  final int index;
  const NewScreen({Key key, @required this.index}) : super(key: key);
  @override
  _NewScreenState createState() => _NewScreenState(index: index);
}

class _NewScreenState extends State<NewScreen> {
  int index;
  Counter counter;
  TextEditingController nameTextController;
  TextEditingController descriptionTextController;
  TextEditingController countTextController;

  _NewScreenState({this.index});

  @override
  void initState() {
    super.initState();
    nameTextController = TextEditingController();
    nameTextController.text = 'New Counter';
    descriptionTextController = TextEditingController();
    countTextController = TextEditingController();
    countTextController.text = '0';
    counter = Counter();
    counter.index = index;
    counter.name = 'New Counter';
    counter.description = '';
    counter.count = 0;
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
        heroTag: 'newFab',
      ),
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
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
