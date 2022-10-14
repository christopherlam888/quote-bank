import 'package:flutter/material.dart';
import 'package:quote_bank/classes/quote.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Quote> quotes = [
    Quote(text: "The best way to find out if you can trust someone is to trust them.",
          author: "Ernest Hemingway"),
    Quote(text: "Life without examination is not worth living.",
          author: "Plato"),
  ];

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

  void saveData(){
    List<String> spList = quotes.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences.setStringList('list', spList);
  }

  void loadData(){
    List<String> spList = sharedPreferences.getStringList('list');
    quotes = spList.map((item) => Quote.fromMap(json.decode(item))).toList();
    setState(() {});
  }

  void edit(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          content: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 5.0),
                  TextFormField(
                    initialValue: quotes[index].text,
                    onChanged: (text) {
                      if (text.isNotEmpty){
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
                      labelText:"Quote",
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.indigo[400],
                          width: 3,
                        ),
                      ),
                      fillColor: Colors.grey[800],
                      filled: true,
                    ),
                    style: TextStyle(
                      color: Colors.white,
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
                      labelText:"Author",
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.indigo[400],
                          width: 3,
                        ),
                      ),
                      fillColor: Colors.grey[800],
                      filled: true,
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: Text("My Quote Bank"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
            icon: Icon(Icons.info)
        ),
        actions: [
          IconButton(
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/addQuote');
                setState(() {
                  Quote newQuote = Quote(text: result['text'], author: result['author']);
                  quotes.add(newQuote);
                  saveData();
                });
              },
              icon: Icon(Icons.add)
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
          child: ListView.builder(
            itemCount: quotes.length,
            itemBuilder: (context, index){
              return Card(
                color: Colors.grey[900],
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              quotes[index].text,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              " - ${quotes[index].author}",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  edit(index);
                                },
                                icon: Icon(Icons.edit, color: Colors.white),
                              ),
                              IconButton(
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(text: quotes[index].text));
                                },
                                icon: Icon(Icons.content_copy, color: Colors.white),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quotes.remove(quotes[index]);
                                    saveData();
                                  });
                                },
                                icon: Icon(Icons.delete, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
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