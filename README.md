# jubelio

## Installation
Make sure your device/machine ready to run flutter, see more about flutter installation in [here](https://flutter.dev/docs/get-started/install).

 1. Clone this repo
```bash
git clone https://github.com/erpambudi/jubelio.git
```
 2. Get required package
```bash
flutter pub get
```
## Additional information about this project
 
This project using Flutter BLoc as State Management and implementing Clean Architecture

## Running Automation Testing

 1. Initial Coverage File
```bash
flutter test --coverage
```
 2. Running Testing and Coverage
```bash
flutter pub run test_cov_console
```
3. If you experience an error during the test, try rebuilding the test in this way
```bash
flutter pub run build_runner build
```
