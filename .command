
#==================================

// Genrate the language .g.dart files
dart run slang

#==================================

// Genrate asset files
dart run build_runner build

#==================================

flutter build apk --split-per-abi --release -v

flutter build appbundle --release -v

flutter build apk --analyze-size --target-platform android-arm

flutter build appbundle --analyze-size --target-platform android-arm

//generate dart codes from i18n language folder
dart run slang

dart run flutter_launcher_icons:main

dart run flutter_native_splash:create

dart run import_sorter:main

dart fix --apply

// Show all package with its dependancies
flutter pub deps -v