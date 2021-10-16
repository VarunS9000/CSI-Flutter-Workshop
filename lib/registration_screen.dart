import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  bool passwordHide = true;
  int monthCount = 0;
  List<bool> checkBoxValues = [false, false, false, false];
  Row checkBoxElement(String value, int index) {
    return Row(
      children: [
        Checkbox(
          value: checkBoxValues[index],
          onChanged: (value) {},
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(value)
          )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    password.addListener(() {
      if (password.text.contains(RegExp(r'[A-Z]'))) {
        setState(() {
          checkBoxValues[0] = true;
        });

      } if (!password.text.contains(RegExp(r'[A-Z]'))) {
        setState(() {
          checkBoxValues[0] = false;
        });
      } if (password.text.contains(RegExp(r'[0-9]'))) {
        setState(() {
          checkBoxValues[1] = true;
        });
        
      } if (!password.text.contains(RegExp(r'[0-9]'))) {
        setState(() {
          checkBoxValues[1] = false;
        });
        
      }
      if(password.text.length>=8){
        setState(() {
          checkBoxValues[2]=true;
        });
      }
      if(password.text.length<8){
        setState(() {
          checkBoxValues[2]=false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: CircleAvatar(
                radius: 30,
                child: Icon(
                  Icons.edit,
                  
                  ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: TextFormField(
                controller: name,
                decoration: const InputDecoration(hintText: 'Name'),
              ),
              trailing: IconButton(
                onPressed: () {
                  name.clear();
                },
                icon: const Icon(
                  Icons.clear,
                  color : Colors.black
                  ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: TextFormField(
                controller: email,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              trailing: IconButton(
                onPressed: () {
                  email.clear();
                },
                icon: const Icon(
                  Icons.clear,
                  color : Colors.black
                  ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.keyboard),
              title: TextFormField(
                controller: password,
                decoration: const InputDecoration(hintText: 'Password'),
                obscureText: passwordHide,
              ),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordHide=!passwordHide;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: passwordHide? Colors.black:Colors.blue,
                    )),
            ),
            checkBoxElement('Minimum one UpperCase', 0),
            checkBoxElement('Minimum one number', 1),
            checkBoxElement('Minimum eight characters', 2),
            
            TextButton(
              
              onPressed: (){
                Navigator.pushNamed(context, '/congratulations',arguments: {
                  'name':name.text,
                  'email':email.text,
                  'password':password.text
                });
                name.clear();
                email.clear();
                password.clear();
              }
            , child: const Text('Submit'))
          ],
          
        ),
      ),
    );
  }
}
