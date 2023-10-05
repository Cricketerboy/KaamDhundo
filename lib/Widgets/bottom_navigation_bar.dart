import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kaam_dhundo/Jobs/jobScreen.dart';
import 'package:kaam_dhundo/Jobs/upload_job.dart';
import 'package:kaam_dhundo/Search/profile_company.dart';
import 'package:kaam_dhundo/Search/search_companies.dart';
import 'package:kaam_dhundo/user_state.dart';

class BottomNavigationBarForApp extends StatelessWidget {
  int indexNumber = 0;

  BottomNavigationBarForApp({required this.indexNumber});

  void _logout(context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black54,
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                ),
              ],
            ),
            content: Text(
              'Do you want to Log Out ?',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: Text(
                  'No',
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {
                  _auth.signOut();
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => UserState()));
                },
                child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        color: Colors.orange.shade400,
        backgroundColor: Color.fromARGB(255, 179, 211, 142),
        buttonBackgroundColor: Colors.orange.shade300,
        height: 50,
        index: indexNumber,
        items: [
          Icon(Icons.list, size: 19, color: Colors.black),
          Icon(Icons.search, size: 19, color: Colors.black),
          Icon(Icons.add, size: 19, color: Colors.black),
          Icon(Icons.person_pin, size: 19, color: Colors.black),
          Icon(Icons.exit_to_app, size: 19, color: Colors.black),
        ],
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.bounceInOut,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => JobScreen()));
          } else if (index == 1) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => AllWorkersScreen()));
          } else if (index == 2) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => UploadJobNow()));
          } else if (index == 3) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => ProfileScreen()));
          } else if (index == 4) {
            _logout(context);
          }
        });
  }
}
