import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meau/screens/home_screen.dart';
import 'package:meau/screens/login_screen.dart';
import 'package:meau/screens/login_tree_screen.dart';

import '../api/user_functions.dart';
import '../models/user_model.dart';
import '../screens/adopt_screen.dart';
import '../screens/my_pets_screen.dart';
import '../screens/notification_screen.dart';
import '../screens/register_adoption_screen.dart';
import 'drawer_dropdown_item.dart';
import 'drawer_item.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  double? _userListHeight;
  double? _shortcutsListHeight = 0;
  double? _infoListHeight = 0;
  double? _settingsListHeight = 0;

  bool _userToggled = true;
  bool _shortcutsToggled = false;
  bool _infoToggled = false;
  bool _settingsToggled = false;

  UserModel? currentUser;

  @override
  void initState() {
    _setCurrentUser();
    super.initState();
  }

  void _setCurrentUser() async {
    UserModel? user = await getCurrentUser();
    if (user != null) {
      setState(() {
        currentUser = user;
      });
    }
  }

  void _toggleUserDropdown() {
    if (_userListHeight != null) {
      setState(() {
        _userListHeight = null;
      });
    } else {
      setState(() {
        _userListHeight = 0;
      });
    }
    setState(() {
      _userToggled = !_userToggled;
    });
  }

  void _toggleShortcutsDropdown() {
    if (_shortcutsListHeight != null) {
      setState(() {
        _shortcutsListHeight = null;
      });
    } else {
      setState(() {
        _shortcutsListHeight = 0;
      });
    }
    setState(() {
      _shortcutsToggled = !_shortcutsToggled;
    });
  }

  void _toggleInfoDropdown() {
    if (_infoListHeight != null) {
      setState(() {
        _infoListHeight = null;
      });
    } else {
      setState(() {
        _infoListHeight = 0;
      });
    }
    setState(() {
      _infoToggled = !_infoToggled;
    });
  }

  void _toggleSettingsDropdown() {
    if (_settingsListHeight != null) {
      setState(() {
        _settingsListHeight = null;
      });
    } else {
      setState(() {
        _settingsListHeight = 0;
      });
    }
    setState(() {
      _settingsToggled = !_settingsToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 124,
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  currentUser != null
                      ? Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.memory(
                              base64Decode(currentUser!.picture),
                              height: 70,
                              width: 70,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Image.asset(
                            "lib/assets/images/Meau_Icone.png",
                            width: 70,
                            fit: BoxFit.fill,
                          ),
                        ),
                ],
              ),
            ),
          ),
          currentUser != null
              ? Column(
                  children: [
                    DrawerDropdownItem(
                      onTap: _toggleUserDropdown,
                      title: currentUser!.nome,
                      dropdownToggled: _userToggled,
                    ),
                    Container(
                      height: _userListHeight,
                      child: Column(
                        children: [
                          DrawerItem(
                            title: "Meu perfil",
                            onTap: () {
                              showGeneralDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  barrierLabel:
                                      MaterialLocalizations.of(context)
                                          .modalBarrierDismissLabel,
                                  barrierColor: Colors.black45,
                                  transitionDuration:
                                      const Duration(milliseconds: 200),
                                  pageBuilder: (BuildContext context,
                                      Animation animation,
                                      Animation secondaryAnimation) {
                                    return Center(
                                        child: Container(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      height:
                                          MediaQuery.of(context).size.height -
                                              70,
                                      padding: EdgeInsets.all(20),
                                      color: Colors.white,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            DefaultTextStyle(
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 7, 1, 0),
                                                  fontSize: 20),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                      height: 200,
                                                      width: double.infinity,
                                                      child: Image.memory(
                                                          base64Decode(
                                                              currentUser!
                                                                  .picture),
                                                          fit: BoxFit.fill)),
                                                  Text("Nome: " +
                                                      currentUser!.nome),
                                                  Divider(),
                                                  Text("Idade: " +
                                                      currentUser!.idade),
                                                  Divider(),
                                                  Text("Email: " +
                                                      currentUser!.email),
                                                  Divider(),
                                                  Text("Estado: " +
                                                      currentUser!.estado),
                                                  Divider(),
                                                  Text("Cidade: " +
                                                      currentUser!.cidade),
                                                  Divider(),
                                                  Text("Endereço: " +
                                                      currentUser!.endereco),
                                                  Divider(),
                                                  Text("Telefone: " +
                                                      currentUser!.telefone),
                                                  Divider(),
                                                  Text("Username: " +
                                                      currentUser!.username),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
                                  });
                            },
                          ),
                          DrawerItem(
                            title: "Meus pets",
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => MyPetsScreen(
                                            user: currentUser!,
                                          )));
                            },
                          ),
                          DrawerItem(
                            title: "Notificações",
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => NotificationScreen(
                                            user: currentUser!,
                                          )));
                            },
                          ),
                          DrawerItem(
                            title: "Chat",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
          DrawerDropdownItem(
            onTap: _toggleShortcutsDropdown,
            icon: Icons.pets,
            title: "Atalhos",
            dropdownToggled: _shortcutsToggled,
          ),
          Container(
            height: _shortcutsListHeight,
            // color: Design.white2,
            child: Column(
              children: [
                DrawerItem(
                  title: "Cadastrar um pet",
                  onTap: () {
                    Navigator.pop(context);
                    currentUser != null
                        ? Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => RegisterAdoptionScreen()))
                        : Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginTreeScreen()));
                  },
                ),
                DrawerItem(
                  title: "Adotar um pet",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const AdoptScreen()));
                  },
                ),
              ],
            ),
          ),
          currentUser != null
              ? ListTile(
                  title: const Center(
                    child: Text(
                      "Sair",
                      style: TextStyle(
                          // color: Design.darkerGray,
                          fontSize: 14,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  onTap: () async {
                    await signOut();
                    if (!mounted) return;
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  // tileColor: Design.lightBlue,
                )
              : ListTile(
                  title: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          // color: Design.darkerGray,
                          fontSize: 14,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  // tileColor: Design.lightBlue,
                ),
        ],
      ),
    );
  }
}
