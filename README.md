# Flutter-Clean-Architecture

## 🚀 Motivation
This project demonstrates how to implement Clean Architecture in Flutter the right way—focusing on separation of concerns, testability, and maintainability.

**Why This Project?**  
Most Flutter apps mix business logic with UI code, making them:  
  ❌ Hard to test  
  ❌ Difficult to scale    
  ❌ Tightly coupled to specific data sources or state management  

This demo solves those problems by showing:  

**Key Lessons You’ll Learn**  

🎯 **True Layer Separation**  
- Domain: Pure business logic (no Flutter dependencies!)  
- Data: Flexible data sources (API + local DB)  
- Presentation: UI that’s decoupled from logic  

🎯 **Multi-DataSource Reality**  
- Seamlessly switch between REST API ↔ Local Database (e.g., Hive/SQLite)  
- Offline-first support made easy  

🎯 **State-Management Agnostic Design**  
- The same business logic works with BLoC, Riverpod, or GetX  
- Proof that Clean Architecture outlasts state-management trends  

🎯 **Testing Confidence**  
- Unit Tests: Domain + Data layers  
- Widget Tests: UI in isolation  
- Mocking Strategies: Swap dependencies effortlessly  

🎯 **Real-World Adaptability**  
- Add/remove features without refactoring the entire app  
- Replace libraries (e.g., Dio → HTTP) with minimal changes  

**Who Is This For?**  
- Developers tired of "just making it work" and want to build apps that scale  
- Teams enforcing consistent architecture across projects  
- Anyone preparing for complex Flutter apps (production-grade)  

## 📑 SDK Requirements
- Flutter SDK 3.29.2

## 🛠️ Installation
- Clone the project
- Download packages using ( flutter pub get ) 
- And Run the project

## 🧪 Unit Test & Widget Test
For the testing I used test, bloc_test, and mockito
- In-order to run the test you can run using `flutter test` to run all the test cases.
- If you want to run individual test case, please add the file path behind the command `flutter test {full_path}`
- All our test cases will be under `test/`

## 🚧 Backlogs
- ✅ To integrate the offline mode with local db in Data
- 🔘 UI/UX Improvements
- 🔘 To complete domain unit tests
- 🔘 To complete bloc widget tests
- 🔘 To integrate with Riverpod in presentation layer
- 🔘 Country list screen.
- 🔘 University detail screen navigation.

