import 'package:authentest_115/pages/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:authentest_115/pages/services/auth_service.dart';

class RegisterPages extends StatefulWidget {
  const RegisterPages({super.key});

  @override
  State<RegisterPages> createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _telController = TextEditingController();

  String usre_type = "";
  bool type = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: SafeArea(
          child: Form(
        key: _formkey,
        child: ListView(
          children: [
            TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Enter Email Please!";
                  }
                  return null;
                })),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Enter Password Please ";
                }
                return null;
              }),
            ),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Name"),
              validator: ((value) {
                if (value!.isEmpty) {
                  return "Enter name Please ";
                }
                return null;
              }),
            ),
            TextFormField(
                controller: _lastnameController,
                decoration: const InputDecoration(labelText: "Lastname"),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Enter Lastname Please!";
                  }
                  return null;
                })),
            TextFormField(
                controller: _telController,
                decoration:
                    const InputDecoration(labelText: "Telephone Number"),
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Enter Telephone Number Please!";
                  }
                  return null;
                })),
            const Text("ประเภทผู้ใช้งาน"),
            RadioListTile(
              title: Text("อาจารย์"),
              value: "1",
              groupValue: usre_type,
              onChanged: (value) {
                setState(() {
                  usre_type = value!;
                });
              },
            ),
            RadioListTile(
              title: Text("เจ้าหน้าที่"),
              value: "2",
              groupValue: usre_type,
              onChanged: (value) {
                setState(() {
                  usre_type = value!;
                });
              },
            ),
            RadioListTile(
              title: Text("นิสิต"),
              value: "3",
              groupValue: usre_type,
              onChanged: (value) {
                setState(() {
                  usre_type = value!;
                });
              },
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    print("OK");
                    print(_emailController.text);
                    AuthService.registerUser(
                            _emailController.text, _passwordController.text)
                        .then((value) {
                      if (value == 1) {
                        Navigator.pop(context);
                      }
                    });
                  }
                },
                child: const Text("Register")),
          ],
        ),
      )),
    );
  }
}
