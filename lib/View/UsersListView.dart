import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytest/Controller/UserController.dart';
import 'package:mytest/View/UserDetailView.dart';
class UsersListView extends StatelessWidget {

  final UserController _controller = Get.put(UserController());
  
  UsersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        elevation: 0,
        actions:[Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: IconButton(
            icon: const Icon(Icons.refresh),
             onPressed: (){
               _controller.fetchUser();
             },
          )
        ),]
      ),
      body: Obx(
        ()=> _controller.isLoading.value? const Center(child: CircularProgressIndicator()): ListView.builder(
          itemCount: _controller.users.value.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
               Get.to(()=>  UserDetailView(user: _controller.users.value[index]));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFEFEF),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(.2),offset: const Offset(1.4,1.4))
                  ]
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(_controller.users.value[index].id.toString() ??"",style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_controller.users.value[index].name ?? "",style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            ),
                            Text(_controller.users.value[index].email ?? "",style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                            ),
                          ],
                        ),
                      ],
                    ),
                   const  Icon(Icons.more_vert),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
