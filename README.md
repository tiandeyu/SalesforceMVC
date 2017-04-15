# SalesforceMVC

想必大家肯定经常遇到业务特别复杂的情况下，Apex Controller和Apex Handler变得异常臃肿并且难以维护的问题。
为了完成复杂的业务需求不得不在Controller里面加Handle, Helper, Utility等。
随着时间的推迟，代码变得越来越复杂越来越乱，层次不清晰，难以维护，难以测试。

我在重构同事的代码时候发现，我们大家在处理复杂业务需求的时候还是按照简单需求那样设计代码结构，Controller不够就加Handler，Handler不够就再加一个Helper，并且方法基本上都是Static静态方法。

其实我们在遇到复杂业务的时候应该适当的抽象整个业务，使用常见的MVC构建，抽象出一个业务模型(Model)，业务处理逻辑放在模型里面进行，对模型的控制（新建组装模型）放在Contoller里面，vf页面负责展示（View）。


Software engineers often face complex business logic to develop the systems. Therefore, Apex controllers and Apex handlers will become more complex leading to maintenance issue. In the controller part, they often directly use Apex handlers and utility classes in order to complete complex business requirements. As time go by, the source code will become complex structures, unclear purposes, and difficult maintenance and test.
 
While doing code refactoring, I figure out that in order to deal with complex business requirements, many engineers still prefer to write the handler classes and methods inside the controller class. At the same time if handler classes become complex, they will add another helper class for this handler class. In addition, almost these methods are static.
 
In fact, while we face complex business requirements, we should think about Object-Oriented programming with MVC structure ( M : Model, V : View , C : Controller). Model is to deal with business requirements. It can provide some methods only for specific business logic. Controller is to call the Models and Views. View is to present the front end data.
