# iOSProgramming 4th EDITION

### Chapter 5 视图：重绘与UIScrollView  

知识点：  
 
1. touchesBegan:withEvent:消息  

2. 运行循环  
    当应用将控制权交回给运行循环时，运行循环首先会检查是否有等待重绘的视图（即在当前循环收到过setNeedsDisplay消息的视图），
    然后向所有等待重绘的视图发送drawRect：消息 ...  

3. setNeedsDisplayInRect  

4. 类扩展

    - 将属性声明在头文件中和类扩展中的区别：  
    
    ```
    头文件：一个类的“用户手册”，其他类可以通过头文件知道该类的功能和使用方法。
          使用头文件的目的是向其他类公开该类声明的属性和方法。
          也就是说头文件中声明的属性和方法对其它类是可见的（visible）。

    那么对于某些属性或者方法，只想私有（绝对私有，子类也无法访问），不想公开，就可以将其声明在类扩展中。
    ```

    - 类扩展：声明类的内部属性和方法，保持头文件的精简，避免内部实现细节的暴露。
    
5. 使用UIScrollView（请先查看文档）
    
    - 类继承关系，它是UIView的子类，是UITableView等的父类  

    - ScrollView重点理解两个概念，一个是它的尺寸大小，另一个是它的内容contentSize。

6. 拖动与分页  
    setPagingEnabled


Debug：  

1. 在 HypnosisView.m 中重写touchesBegan:withEvent:消息 方法，点击视图相应的LOG没有打印出来，说明该view没有接收到点击事件。
在ViewController中重写该方法，可以正常显示log。原因，这个view被挡住了，触摸事件没有传递到它这里。  
在AppDelegate.m 中，之前自己挖了坑，现在来补～  
 <code>[self.window addSubview:hyposisView]</code>，添加hypnosisView到window中，  
 <code>[self.window makeKeyAndVisible]</code>，这里的实例方法makeKeyAndVisible，
    查API文档：
    ```
    Discussion

    This is a convenience method to show the current window and 
    position it in front of all other windows at the same level or lower. 
    If you only want to show the window, change its hidden property to NO. 

    ```
    就是说，如果把<code>[self.window makeKeyAndVisible]</code>放在添加View的后面，那么它会挡住之前添加的view～，
    所以解决办法就是 这句代码放到前面。  

2. ScrollView 两个设置  

    ```Objective-C
    CGRect screenRect = self.window.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
    bigRect.size.height *= 2.0;
    
    // 创建一个UISCrollView对象，将其尺寸设置为窗口大小
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:bigRect];
    
    
    // 创建一个有超大尺寸的HypnosisView对象并将其加入UIScrollView对象
    HypnosisView *hyposisView = [[HypnosisView alloc]
                               initWithFrame:bigRect];
    [scrollView addSubview:hyposisView];
    
    [self.window addSubview:scrollView];
    
    // 告诉UIScrollView对象“取景”范围有多大
    scrollView.contentSize = bigRect.size;

    ```
    运行上面的代码会发现scrollView拖不动。。。  
    上面说到scrollView理解有两个关键点:  
    
    - **scrollView的尺寸**  
    - **scrollView内容的尺寸contentSize**  

    scrollView的尺寸决定的是它在屏幕中可见的大小，屏幕中可见的可能有多个View，scrollView在初始化时要设置其可见的大小。  
    scrollView的contentSize，这是scrollView“取景”范围的大小。  
    理解这两点，修改上述代码：  
    <code>UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:screenRect];</code>  
    这里scrollView的大小设为屏幕大小即可。 

