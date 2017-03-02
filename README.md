#GTAppMenuController

This is a simple project inspired by **Paper** application of Facebook.

Trying Paper Facebook I am impressed by this seemingly Menu where the application appears in full screen, and then if you open the menu appears in the Status Bar.

## How To Use

This is the most import piece of code:
```objective-c

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    // the path identifier is formed with storyboard name, dot and viewcontroller identifier (eg: Main.mainviewcontroller)
    [GTAppMenuController instantiateFrontViewControllerWithIdentifierPath:@"Main.front"
                                     backViewControllerWithIdentifierPath:@"Main.back"];
    
    return YES;
}
 
```

**GTBackViewController** is the UITableViewController with the cells. **GTAppMenuController** is a UINavigationController (Why? i don't know, I thought it was better to use a navigation controller) and this is the purple view that captures the event of swipe.

It just needs some help from you guys. After that, here's my list:

- When select a UITableViewCell push to other View (like Paper)
- Testing


##Contacts

Gianluca Tursi

- <a href="http://www.gianlucatursi.com">Web Site</a>
- <a href="mailto:gian.tursi@gmail.com">gian.tursi@gmail.com</a>
- <a href="http://swish.gianlucatursi.com"> Please download my first Game :)</a>

## License

GTAppMenuController is available under the MIT license. See the file LICENSE.
