import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

void showMessge(BuildContext context, String message) {
  SnackBar _snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(_snackBar);
}
