class quotes_model {
  List<Quotes>? quotes;
  int? total;
  int? skip;
  int? limit;

  quotes_model({this.quotes, this.total, this.skip, this.limit});

  quotes_model.fromJson(Map<String, dynamic> json) {
    if (json['quotes'] != null) {
      quotes = <Quotes>[];
      json['quotes'].forEach((v) {
        quotes!.add(new Quotes.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quotes != null) {
      data['quotes'] = this.quotes!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    return data;
  }
}

class Quotes {
  int? id;
  String? quote;
  String? author;

  Quotes({this.id, this.quote, this.author});

  Quotes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quote = json['quote'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quote'] = this.quote;
    data['author'] = this.author;
    return data;
  }
}
