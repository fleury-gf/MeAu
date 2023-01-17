import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meau/models/user_model.dart';

bool isLoggedIn() {
  return FirebaseAuth.instance.currentUser?.uid != null;
}

Future<String> signUp(CreateUserModel user) async {
  try {
    final usercredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: user.email, password: user.password);

    await FirebaseFirestore.instance
        .collection("users")
        .doc(usercredential.user?.uid.toString())
        .set({
      "nome": user.nome,
      "idade": user.idade,
      "estado": user.estado,
      "cidade": user.cidade,
      "endereco": user.endereco,
      "telefone": user.telefone,
      "username": user.username,
      "picture": user.picture,
    });
  } catch (e) {
    return e.toString();
  }
  ;
  return "";
}

Future<String> signIn(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } catch (e) {
    return e.toString();
  }
  ;
  return "";
}

Future<String> signOut() async {
  if (isLoggedIn()) {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      return e.toString();
    }
    ;
    return "";
  }
  return "não há usuário logado";
}

Future<UserModel> getUser(String uid) async {
  UserModel user = UserModel();
  const oneMegaByte = 1024 * 1024;

  try {
    DocumentSnapshot<Map<String, dynamic>> docRef =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    user.id = uid;
    //user.email = docRef.get("email");
    user.idade = docRef.get("idade");
    user.cidade = docRef.get("cidade");
    user.telefone = docRef.get("telefone");
    user.estado = docRef.get("estado");
    user.endereco = docRef.get("endereco");
    user.nome = docRef.get("nome");
    user.username = docRef.get("username");
    user.picture = docRef.get("picture");
  } catch (e) {
    log(e.toString());
  }

  return user;
}

Future<UserModel?> getCurrentUser() async {
  UserModel? currentUser = UserModel();

  if (isLoggedIn()) {
    try {
      currentUser = await getUser(FirebaseAuth.instance.currentUser!.uid);
    } catch (e) {
      currentUser = null;
    }
  } else {
    currentUser = null;
  }

  return currentUser;
}
