import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        title: Text("About"),
        centerTitle: true,
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/logo.png'),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "Quote Bank",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "Developed by Christopher Lam",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "A simple application to store and save your favourite quotes.",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "This project is licensed under the GNU General Public License v3.0.",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      "See the project source code here:",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    FlatButton(
                      onPressed: launchURL,
                      child: Text(
                        "Github",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
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

launchURL() async {
  const url = 'https://github.com/christopherlam888/quote-bank';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
