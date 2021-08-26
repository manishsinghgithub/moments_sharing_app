import 'package:flutter/material.dart';

const kDecorationAniamtion = BoxDecoration(
    gradient: LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0xfff8b55f5), Color(0xffff16fa1)],
));

const kTextForInput = InputDecoration(
  filled: true,
  focusColor: Colors.white,
  labelText: 'email',
);
