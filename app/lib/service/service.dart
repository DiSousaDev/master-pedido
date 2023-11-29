import 'package:http/http.dart' as http;

var url = Uri.https('http://localhost:8080', 'whatsit/create');
var response = http.post(url);


//funcoes para fazer as querys