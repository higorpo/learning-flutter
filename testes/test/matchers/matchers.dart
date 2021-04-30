import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

bool featureItemMatcher(Widget widget, String name, IconData icon) =>
    widget is FeatureItem && widget.name == name && widget.icon == icon;

bool textFieldMatcher(Widget widget, String labelText) =>
    widget is TextField && widget.decoration.labelText == labelText;
