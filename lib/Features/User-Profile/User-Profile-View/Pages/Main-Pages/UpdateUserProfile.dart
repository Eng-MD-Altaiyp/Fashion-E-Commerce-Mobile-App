import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:fashion_e_commerce_mobile_app/Features/User-Profile/User-Profile-Repository/Country-Images-Repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class UpdateUserProfile extends StatefulWidget {
  const UpdateUserProfile({super.key});

  @override
  State<UpdateUserProfile> createState() => _UpdateUserProfileState();
}

class _UpdateUserProfileState extends State<UpdateUserProfile> {


  Country Data = Country();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              height: 240,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const UpdateUserProfile(),
                                ),
                              );
                            },
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Primary,
                                borderRadius: BorderRadius.circular(75),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(75),
                                    color: Colors.red,
                                    image: const DecorationImage(
                                      image: AssetImage("assets/Images/OIP.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                    border:
                                    Border.all(width: 3, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 55,
                        left: 60,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black,
                              border: Border.all(width: 3, color: Colors.white)),
                          child: Center(
                            child: Icon(Icons.camera_alt_outlined,color: Primary,),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: SizedBox(
                width: double.infinity,
                // height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text("First Name",style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400,
                              ),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(left: 15, right: 15),
                              height: 55,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade200,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Your User_Name';
                                  }
                                  if (value.length < 4) {
                                    return 'This User_Name is not correct';
                                  } else {
                                    return null;
                                  }
                                },
                                // controller: User_Name,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "  User Name ",
                                    hintStyle: TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15,right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text("Last Name",style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400,
                              ),),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(left: 15, right: 15),
                              height: 55,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade200,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Your User_Name';
                                  }
                                  if (value.length < 4) {
                                    return 'This User_Name is not correct';
                                  } else {
                                    return null;
                                  }
                                },
                                // controller: User_Name,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "  User Name ",
                                    hintStyle: TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 20,right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text("Email",style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                    ),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade200,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your User_Name';
                        }
                        if (value.length < 4) {
                          return 'This User_Name is not correct';
                        } else {
                          return null;
                        }
                      },
                      // controller: User_Name,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "  User Name ",
                          hintStyle: TextStyle(color: Colors.grey[400])),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 20,right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text("Phone Number",style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                    ),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade200,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your User_Name';
                        }
                        if (value.length < 4) {
                          return 'This User_Name is not correct';
                        } else {
                          return null;
                        }
                      },
                      // controller: User_Name,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "  User Name ",
                          hintStyle: TextStyle(color: Colors.grey[400])),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 20,right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text("Select Country",style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade400,
                    ),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade200,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child:  DropdownButton<String>(
                      hint: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            Data.selectedFlag,
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 8),
                          Text(Data.selectedLanguage),
                        ],
                      ),
                      value: Data.selectedLanguage,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      underline: Container(
                        height: 0,
                        color: Colors.transparent,
                      ),
                      onChanged: (String? newValue) {
                          int index = Data.languages.indexOf(newValue!);
                          Data.selectedLanguage = newValue;
                          Data.selectedFlag = Data.countryFlags[index];
                      },
                      items: Data.languages.asMap().entries.map<DropdownMenuItem<String>>((entry) {
                        int Index = entry.key;
                        String language = entry.value;
                        return DropdownMenuItem<String>(
                          value: language,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Data.countryFlags[Index],
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(width: 8),
                              Text(language),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SizedBox(
          width: double.infinity,
          height: 80,
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {

                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          border: Border.all(width: 2, color: Colors.black)),
                      child: const Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Primary,
                      ),
                      child: const Center(
                        child: Text(
                          "Update",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
