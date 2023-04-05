# UniSearch

A project containing a Search Screen, Buttons, Textfields and Widgets with attractive UI, built with Flutter.

## Overview

Flutter sdk supported version: From 2.16.2, less than 3.0.0
If modified any model, run on terminal "flutter packages pub run build_runner build --delete-conflicting-outputs" at directory "uniSearch_Test\unisearch_test"

The objective of this project is to fetch data, search and autocomplete text from the search-query from a public API which provides a huge amount of data.

## Features

- Validation check for username and password inputs
- Validation check for search for university names
- Realtime search implementation that provides suggestion on DropDownList according to the search
- Show the result by fetching additional data

Search doesn't fetch all data from the API at once, thus the user doesn't need to wait, rather it uses additional query based on what the user types and brings back suggestions on realtime.

## Architecture

- Modified Clean Architecture has been followed thoughout the project.
- BLoc design/architectural pattern, a variation of MVC has been used.
