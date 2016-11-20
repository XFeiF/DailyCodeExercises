# iOSProgramming 4th EDITION

### Chapter 6 ViewController  

知识点：  
 
 1. 每一个视图控制器痘负责管理一个视图层次结构，包括创建视图层次结构中的视图并处理相关用户事件，
 以及将整改视图层次结构添加到应用窗口。  
 
 2. UIViewController 的 view 属性。  
 
 3. ViewController 可以通过两种方式创建视图层次结构：  

    - 代码方式：覆盖UIViewController 中的 loadView 方法  

    - NIB文件方式：使用Interface Builder创建一个NIB文件，然后加入所需的视图层次结构，最后视图控制器会在运行时加载由该
    NIB文件编译而成的XIB文件。

4. 通过代码方式创建视图  

5. 设置根视图控制器：setRootViewController  
    当程序将某个试图控制器设置为UIWindow对象的rootViewController时，UIWindow对象会将该试图控制器的view作为子视图加入窗口。  

6. 另一个视图控制器  

7. 加载NIB文件  
    当视图控制器从NIB文件中创建视图层次结构时，不需要覆盖loadView方法，默认的loadView方法会自动处理NIB文件中包含的属兔层次结构。  
    ViewController可以在初始化方法中查找对应的xib文件。  

8. NSBundle对象  
    Class：
    ```
    An NSBundle object helps you access the code and resources in a bundle directory on disk. Apple uses bundles to represent apps, 
    frameworks, plug-ins, and many other specific types of content. Bundles organize their contained resources into well-defined 
    subdirectories, and bundle structures vary depending on the platform and the type of the bundle. By using a bundle object, 
    you do not have to know the structure of a bundle to access its resources. 
    The bundle object provides a single interface for locating items, taking into account the bundle structure, user preferences, 
    available localizations, and other relevant factors.
    ```
    bundle是硬盘上的一个目录，其中包含了程序会用到的代码和资源，NSBundle对象就是指向这个目录的指针，用于获取资源。  
    bundle自身在子目录下组织好了他们所包含的资源，他们的结构根据平台不同而不同。  
    通过利用NSBundle对象，我们不需要知道它的结构就可以调用其资源了。  
    NSBundle提供了一个单例对象来定位资源文件，包括结构，用户偏好等。  

9. 关联File's Owner  

10. UITabBarController  
    Class:  
    ```
    The UITabBarController class implements a specialized view controller that manages a radio-style selection interface. 
    This tab bar interface displays tabs at the bottom of the window for selecting between the different modes and for displaying 
    the views for that mode. This class is generally used as-is but may be subclassed in iOS 6 and later.
    ```  
    UITabBarController对象可以保存一组视图控制器。  

    获取tabBarItem属性所指向的UITabBarItem对象并为其属性image、title赋值。  

11. 视图控制器的初始化方法
    向控制器发送init方法会调用initWithNibName：bundle：方法并为其两个参数赋值，会在应用程序包中查找和当前UIViewController同名的XIB文件。  

12. 添加本地通知  
    ```Objective-C
    NSDate *date = self.datePicker.date;
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:note];
    ```  

13. 加载和显示视图  

    - 加载：  
        使用VC(ViewController）的viewDidLoad方法检查VC的视图是否已经加载。  
        该方法必须调用父类的viewDidLoad

    - 延迟加载：  
        在initWithNibName:bundle:中不应该访问view或者view的任何子视图。凡是和view或view的子视图相关的初始化代码，都应放在
        viewDidLoad方法中实现，避免加载不需要在屏幕上显示的视图。  

    - 访问视图：  
        关于视图的初始化代码不能卸载视图控制器的初始化方法中（VC并未加载NIB文件，所有指向视图的属性都是nil）  
        如何访问XIB文件中的视图：  
        
            1. 用于已经确认试图已经加载的viewDidLoad，该方法会在VC加载完NIB文件后被调用  
            2. viewWillAppear，该方法会在视图控制器的view添加到应用窗口之前被调用  

        区别：  
            如果只需要在启动应用后设置一次视图对象，就选择viewDidLoad；如果用户每次看到VC的view时都需要对其进行设置，则选择viewWillAppear  

14. 与视图控制器及其视图进行交互  
    生命周期方法  
    
15. 键值编码


