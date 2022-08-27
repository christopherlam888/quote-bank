import 'package:flutter/material.dart';
import 'package:quote_bank/classes/quote.dart';

class AddQuote extends StatefulWidget {
  @override
  _AddQuoteState createState() => _AddQuoteState();
}

class _AddQuoteState extends State<AddQuote> {

  TextEditingController textController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  String errorMessage = " ";
  Quote newQuote = Quote();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        title: Text("Add Quote"),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Text(
                "Please enter the quote information:",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 10,
                controller: textController,
                decoration: InputDecoration(
                  hintText: "Enter a quote",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
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
              TextField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 3,
                controller: authorController,
                decoration: InputDecoration(
                  hintText: "Enter the quote author",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
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
              SizedBox(height: 15.0),
              RaisedButton(
                padding: EdgeInsets.all(10.0),
                color: Colors.indigo[400],
                child: Text(
                    "Enter",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    )
                ),
                onPressed: () {
                  if (textController.text.isEmpty){
                    setState(() {
                      errorMessage = "Please enter a quote!";
                    });
                  } else {
                    Navigator.pop(context, {
                      'text' : textController.text,
                      'author' : authorController.text,
                    });
                  }
                },
              ),
              SizedBox(height: 5.0),
              Text(
                errorMessage,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}