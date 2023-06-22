# UserDefaultsKey

[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://img.shields.io/badge/Swift-5.0-orange.svg)
[![Platforms](https://img.shields.io/badge/Platforms-macOS_|_iOS_|_watchOS-black?style=flat)](https://img.shields.io/badge/Platforms-macOS_|_iOS_|_watchOS-black?style=flat)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://github.com/devhplusn/UserDefaultsKey/blob/master/LICENSE)

Using PropertyWrapper to utilize UserDefaults as a variable

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)


## Requirements

- Swift 5.0
- iOS 11.0+
- macOS 10.13+
- watchOS 4.0+


## Installation

#### Swift Package Manager

You can use The Swift Package Manager to install UserDefaultsKey by adding the proper description to your Package.swift file:

```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .package(url: "https://github.com/devhplusn/UserDefaultsKey.git", from: "1.0.0")
    ]
)
```

#### Cocoapods

UserDefaultsKey is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod 'UserDefaultsKey', :tag => '1.0.0', :git => 'https://github.com/devhplusn/UserDefaultsKey'
```


## Usage

#### Object must be implement 'Codable' Protocol

```swift
import UserDefaultsKey

enum Gender: String, Codable {
    case male = "male"
    case female = "female"
}

class User: Codable {
    var age: Int
    var name: String
    var gender: Gender

    init(age: Int, name: String, gender: Gender) {
        self.age = age
        self.name = name
        self.gender = gender
    }
}

```

> Example

```swift

@UserDefaults.Key("CURRENT_USER")
var current: User?

current = User(age: 30, name: "Some one", gender: .male)
print(current)
// Prints Optional User (age: 30, name: Some one, gender: Gender.male)
```


## License

These works are available under the MIT license. See the [LICENSE][license] file
for more info.


[license]: LICENSE
