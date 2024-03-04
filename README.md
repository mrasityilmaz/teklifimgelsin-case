# My Coding Setup - for Flutter Clean Arch.

_This repository created for development starter pack._
### Requirements: 

> environment:
> sdk: >=3.1.0 <4.0.0

_Also includes:_
 -  [get_it] - DI 
 -  [injectable] - Generator for get_it
  - [stacked] - MVVM-State Management
 -  [equatable] - Data Equatability
 -  [envied] - Secure Api keys
 -  [rest_api_package] - Network
 -  [internet_connection_checker] - Internet Connection Check
 -  [dartz] - Success or Failure with <T> type datas
 -  [freezed_annotation] - Freezed Annotation 
 -  [cookie_jar] - for cookie stuffs..

_Dev Dependencies:_
_Generators and Linter_
  - [build_runner]
 -  [envied_generator]
 -  [injectable_generator]
 -  [freezed]
-   [very_good_analysis]


## Scripts:
This project includes rps scripts.
###### First of All, You should activate rps.
```dart pub global activate rps --version 0.7.0-dev.6```
###### Then you ready for some magic 
###### -- 

```sh
scripts:
    model_build: "dart run build_runner build --delete-conflicting-outputs"
    clean_get: "flutter clean && flutter pub get"
```
###### Easily you can use that
```rps model_build```
or
```rps clean_get```


#### Oopss Dont Forget 
The Injection Container is not generated yet. You should generate it.
```rps model_build```





**Good Luck...**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [get_it]: <https://pub.dev/packages/get_it>
   [injectable]: <https://pub.dev/packages/injectable>
   [stacked]: <https://pub.dev/packages/stacked>
   [equatable]: <https://pub.dev/packages/equatable>
   [envied]: <https://pub.dev/packages/envied>
   [rest_api_package]: <https://github.com/mrasityilmaz/rest_api_package.git>
   [internet_connection_checker]: <https://pub.dev/packages/internet_connection_checker>
   [dartz]: <https://pub.dev/packages/dartz>
   [freezed_annotation]: <https://pub.dev/packages/freezed_annotation>
   [cookie_jar]: <https://pub.dev/packages/cookie_jar>
   [build_runner]: <https://pub.dev/packages/build_runner>
   [envied_generator]: <https://pub.dev/packages/envied_generator>
   [injectable_generator]: <https://pub.dev/packages/injectable_generator>
   [freezed]: <https://pub.dev/packages/freezed>
   [very_good_analysis]: <https://pub.dev/packages/very_good_analysis>

