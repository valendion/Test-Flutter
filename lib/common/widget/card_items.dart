import 'package:flutter/material.dart';
import 'package:test_assignment/model/user/user_model.dart';

Widget cardItems(UserModel userModel) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Row(
            children: [
              Icon(Icons.title),
              SizedBox(
                width: 8,
              ),
              Text('Title : ${userModel.title} '),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.people_alt_rounded),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Username : ${userModel.username}'),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                      'Location : ${userModel.locationModel?.latitude.toString()} \n ${userModel.locationModel?.longitude.toString()}'),
                ],
              )
            ],
          )
        ]),
      ),
    ),
  );
}
