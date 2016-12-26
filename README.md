# JLModularityKit
模块化可配置TableView

[![CI Status](http://img.shields.io/travis/SongJunliang/JLModularityKit.svg?style=flat)](https://travis-ci.org/SongJunliang/JLModularityKit)
[![Version](https://img.shields.io/cocoapods/v/JLModularityKit.svg?style=flat)](http://cocoapods.org/pods/JLModularityKit)
[![License](https://img.shields.io/cocoapods/l/JLModularityKit.svg?style=flat)](http://cocoapods.org/pods/JLModularityKit)
[![Platform](https://img.shields.io/cocoapods/p/JLModularityKit.svg?style=flat)](http://cocoapods.org/pods/JLModularityKit)
## 截图
<img src="https://github.com/JulianSong/JLModularityKit/blob/master/Screenshots/1.png" width="250" height="445" />
<img src="https://github.com/JulianSong/JLModularityKit/blob/master/Screenshots/2.png" width="250" height="445" />
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### 实现一个模块
```ruby
@interface JLFromNameModule : JLBaseModule

@end
.....

@implementation JLFromNameModule

- (void)onStart
{
    [super onStart];
    self.cell.textLabel.text = @"酒店名称";
    self.cell.detailTextLabel.text = @"哇哈哈大酒店";
}

@end
```

### 使用并配置模块

```ruby
@interface JLFromViewController ()
.....

//设置模块
- (NSArray *)setupModuleNames
{
    return @[@[[JLFromNameModule class],[JLFromCountModule class]],
            @[[JLFromTimeModule class],[JLFromCustomNameModule class],[JLFromCustomPhoneModule class]]];
}
```


### 详细使用请看以下三个类

JLBaseModule
JLModuleViewController
JLModuleTableViewController

## Installation

JLModularityKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JLModularityKit"
```

## Author

geeksong@gmail.com

## License

JLModularityKit is available under the MIT license. See the LICENSE file for more info.
