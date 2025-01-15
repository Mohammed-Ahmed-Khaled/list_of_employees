# Employee Data Fetcher

A Flutter application that fetches employee data from an API using the `dio` package, parses the JSON response, and displays the data in a list view.

## Features

- Fetches employee data from `https://dummyjson.com/users`.
- Uses `dio` for HTTP requests.
- Proper error handling using try-catch.
- Parses JSON responses into an `Employee` model.   
- Displaying a loading indicator while fetching data
- Navigation between two screens and passing data to the details screen.
- Displays employee details in a list view.
- Well-structured code with separate files for models and widgets.
- Cache the employee list locally using shared_preferences and load it on app restart
