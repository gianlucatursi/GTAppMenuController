#GTAppMenuController

This is a simple project inspired by **Paper** application of Facebook.

![Demo](https://copy.com/DUbjPky6fo1VD40H).

Trying Paper Facebook I am impressed by this seemingly Menu where the application appears in full screen, and then if you open the menu appears in the Status Bar.

## How To Use

This is the most import piece of code:
```
    GTBackViewController *_back = [str instantiateViewControllerWithIdentifier:@"back"];

    self.backWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.backWindow.rootViewController = _back;
    [self.backWindow makeKeyAndVisible];

    GTAppMenuController *_front = [str instantiateViewControllerWithIdentifier:@"front"];
    self.frontWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.frontWindow.rootViewController = _front;
    self.frontWindow.windowLevel = UIWindowLevelStatusBar;
    [self.frontWindow makeKeyAndVisible];
 
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
