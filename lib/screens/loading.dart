import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'result_screen.dart';

const apiKey = '1bac530ca18c4cc3b688';
const barCode = '8801043005821';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async{
    final url = Uri.parse('https://openapi.foodsafetykorea.go.kr/api/${apiKey}/C005/json/1/10/BAR_CD=${barCode}');
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      String jsonData = response.body;
      var myJson = jsonDecode(jsonData)['C005']['row'][0]['PRDLST_NM'];
      print(myJson);
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return ResultScreen(foodName: myJson);
      }));
    }
    else{
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(

          onPressed: null,
          child: Text(
            'barcode: ${barCode}',
            style: TextStyle(
                color: Colors.white
            ),
          ),
          //color: Colors.blue,
        ),
      ),
    );
  }
}
