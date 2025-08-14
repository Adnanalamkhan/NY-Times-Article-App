# NY-Times-Article-App
This is a simple iOS app that interacts with the NY Times Most Popular Articles API to display trending articles in a clean and intuitive way.

# Features:
* Fetches a list of the most popular articles from the [NY Times API](https://api.nytimes.com/svc/mostpopular/v2/mostviewed/%7Bsection%7D/%7Bperiod%7D.json?api-key=sample-key).
* Displays detailed information about an article when tapped.
* Shows the articles images without any third party, Uses async/await to asynchronously downloading and showing the image to the screen, also uses NSCache mechanism to cache the images and display.

# Screenshots:
<img width="250" height="500" alt="Splash" src="https://github.com/user-attachments/assets/bada742d-bfeb-4e20-9ee3-72e4099db9f3" />
<img width="250" height="500" alt="ArticleList" src="https://github.com/user-attachments/assets/789753cc-732b-4914-b3f9-ef82c0cfb58a" />
<img width="250" height="500" alt="ArticleDetails" src="https://github.com/user-attachments/assets/76100575-f340-4b70-b70c-5c7edcd7e1d7" />

# API Used:
The app pulls data from the Most Viewed section of the [NY Times API](https://api.nytimes.com/svc/mostpopular/v2/mostviewed/%7Bsection%7D/%7Bperiod%7D.json?api-key=sample-key). 

For testing, the following parameters were used:
* section = all-sections
* period = 7 (7 days)

These parameters are configurable in the APIEndPoints.swift file of the project.

# Architecture:
The project is built using the MVVM (Model-View-ViewModel) design pattern, which is made up of the following components:

* **Model:** The model defines the data structure based on the response received from the server. For instance, Articles and ArticleModel.
* **View:** The views are responsible for displaying data to the user using storyboards and Xibs. Examples include ArticleViewController, ArticleDetailsViewController, ArticleCell, and ArticleDetailsCell.
* **ViewModel:** The ViewModel handles the business logic and serves as a bridge between the Model and the View. Examples include ArticlesViewModel and ArticleDetailsViewModel.
* **Router:** A centralized AppRouter that handles navigation between different views within the app.
* **Network Service:** Manages API requests and handles network interactions. For example, NetworkService.

# Key Features and Techniques:

* **MVVM Design Pattern:** The app follows the Model-View-ViewModel (MVVM) design pattern for clean separation of concerns and easy testing.
* **Swift Generics:** Utilized Swift’s generic types for type safety and code reusability.
* **Modern Concurrency (Async/Await):** The app leverages Swift’s async/await to handle network calls and concurrency in a clear and readable way.
* **Router for Navigation:** A Router-based navigation system is implemented for clean, modular, and scalable navigation.
* **No Third-Party SDKs:** All features are built using native iOS tools and frameworks, with no reliance on third-party SDKs.

# How to Build and Run the Code:

1. Clone the repository.
2. Navigate to the project directory.
3. Open **NYTimesArticles.xcodeproj** in Xcode.
4. Use Command + B or go to Product → Build to build the project.
5. Press the Run button in Xcode (or use Command + R) to run the app on a simulator or physical device.

# Unit Testing:
The project includes unit tests for key components to ensure reliable functionality:

* **Network Service:** Tests to verify correct handling of API responses.
* **ViewModel:** Tests to validate the logic behind business decisions and state management.
* **Mocks:** Added mock json and Article mocks, to test success and failure scenarios from network service and view models.
* **Router:** Tests to ensure correct navigation throughout the app.

# Running the Tests Manually:
To view the test case results and code coverage reports, follow these steps:
To run tests:

1. Select the Product -> Test or press Command + U.
2. Navigate to the Test Navigator tab in Xcode's Project Navigator to check the test status and coverage details.
