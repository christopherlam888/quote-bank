import 'package:flutter/material.dart';
import 'package:quote_bank/classes/quote.dart';
import 'package:quote_bank/pages/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Quote> quotes = [
    Quote(
        text:
            "The best way to find out if you can trust someone is to trust them.",
        author: "Ernest Hemingway"),
    Quote(
        text: "Life without examination is not worth living.", author: "Plato"),
  ];

  bool showControls = false;

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    initSharedPreferences();
    super.initState();
  }

  initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  void saveData() {
    List<String> spList =
        quotes.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences.setStringList('list', spList);
  }

  void loadData() {
    List<String> spList = sharedPreferences.getStringList('list');
    quotes = spList.map((item) => Quote.fromMap(json.decode(item))).toList();
    showControls = sharedPreferences.getBool('showControls') ?? false;
    setState(() {});
  }

  void edit(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.background,
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 5.0),
                    TextFormField(
                      initialValue: quotes[index].text,
                      onChanged: (text) {
                        if (text.isNotEmpty) {
                          setState(() {
                            quotes[index].text = text;
                            saveData();
                          });
                        }
                      },
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 10,
                      decoration: InputDecoration(
                        labelText: "Quote",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.indigo[400],
                            width: 3,
                          ),
                        ),
                        fillColor: Theme.of(context).colorScheme.secondary,
                        filled: true,
                      ),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      initialValue: quotes[index].author,
                      onChanged: (author) {
                        setState(() {
                          quotes[index].author = author;
                          saveData();
                        });
                      },
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: "Author",
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.indigo[400],
                            width: 3,
                          ),
                        ),
                        fillColor: Theme.of(context).colorScheme.secondary,
                        filled: true,
                      ),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          "My Quote Bank",
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              dynamic result = await Navigator.pushNamed(context, '/addQuote');
              setState(() {
                Quote newQuote =
                    Quote(text: result['text'], author: result['author']);
                quotes.add(newQuote);
                saveData();
              });
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                showControls = !showControls;
                sharedPreferences.setBool('showControls', showControls);
              });
            },
            icon: Icon(Icons.build),
          ),
        ],
      ),
      drawer: NavBar(),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
          child: ListView.builder(
            itemCount: quotes.length,
            itemBuilder: (context, index) {
              return Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: SelectableText(
                              quotes[index].text,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: SelectableText(
                              " - ${quotes[index].author}",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      if (showControls) ...[
                        SizedBox(
                          height: 5.0,
                        ),
                        Divider(
                            height: 5.0,
                            color: Theme.of(context).colorScheme.primary),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (index != 0) {
                                      setState(() {
                                        Quote temp = quotes[index];
                                        quotes[index] = quotes[index - 1];
                                        quotes[index - 1] = temp;
                                        saveData();
                                      });
                                    }
                                  },
                                  icon: Icon(Icons.arrow_upward,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (index != quotes.length - 1) {
                                      setState(() {
                                        Quote temp = quotes[index];
                                        quotes[index] = quotes[index + 1];
                                        quotes[index + 1] = temp;
                                        saveData();
                                      });
                                    }
                                  },
                                  icon: Icon(Icons.arrow_downward,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    edit(index);
                                  },
                                  icon: Icon(Icons.edit,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Clipboard.setData(ClipboardData(
                                        text: quotes[index].text));
                                  },
                                  icon: Icon(Icons.content_copy,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      quotes.remove(quotes[index]);
                                      saveData();
                                    });
                                  },
                                  icon: Icon(Icons.delete,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ]
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
