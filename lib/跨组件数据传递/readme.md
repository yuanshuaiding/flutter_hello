# 3种跨组件数据传递方式

## 1. 使用InheritedWidget

```
1. 自定义widget继承自InheritedWidget，提供of方法，并实现updateShouldNotify方法；
2. 将需要访问自定义widget数据的子widget作为child；
3. 子widget使用of方法获取自定义widget实例，并通过该实例访问数据或操作方法。
```

> InheritedWidget 的数据流动方式是从父 Widget 到子 Widget 逐层传递

## 2. 使用Notification

```
1.首先需要继承 Notification 类。Notification 类提供了 dispatch 方法，可以让我们沿着 context 对应的 Element 节点树向上逐层发送通知。
2.需要接收notification的父容器使用NotificationListener<T>包裹，在onNotification回调中监听自定义Notification类使用dispatch方法发送的数据。
```


> Notification数据流动方式是从子 Widget 向上传递至父 Widget。这样的数据传递机制适用于子 Widget 状态变更，发送通知上报的场景。

## 3.使用EventBus[第三方库]

```
dependencies: 
    event_bus: 1.1.0
```



