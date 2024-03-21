+++
title = "Streambridge api and Consumer Groups"
description = "Streambridge api and Consumer Groups"
weight = 1
+++

## Content

This reference app helps you build Streambridge api based producers and discusses consumer groups.

### Prerequisites

Initializating a Spring Cloud Function project using RabbitMQ, we need to import following dependencies in our project.

* Cloud Stream
* Spring for RabbitMQ

### Getting Started

There are two ways to create producers - one fixed-interval based polling based producer and the other using StreamBridge api. This recipe discusses the second approach of using StreamBridge API.

#### Implementing Supplier

It's a fairly straight forward approach to use StreamBridge API. The send() of the StreamBridge class is overridden with multiple implementations. In this sample we are using the following:

    public boolean send(String bindingName, Object data) 

The bindingName specifies the exchange and the Object is typically a  Message Object.

![](/images/rabbitmq/referenceapps/02Producer.png "Suppliers")


#### Supplier Properties

Supplier properties are simpler as bindingName specifies the binding info and destination specifies the exchange name.

![](/images/rabbitmq/referenceapps/02PropertiesP.png "Properties")


#### Implementing Consumer

Consumer objects are functions with input but no output. The Consumer function is responsible for listening to the incoming messages and are triggered by the message arriving in the queue. 

Consumers and Functions are activated automatically when the new message arrives. 

![](/images/rabbitmq/referenceapps/02Consumer.png "Consumers")


#### Consumer properties

The destination binding declares the exchange names used for message transfers. The 'group' specified here, creates a specific queue name with the convention <destination>.<group> name.

Also note the quorum enabled property which creates quorum queues by default.

![](/images/rabbitmq/referenceapps/02PropertiesC.png "Properties")

### Code

* API-Producer code is available at https://github.com/ijags/apiPublisher
* API-Consumer code is available at https://github.com/ijags/apiConsumer

### Additional References

* Visit https://docs.spring.io/spring-cloud-stream/reference/index.html: for more information.

### Recent Guides and Recipes

{{< latest-pages-section />}}

### All Pages

{{< children-sorted />}}
