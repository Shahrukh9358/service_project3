
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'verify_number.dart';

class Inputnumber extends StatefulWidget {
  const Inputnumber({super.key});

  @override
  State<Inputnumber> createState() => _InputnumberState();
}

class _InputnumberState extends State<Inputnumber> {
  CountryCode _selectedCountry = CountryCode.fromCode('IN');

  TextEditingController _phoneNumberController = TextEditingController();

  // TextEditingController _textController = TextEditingController();
  bool _isInputNumber = false;

  @override
  void initState() {
    super.initState();
    _phoneNumberController.addListener(_checkInputType);
  }

  void _checkInputType() {
    setState(() {
      _isInputNumber = int.tryParse(_phoneNumberController.text) != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            'Input your number',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              CountryCodePicker(
                onChanged: (country) {
                  setState(() {
                    _selectedCountry = country;
                  });
                },
                initialSelection: 'IN',
                favorite: ['+91', 'IN'],
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                alignLeft: false,
                showFlag: false,
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                padding: EdgeInsets.zero,
                flagWidth: 30,
              ),
              Container(
                height: 25,
                child: VerticalDivider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Enter your phone number',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: .8,
            color: Colors.grey.shade500,
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: _isInputNumber ? Colors.blue : Colors.grey[350]),
              onPressed: () {
                // Handle next button press
                String phoneNumber = _phoneNumberController.text;
                String? countryCode = _selectedCountry.dialCode;
                String completeNumber = countryCode! + phoneNumber;
                print('Complete number: $completeNumber');
                if(_isInputNumber){
                  Get.to(VerifyNumber());
                }

              },
              child: Text(
                'Next',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                child: Divider(
                  thickness: .8,
                  color: Colors.grey.shade500,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'More',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 40,
                child: Divider(
                  thickness: .8,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 200, // Adjust width as needed
              height: 30, // Adjust height as needed
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffF501E6), Color(0xff8B19FC)],
                  begin: Alignment.bottomRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.circular(6), // Adjust border radius as needed
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Back to Log in",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  elevation: MaterialStateProperty.all<double>(0),
                  shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
