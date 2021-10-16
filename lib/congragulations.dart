import 'package:csi_workshop/user.dart';
import 'package:flutter/material.dart';

class CongratulationScreen extends StatelessWidget {
  CongratulationScreen({ Key? key }) : super(key: key);

  dynamic dataMap ={};

  @override
  Widget build(BuildContext context) {
    dataMap = dataMap.isEmpty?ModalRoute.of(context)!.settings.arguments : dataMap;
    return Scaffold(
      appBar: AppBar(
        title:const Text('Congratulations'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: FutureBuilder(
            future: User.updateUserDetails(name: dataMap['name'], email: dataMap['email'], password: dataMap['password']),
            builder: (context,AsyncSnapshot<bool> snapshot){
              if(snapshot.hasData){
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Congragulations ${User.name} for a sucessful registration. Please check your email ${User.email} for activating your account. '),
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator(),);
            }
            ),
        ),
      ),
    );
  }
}