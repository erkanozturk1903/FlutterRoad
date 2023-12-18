// ignore_for_file: prefer_const_constructors, avoid_print, no_leading_underscores_for_local_identifiers, unused_field, use_build_context_synchronously

import 'dart:io';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/layout/auth/widgets/auth_widgets.dart';
import 'package:admin_dashboard/ui/shared/widgets/snackbar.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late String name;
  late String email;
  late String password;
  late String profileImage;
  late String _uid;

  bool processing = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  bool passwordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);

  final ImagePicker _picker = ImagePicker();

  XFile? _imageFile;
  dynamic _pickedImageError;

  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');

  void _pickImage() async {
    if (!kIsWeb) {
      XFile? _imageFile = await _picker.pickImage(source: ImageSource.gallery);
      if (_imageFile != null) {
        var selected = File(_imageFile.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      XFile? _imageFile = await _picker.pickImage(source: ImageSource.gallery);
      if (_imageFile != null) {
        var f = await _imageFile.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        print('No image has been picked');
      }
    } else {
      print('Something went wrong');
    }
  }

  void signUp() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
      if (_imageFile != null) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

          firebase_storage.Reference ref = firebase_storage
              .FirebaseStorage.instance
              .ref('admin-inage/$email.jpg');

          await ref.putFile(File(_imageFile!.path));
          profileImage = await ref.getDownloadURL();

          _uid = FirebaseAuth.instance.currentUser!.uid;

          await customers.doc(_uid).set({
            'name': name,
            'email': email,
            'profileImage': profileImage,
            'phoneNumber': '',
            'sid': _uid,
            'tckimlik': '',
            'address': '',
          });
          _formKey.currentState!.reset();
          setState(() {
            _imageFile = null;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginView(),
            ),
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            setState(() {
              processing = false;
            });
            /* MyMessageHandler.showSnackBar(
              _scaffoldKey,
              'Şifreniz çok kısa',
            ); */
          } else if (e.code == 'email-already-in-use') {
            setState(() {
              processing = false;
            });
            /*   MyMessageHandler.showSnackBar(
              _scaffoldKey,
              'Hesap oluşturmak için geçerli email giriniz',
            ); */
          }
        }
      } else {
        setState(() {
          processing = false;
        });
        /* MyMessageHandler.showSnackBar(
          _scaffoldKey,
          'Bir resim seçim',
        ); */
      }
    } else {
      setState(() {
        processing = false;
      });
      /*  MyMessageHandler.showSnackBar(
        _scaffoldKey,
        'Lütfen Tüm Alanları Doldurun',
      ); */
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: ScaffoldMessenger(
        key: _scaffoldKey,
        child: Container(
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 370,
              ),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                reverse: true,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AuthHeaderLabel(
                          headerLabel: "Sign Up",
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 40),
                                  child: _pickedImage == null
                                      ? dottedBorder(
                                          color: Colors.grey.shade400)
                                      : CircleAvatar(
                                          child: kIsWeb
                                              ? Image.memory(
                                                  webImage,
                                                  fit: BoxFit.fill,
                                                )
                                              : Image.file(
                                                  _pickedImage!,
                                                  fit: BoxFit.fill,
                                                ),
                                        )),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            onChanged: (value) {
                              email = value;
                            },
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              } else if (value.isValidEmail() == false) {
                                return 'Please enter a valid email';
                              } else if (value.isValidEmail() == true) {
                                return null;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: textFormDecoration.copyWith(
                              labelText: "Email Address",
                              hintText: "Plesae enter your email address",
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            onChanged: (value) {
                              password = value;
                            },
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                            obscureText: passwordVisible,
                            decoration: textFormDecoration.copyWith(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                },
                                icon: Icon(
                                  passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                              labelText: "Password",
                              hintText: "Please enter your password",
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        HaveAccount(
                          haveAccount: "Do you have an account",
                          actionLabel: "Sign In",
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              Flurorouter.loginRoute,
                            );
                          },
                        ),
                        processing == true
                            ? const CircularProgressIndicator()
                            : AuthMainButton(
                                mainButtonLabel: "Sign Up",
                                onPressed: () async {
                                  signUp();
                                },
                              )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget dottedBorder({
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
          dashPattern: const [6.7],
          borderType: BorderType.Circle,
          color: color,
          radius: const Radius.circular(12),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_outlined,
                  color: color,
                  size: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                IconButton(
                  onPressed: (() {
                    _pickImage();
                  }),
                  icon: Icon(Icons.add),
                )
              ],
            ),
          )),
    );
  }
}
