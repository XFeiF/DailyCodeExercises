# iOSProgramming 4th EDITION

### Chapter 7 Delegation adn Text Input  

知识点：  

1. 文本框  

2. UIResponder  
    定义了一系列方法，用于接受和处理用户事件。  
    
3. 委托Delegation  

4. 协议Protocols  
    若委托对象没有实现相应的协议方法，应用会抛出unrecognized selector异常。  
    为防止此类问题发生，编译器会检查某个类是否实现了相关协议的必须方法。要让编译器执行此类检查，必须将相应的
    类声明为遵守指定的协议，其语法格式为：在头文件或类扩展@interface指令末尾，将类所遵守的协议以逗号分隔的列表形式写
    在尖括号里。  
    几乎所有的委托都是弱引用属性。  

5. 运动效果Motion Effects  

6. 使用调试器  

7. main() 与 UIApplication  

8. 捏合-缩放  
    实现步骤：  
    
    - 设置 UIScrollView 的 id<UISCrollViewDelegate> delegate 代理对象  

    - 设置 minimumZoomScale ：缩小的最小比例  

    - 设置 maximumZoomScale ：放大的最大比例  
      
    - 让代理对象实现下面的方法，返回需要缩放的视图控件  
    ```
    - (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView;
    ```

