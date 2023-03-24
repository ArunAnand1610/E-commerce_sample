import 'package:e_commerce_project/productdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

class Adduser extends StatefulWidget {
  const Adduser({super.key});

  @override
  State<Adduser> createState() => _AdduserState();
}

class _AdduserState extends State<Adduser> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String? name, email, password, role;
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  final userName = TextEditingController();
  final usermail = TextEditingController();
  final userpassword = TextEditingController();
  final userrole = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: ListView(children: [
              Container(
                height: 48,
                width: double.infinity,
                color: Color.fromRGBO(40, 115, 240, 1),
                child: Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Add User Details",
                          style: TextStyle(
                              fontFamily: "Gortita",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 32, left: 16, right: 16),
                child: Form(
                  key: _key,
                  //autovalidate: _validate,
                  child: FormUI(),
                ),
              ),
            ])));
  }

  Widget FormUI() {
    return Column(
      children: [
        TextFormField(
          controller: userName,
          decoration: InputDecoration(hintText: 'Full Name'),
          validator: validateName,
          onSaved: (String? val) {
            name = val;
          },
        ),
        SizedBox(height: 15.0),
        TextFormField(
            controller: usermail,
            decoration: new InputDecoration(hintText: 'Email ID'),
            keyboardType: TextInputType.emailAddress,
            validator: validateEmail,
            onSaved: (String? val) {
              email = val;
            }),
        SizedBox(height: 15.0),
        TextFormField(
            controller: userrole,
            keyboardType: TextInputType.number,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            decoration: new InputDecoration(hintText: 'Phone Number'),
            validator: validateRole,
            onSaved: (String? val) {
              role = val;
            }),
        SizedBox(height: 15.0),
        Container(
            height: 48,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 72, left: 32, right: 32),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color: Color.fromRGBO(31, 84, 195, 0.15))
                ],
                gradient: const LinearGradient(
                    colors: [Color(0xff007ebc), Color(0xff00c09d)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
            child: MaterialButton(
                onPressed: () {
                  toast("Succesfully Placed Your Order");
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductList()));
                },
                child: Center(
                    child: Text("SUBMIT",
                        style: GoogleFonts.rubik(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold))))),
      ],
    );
  }

  String? validateName(String? value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value!.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String? validateRole(String? value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value!.length == 0) {
      return "Role is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Please enter your mobile number";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.length == 0) {
      return "Email is Required";
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }
}
