import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meau/widgets/custom_drawer.dart';
import '../api/messages.dart';
import '../api/user_functions.dart';
import '../models/user_model.dart';

class chatpage extends StatefulWidget {
  String senderid;
  chatpage({required this.senderid, required this.personid});
  String personid;
  @override
  _chatpageState createState() =>
      _chatpageState(senderid: senderid, personid: personid);
}

class _chatpageState extends State<chatpage> {
  String senderid;
  String personid;
  _chatpageState({required this.senderid, required this.personid});

  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = new TextEditingController();

  UserModel person = new UserModel();
  @override
  void initState() {
    setPerson();
    _setCurrentUser();
    super.initState();
  }

  setPerson() async {
    UserModel _person = await getUser(personid);
    setState(() {
      person = _person;
    });
  }

  UserModel? currentUser;

  void _setCurrentUser() async {
    UserModel? user = await getCurrentUser();
    if (user != null) {
      setState(() {
        currentUser = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          person.nome,
        ),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.79,
              child: messages(
                senderid: senderid,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: message,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 170, 222, 247),
                      hintText: 'mensagem',
                      enabled: true,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.purple),
                        borderRadius: new BorderRadius.circular(10),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.purple),
                        borderRadius: new BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {},
                    onSaved: (value) {
                      message.text = value!;
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (message.text.isNotEmpty) {
                      fs.collection('Messages').doc().set({
                        'message': message.text.trim(),
                        'time': DateTime.now(),
                        'senderid': senderid,
                      });

                      message.clear();
                    }
                  },
                  icon: Icon(Icons.send_sharp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
