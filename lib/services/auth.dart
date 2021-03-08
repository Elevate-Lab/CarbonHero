import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth{
  final databaseReference = Firestore.instance;
  Future<void> handleSignIn(GoogleSignIn _googleSignIn) async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> handleSignOut(GoogleSignIn _googleSignIn) =>
      _googleSignIn.disconnect();

  void createUser(GoogleSignInAccount _currentUser) async {
    var doc = await databaseReference
        .collection('users')
        .document(_currentUser.email)
        .get();
    if (doc.exists) {
      return;
    }
    await databaseReference
        .collection("users")
        .document(_currentUser.email)
        .setData({
      'emailId': _currentUser.email,
      'userName': _currentUser.displayName,
      'userId': _currentUser.id,
      'imgUrl': _currentUser.photoUrl,
      'savedCarbonEmission': 0.0,
      'totalCarbonEmissionThisMonth': 0.0,
      'totalCarbonEmissionLastMonth': 0.0,
      'totalCarbonEmissionYesterday': 0.0,
      'totalCarbonEmissionToday': 0.0,
      'batchesEarned': [],
      'pointsEarned': 10,
      'userFriends': [],
    });
    return;
  }
}

// ------------------------------------------------------------------
// facebook login code(don't touch)
// bool _isloggedIn = false;
// Map user;
// final facebooklogin = FacebookLogin();
//
// _logonwithfb() async {
//   final result = await facebooklogin.logInWithReadPermissions(['email']);
//   switch (result.status) {
//     case FacebookLoginStatus.loggedIn:
//       final token = result.accessToken.token;
//       final graphResponse = await http.get(
//           'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
//       print("555555");
//       final profile = JSON.jsonDecode(graphResponse.body);
//       print(profile);
//       setState(() {
//         user = profile;
//         _isloggedIn = true;
//       });
//       break;
//
//     case FacebookLoginStatus.cancelledByUser:
//       setState(() {
//         _isloggedIn = false;
//       });
//       break;
//     case FacebookLoginStatus.error:
//       setState(() {
//         _isloggedIn = false;
//       });
//   }
// }
//
// _logout() {
//   facebooklogin.logOut();
//   setState(() {
//     _isloggedIn = false;
//   });
// }
//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Center(
//         child: _isloggedIn
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Image.network(user["picture"]["data"]["url"],
//                       height: 50.0, width: 50.0),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Text(
//                     'Name:${user['name']}\nEmail:${user['email']}',
//                     style:
//                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   RaisedButton(
//                     child: Text("Logout"),
//                     onPressed: () {
//                       _logout();
//                     },
//                   ),
//                 ],
//               )
//             : Center(
//                 child: RaisedButton(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                   child: Text("Login with Facebook"),
//                   onPressed: () {
//                     _logonwithfb();
//                   },
//                 ),
//               )),
//   );
// }
