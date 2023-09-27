
# Flutter flash cards

Simple flash cards game for learning english made with Flutter. For now it supports learning english when you know polish.

## Result
![](https://raw.githubusercontent.com/bareq/flutter_flash_cards/main/result_animation.gif)

## Goals
- App allows to play in two modes: **learn new words** and **repeat unknown words**
- learn Flutter by creating a working app
- try to use best practices from Android development experience in Flutter

## Tech specification
Used packages:
- **provider** - used as state management and to apply MVVM architecture with events based on streams
- **json_annotation** - generate data source's models files automatically
- **get_it** - di
- **rxdart** - better streams support (e.g. combine streams like Kotlin's Flows)
- **sqflite** - save given answers to local database
- **flutter_localizations** and **intl** - UI elements internationalization

## TODOs (maybe ;))
- words categories
- keep results online (e.g. firebase)
- daily reminder notifications
- more languages support

## Interesting things about project
- I've found Kotlin's **List.let** method implementation on stackoverflow and I applied it to that project
- It's frustrating in dart when I want to get first element of list which fulfills the condition I have to use `list.where(condition).firstOrNull()` instead of something like `list.firstOrNull(condition)` like in my beloved Kotlin XD Maybe I'll add it later.
- I think I managed to develop nice DI modules system
