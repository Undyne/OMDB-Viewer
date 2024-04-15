#  OMDB Coding Challenge

## By Greg Rodrigues

This is a simple app designed to allow searching of OMDB for movie information.  It implements async/await functions to handle network communications, as well as some work in Combine to handle UI updates from the user.  I've wanted to play with async calls of a while and it's definitely an improvment from using completion handlers.

The app is a simple design, written in SwiftUI using MVVM architecture.  The app will take a search term, display a list of results or an error code if needed, and allow the user to tap a movie to navigate to a full page list with more details on the movie selected.

My personal OMDB API key is hidden from the Github repository using a .gitignore flag to remove it, so to install and test the app, you'll want to supply your own key by copying the APIKey.example.swift file and renaming it to APIKey.swift to fill in the missing project file.  With a larger project, I'd probably use a different method like CocoaKeys or Sourcery to hide needed API keys and allow CI/CD to use environment variables to fill in the needed keys.

I hope you like it.

Thanks!
