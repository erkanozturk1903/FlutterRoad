// ignore_for_file: sort_child_properties_last

import 'package:delivery_app/src/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {

  RegisterController con = Get.put(RegisterController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _imageUser(),
          _buttonBack(),
        ],
      ),
    );
  }

  Widget _backgroundCover(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      color: Colors.amber,
    );
  }

  Widget _boxForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.3,
        left: 50,
        right: 50,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 15,
            offset: Offset(0, 0.75),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textYourInfo(),
            _textFieldEmail(),
            _textFieldName(),
            _textFieldUser(),
            _textFieldPhone(),
            _textFieldPassword(),
            _textFieldConfirmPassword(),
            _buttonRegister(),
          ],
        ),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child:  TextField(
        controller: con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration:const InputDecoration(
          hintText: 'Email',
          prefixIcon: Icon(Icons.email),
        ),
      ),
    );
  }

  Widget _textFieldName() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child:  TextField(
        controller: con.nameController,
        keyboardType: TextInputType.text,
        decoration:const InputDecoration(
          hintText: 'Name',
          prefixIcon: Icon(Icons.person),
        ),
      ),
    );
  }

  Widget _textFieldUser() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child:  TextField(
        controller: con.lastnameController,
        keyboardType: TextInputType.text,
        decoration:const InputDecoration(
          hintText: 'Last Name',
          prefixIcon: Icon(Icons.person_2_outlined),
        ),
      ),
    );
  }

  Widget _textFieldPhone() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child:  TextField(
        controller: con.phoneController,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          hintText: 'Phone Number',
          prefixIcon: Icon(Icons.phone),
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child:  TextField(
        controller: con.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration:const InputDecoration(
          hintText: 'Password',
          prefixIcon: Icon(Icons.lock),
        ),
      ),
    );
  }

  Widget _textFieldConfirmPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child:  TextField(
        controller: con.confirmPasswordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration:const InputDecoration(
          hintText: ' Confirm Password',
          prefixIcon: Icon(Icons.lock),
        ),
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: ElevatedButton(
        onPressed: () => con.register(),
        child: const Text(
          'REGISTER',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          backgroundColor: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }

  Widget _textYourInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 30),
      child: const Text(
        'ENTER THIS INFORMATION',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buttonBack() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 20),
        child: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget _imageUser() {
    return SafeArea(
      child: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 25),
        child: GestureDetector(
          onTap: () {},
          child: const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/user_profile.png'),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
