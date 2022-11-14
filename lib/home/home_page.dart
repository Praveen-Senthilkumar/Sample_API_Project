import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:sample_project_1/feature/widget.dart';
import 'package:sample_project_1/network/endpoint.dart';
import 'package:share_plus/share_plus.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String name = '';
  bool connectionStatus=false;




  void initState() {
    super.initState();
    InitFact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 // Text(name),
                 // const SizedBox( height: 20),

                  ListTile(
                    title: Text(name),
                    trailing: GestureDetector(
                      onTap: (){
                        Share.share(name);

                      },
                      child: Icon(Icons.share,color: Colors.blue,) ,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: ()   {
                        connectionChecker();
                        if(connectionStatus == true)
                        {
                          showAlertDialogSingleButton(
                              context,
                              "Alert",
                              'No Internet Connection',
                              false,
                              onPress: () {
                                Navigator.pop(context);
                              });

                        }
                        else {
                          InitFact();
                        }

                      },
                      child: const Text('Click Me')),
                ],
              ),
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> connectionChecker()  async {
    var connectivityResult = await(Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile) {
      setState((){
         connectionStatus=false; // connected to Mobile Internet
      });

    } else if (connectivityResult == ConnectivityResult.wifi) {
      setState((){
        connectionStatus=false; // connected to Wifi Internet
      });

    }
    else {
      setState((){
        connectionStatus=true; // connected to Wifi Internet
      });
    }

  }

  Future<void> InitFact() async {
    final result = await HOSAPI().GetUserData();

    if (result.isNotEmpty) {
      setState(() {
        name = result['fact'];
      });

    }
  }




}