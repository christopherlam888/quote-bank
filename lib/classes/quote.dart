class Quote {
  String text;
  String author;
  Quote({this.text, this.author});

  Quote.fromMap(Map map) :
        this.text = map['text'],
        this.author = map['author'];

  Map toMap(){
    return {
      'text': this.text,
      'author': this.author,
    };
  }
}