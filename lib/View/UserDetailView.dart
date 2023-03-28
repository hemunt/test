import 'package:flutter/material.dart';
import 'package:mytest/Modal/User.dart';

class UserDetailView extends StatelessWidget {
  final User user;
  const UserDetailView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(user.name??""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text("Name: ", style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),),
                Text(user.name??"", style: TextStyle(

                ),),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text("Email: ", style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),),
                Text(user.email??"", style: TextStyle(

                ),),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text("Mobile: ", style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),),
                Text(user.phone??"", style: TextStyle(

                ),),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text("Website: ", style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),),
                Text(user.website??"", style: TextStyle(
                ),),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text("Address: ", style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),),
                Row(
                  children: [
                    Text(user.address?.street ??"", style: TextStyle(),),
                    Text(", ${user.address?.suite}" ??"", style: TextStyle(),),
                    Text(", ${user.address?.city}" ??"", style: TextStyle(),),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(user.toJson().toString())
          ],
        ),
      ),
    );
  }
}
