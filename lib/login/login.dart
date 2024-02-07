
// import 'package:flutter/material.dart';

// import '../home/view/home.dart';
// import 'login_service.dart';

// class LoginScreen extends StatelessWidget {
//   //LoginScreen({Key? key}) : super(key: key);

//   TextEditingController nameController =
//       TextEditingController(text: "mor_2314");
//   TextEditingController passwordController =
//       TextEditingController(text: "83r5^_");

//   LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Shop'),
//         centerTitle: true,
//         backgroundColor: Colors.redAccent,
//       ),
//       body: Container(
//         margin: const EdgeInsets.all(20),
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(
//                   labelText: "Username", border: OutlineInputBorder()),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: const InputDecoration(
//                   labelText: "Password", border: OutlineInputBorder()),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             SizedBox(
//               height: 50,
//               width: MediaQuery.of(context).size.width,
//               child: ElevatedButton(
//                 onPressed: () async {
//                   final getToken = await ApiService()
//                       .userLogin(nameController.text, passwordController.text);

//                   if (getToken['token'] != null) {
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text(
//                           "SUCCESS ! your token id is ${getToken['token']}"),
//                       backgroundColor: Colors.green,
//                     ));
//                     Future.delayed(const Duration(seconds: 2), () {
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) => const  Home()));
//                     });
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                       content: Text("Username or Password Incorrect"),
//                       backgroundColor: Colors.red,
//                     ));
//                   }
//                 },
//                 child: const Text(
//                   "Login",
//                   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import '../home/view/home.dart';
import 'login_service.dart';

class LoginScreen extends StatelessWidget {
  final ApiService apiService;

  LoginScreen({Key? key, required this.apiService}) : super(key: key);

  TextEditingController nameController = TextEditingController(text: "mor_2314");
  TextEditingController passwordController = TextEditingController(text: "83r5^_");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Shop'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  final getToken = await apiService.userLogin(nameController.text, passwordController.text, context);

                  if (getToken['token'] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("SUCCESS ! your token id is ${getToken['token']}"),
                      backgroundColor: Colors.green,
                    ));
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Username or Password Incorrect"),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
