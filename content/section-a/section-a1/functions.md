+++
title = "Functions based Producers and Consumers"
description = "Functions based Producers and Consumers"
weight = 1
+++

## Content

This reference app helps you build your first functions based producers and consumers.

### Basic Concepts


Cloud Native apps should be loosely coupled and event driven architecture solves the problem of coupling. In event driven architectures, an event is an occurance like state-change, and this event can be notified to interested parties through messages. 

Spring Cloud Stream framework on RabbitMQ enables asynchronoues interaction between event producers and consumers modeled on Publisher/Subcriber behavior (and Event Streaming on Kafka). 


#### Using functional paradigm:

Most producer and consumer requirements can be expressed with functions. Functions are a simple, uniform, and portable programming model that is a perfect fit for event-driven architectures. Spring Cloud Stream promotes the implementation of business logic via functions based on the standard interfaces introduced by Java 8: Supplier, Function, and Consumer.


* Supplier is a function with only output, no input (i.e. producer, publisher, or source).


* Function has both input and output (i.e. processor).


* Consumer is a function with input but no output(i.e. subscriber or sink).

The annotations @Bean and @Configuration make Spring Cloud aware of these functions as beans. Functions registered as beans are enhanced with extra features by the Spring Cloud Function framework like transparent type conversion and function composition. 

### Prerequisites

Initializating a Spring Cloud Function project using RabbitMQ, we need to import following dependencies in our project.

* Cloud Stream
* Spring for RabbitMQ

![](/images/rabbitmq/referenceapps/01Starter.png "Spring Starter project")

### Getting Started

#### Implementing Supplier

Supplier functions are the source of messages and are also called Producers or Publishers. Suppliers produce message to capture an event or a state change in the system. 

Suppliers need to be explicitly activated, such as by polling on a fixed interval or invoked by a rest api.

![](/images/rabbitmq/referenceapps/01Producer.png "Suppliers")


#### Implementing Consumer

Consumer objects are functions with input but no output. The Consumer function is responsible for listening to the incoming messages and are triggered by the message arriving in the queue. 

Consumers and Functions are activated automatically when the new message arrives. 

![](/images/rabbitmq/referenceapps/01Consumer.png "Consumers")


#### Implementing Business logic through Functions

The standard Java 8 Function is all you need to implement your business logic in a standard way. The siganture of function has two parameters - input and output. It is also called a processor or transformer. 

![](/images/rabbitmq/referenceapps/01Function.png "Functions")

#### Understanding properties

The spring.cloud.function.definition property defines the function composition. The semicolon declares that there are three functions to be executed. If we use pipe (|) instead, that means that second function executes right after the first one. If you look closely the three function names are exactly the three functions names we have in our code of Supplier, Consumer and Function.

The destination binding declares the exchanges used for message transfers. The convention is that IN is specified for consumers and OUT is specified for suppliers in the Bindings. The processors functions has both IN and OUT exchange bindings.

There is no 'group' specified here, which means no specific queue name is provided and this anonymous queues would get created on the rabbitmq instance.

![](/images/rabbitmq/referenceapps/01Properties.png "Functions")

### Code

* The code is available at https://github.com/ijags/pubProcessSub

### Additional References

* Visit https://docs.spring.io/spring-cloud-stream/reference/index.html: for more information.

### Recent Guides and Recipes

{{< latest-pages-section />}}

### All Pages

{{< children-sorted />}}
