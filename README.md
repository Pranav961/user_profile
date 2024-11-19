Project Title: User List with Search and Refresh


Project Description:
This project is a simple Flutter app that fetches a list of users from the Public API, displays their names and emails in a scrollable list, and allows the user to search the list by name. The app also supports pulling to refresh the list of users and handles error states gracefully when the API request fails. The app is built using the GetX state management package for efficient state handling and UI updates.


Instructions on how to run the app:
1. Clone the repository:
    git clone https://github.com/Pranav961/user_profile.git
2. Install dependencies: Navigate to the project folder and run:
    flutter pub get
3. Run the app: Ensure you have a device or emulator running, then execute:
    flutter run


Assumptions or Decisions Made During Development:

API Usage:
->  Used the Public API for fetching user data, which includes user details like name, email, address, phone, etc.
    The app only displays the user name and email for simplicity.

State Management:
->  GetX is used for state management to handle the app's UI state efficiently. This helps manage the loading state, error messages, and the list of users, as well as the search functionality.

Pull-to-Refresh:
->  Implemented a basic "pull-to-refresh" mechanism, which allows users to reload the list of users from the API.

Search Functionality:
->  A basic search bar has been implemented to filter users by name, and the search is case-insensitive.

UI/UX Design:
->  The UI is kept simple and minimal to showcase basic functionality with clear visibility of users, their names, and emails.
    Users can search by name, and the list is updated dynamically as the query changes.


Screenshots of the app:

![Screenshot_2024-11-19-14-35-05-70_814dc7b5a7dbfda47d3506524f276421](https://github.com/user-attachments/assets/36c5d952-6e46-41b7-8481-cba84441f560)
![Screenshot_2024-11-19-14-35-25-56_814dc7b5a7dbfda47d3506524f276421](https://github.com/user-attachments/assets/09e25572-63ac-4ac6-8524-3c4f9ff5dc57)
![1000180751](https://github.com/user-attachments/assets/3add8217-3a52-4ec6-ba90-449ecca03fbe)
![Screenshot_2024-11-19-14-36-25-49_814dc7b5a7dbfda47d3506524f276421](https://github.com/user-attachments/assets/8341a12f-9e53-4638-9b64-149ded986b5a)


