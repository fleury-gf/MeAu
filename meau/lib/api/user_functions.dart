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
