import 'package:counter/components/reusable_card.dart';
import 'package:counter/data/counter.dart';
import 'package:counter/screens/edit_screen.dart';
import 'package:counter/screens/new_screen.dart';
import 'package:counter/util/constants.dart';
import 'package:counter/util/json_loader.dart';
import 'package:counter/util/settings_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Counter> _counters = [];
  Counter _counter;
  JsonLoader _loader;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    _loader = new JsonLoader();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String str = SettingsProvider.of(context).settings.theme;
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          // Load counters with properties set in filter
          future: _loader.loadCounters(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              // Show loading sign while waiting
              return Center(child: CircularProgressIndicator());
            } else {
              _counters = snapshot.data;
              return PageView.builder(
                controller: pageController,
                itemCount: _counters.length,
                itemBuilder: (context, index) {
                  _counter = _counters[index];
                  return Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: PopupMenuButton<String>(
                          onSelected: (choice) async {
                            if ('Edit' == choice) {
                              final newCounter = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditScreen(
                                    counter: _counter,
                                  ),
                                ),
                              );
                              setState(() {
                                _counters.removeAt(_counter.index);
                                _counters.insert(newCounter.index, newCounter);
                                _counter = newCounter;
                              });
                            } else {
                              final newCounter = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewScreen(
                                    index: _counters.length,
                                  ),
                                ),
                              );
                              if (newCounter.name.isEmpty) {
                                newCounter.name = 'New Counter';
                              }
                              newCounter.description ??= '';
                              newCounter.count ??= 0;
                              setState(() {
                                _counters.insert(newCounter.index, newCounter);
                                _counter = newCounter;
                                pageController.jumpToPage(
                                  newCounter.index,
                                );
                              });
                            }
                          },
                          itemBuilder: (context) => <PopupMenuEntry<String>>[
                            buildItem('Edit', Icons.edit),
                            buildItem('New', Icons.add),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${_counter.name}',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                Text(
                                  '${_counter.description}',
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 9,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  flex: 13,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Text(
                                        '${_counter.count}',
                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                      Opacity(
                                        opacity: 0.0,
                                        child: InkWell(
                                          onTap: () => setState(() => _counter.increment()),
                                          child: Container(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 15,
                                  child: Column(
                                    children: <Widget>[
                                      Flexible(
                                        flex: 3,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Expanded(
                                              child: ReusableCard(
                                                color: kBorderColor,
                                                onPress: () => setState(() => _counter.decrement()),
                                                cardChild: Center(
                                                  child: Icon(Icons.remove),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: ReusableCard(
                                                color: kBorderColor,
                                                onPress: () => setState(() => _counter.increment()),
                                                cardChild: Center(
                                                  child: Icon(Icons.add),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              child: ReusableCard(
                                                color: kBorderColor,
                                                onPress: () => setState(() => _counter.reset()),
                                                cardChild: Center(
                                                  child: Icon(Icons.refresh),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: ReusableCard(
                                                color: kBorderColor,
                                                onPress: () => setState(() => _counter.reset()),
                                                cardChild: Center(
                                                  child: Text(
                                                    'New Lap',
                                                    style: Theme.of(context).textTheme.caption,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  PopupMenuItem<String> buildItem(String str, IconData icon) => PopupMenuItem(
        value: str,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(str),
            Icon(icon),
          ],
        ),
      );
}
