#!/bin/bash

echo "Running build_runner at 'core'..."
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs


echo "Dependencies finished."
