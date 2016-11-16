# iOSProgramming 4th EDITION

### Chapter 3 通过ARC管理内存

知识点：  
1. 栈，帧  
2. 堆
3. ARC(Automatic reference counting),自动引用计数  
4. 指针变量与对象所有权  
  
    对象所有权概念可以帮助我们决定是否应该释放某个对象并回收该对象占有的内存。  
  
    内存泄漏、过早释放、空指针（空引用）  
  
    哪些情况会使对象失去拥有者：  
    - 修改指针变量  
    - 将指针变量的值设为nil  
    - 对象的拥有者被释放  
    - 从collection对象中删除对象   

    所有权链（Ownership chains） 

5.  **强引用与弱引用**  
    弱引用适合解决一种称为强引用循环（strong reference cycle -> 两个或两个以上的对象相互之间有强引用特性的指针关联）
    的内存管理问题。  
    确定父子关系，父对象使用具有强引用特性的指针指向子对象，子对象使用具有弱引用特性的指针指回父对象。  

6. 属性（在Objective-C编程中已经学习了）  
    属性的特性：  
     - 多线程特性 nonatomic 和 atomic

     - 读写特性 readwrite 和 readonly

     - 内存管理特性 strong, weak, copy, unsafe_unretained  
      这里注意什么时候用什么类型的。  
      strong是默认的强引用，weak用于避免强引用循环。  
      当某个属性是指向其他对象的指针，而且该对象的类有可修改的子类时，应该将该属性的内存管理特性设置为copy。  
      对于不指向任何对象的属性，不需要做内存管理，选用unsafe_unretained。  
        
7. 自定义属性的存取方法  

8. 属性合成

