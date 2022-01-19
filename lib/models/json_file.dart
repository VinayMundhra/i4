class CatalogModel {
  Info? info;
  static List<Item>? item;

  CatalogModel({
    this.info
  });

  CatalogModel.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ?  Info.fromJson(json['info']) : null;
    if (json['item'] != null) {
      item = <Item>[];
      json['item'].forEach((v) {
        item!.add( Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (info != null) {
      data['info'] = info!.toJson();
    }
    if (item != null) {
      data['item'] = item!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  String? sPostmanId;
  String? name;
  String? schema;

  Info({this.sPostmanId, this.name, this.schema});

  Info.fromJson(Map<String, dynamic> json) {
    sPostmanId = json['_postman_id'];
    name = json['name'];
    schema = json['schema'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_postman_id'] = this.sPostmanId;
    data['name'] = this.name;
    data['schema'] = this.schema;
    return data;
  }
}

class Item {
  String? name;
  Request? request;
  List<void>? response;

  Item({this.name, this.request, this.response});

  Item.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    request = json['request'] != null ?  Request.fromJson(json['request']) : null;
   response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    if (request != null) {
      data['request'] = request!.toJson();
    }
    if (response != null) {
      data['response'] = response;
    }
    return data;
  }
}

class Request {
  String? method;
  List<void>? header;
  Body? body;
  Url? url;

  Request({this.method, this.header, this.body, this.url});

  Request.fromJson(Map<String, dynamic> json) {
    method = json['method'];
    if (json['header'] != null) {
      header = json['header'];
    }
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    url = json['url'] != null ? new Url.fromJson(json['url']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['method'] = this.method;
    if (this.header != null) {
      data['header'] = this.header;
    }
    if (this.body != null) {
      data['body'] = this.body!.toJson();
    }
    if (this.url != null) {
      data['url'] = this.url!.toJson();
    }
    return data;
  }
}

class Body {
  String? mode;
  List<Formdata>? formdata;

  Body({this.mode, this.formdata});

  Body.fromJson(Map<String, dynamic> json) {
    mode = json['mode'];
    if (json['formdata'] != null) {
      formdata = <Formdata>[];
      json['formdata'].forEach((v) {
        formdata!.add(new Formdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mode'] = this.mode;
    if (this.formdata != null) {
      data['formdata'] = this.formdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Formdata {
  String? key;
  String? value;
  String? type;

  Formdata({this.key, this.value, this.type});

  Formdata.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    data['type'] = this.type;
    return data;
  }
}

class Url {
  String? raw;
  String? protocol;
  List<String>? host;
  List<String>? path;

  Url({this.raw, this.protocol, this.host, this.path});

  Url.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    protocol = json['protocol'];
    host = json['host'].cast<String>();
    path = json['path'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['raw'] = raw;
    data['protocol'] = protocol;
    data['host'] = host;
    data['path'] = path;
    return data;
  }
}