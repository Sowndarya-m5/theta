import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref("users");

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: "432720370789-kem3lov5go81ko21v36muh70knqls6v2.apps.googleusercontent.com", // Add Web Client ID here
  );


  // SIGN UP
  Future<User?> signUp(String name, String phone, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store user data in Firebase Database
      await _dbRef.child(userCredential.user!.uid).set({
        'name': name,
        'phone': phone,
        'email': email,
      });

      return userCredential.user;
    } catch (e) {
      Fluttertoast.showToast(msg: "Sign Up Error");

      return null;
    }
  }

  // LOGIN
  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      Fluttertoast.showToast(msg: "Login Error");
      return null;
    }
  }



  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // User canceled login

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      Fluttertoast.showToast(msg: "Google Sign-In Error");
      return null;
    }
  }


  // LOGOUT
  Future<void> logout() async {
    await _auth.signOut();
  }

  // GET CURRENT USER
  User? getCurrentUser() {
    return _auth.currentUser;
  }




}




