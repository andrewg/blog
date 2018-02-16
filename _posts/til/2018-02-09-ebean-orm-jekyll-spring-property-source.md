---
layout: post
title: Ebean ORM &bull; Jekyll Search &bull; Custom Spring PropertySource
categories: dev til
tags: ebean java orm jekyll lunrjs searchyll elasticsearch search spring
---

## Ebean ORM

A lightweight ORM for Java. Some notable features:

* No persistence context/session
* Query beans for LINQ-ish queries

### Links

* [Ebean ORM](https://ebean-orm.github.io/)
* [Ebean vs. JPA](http://ebean-orm.github.io/docs/architecture/compare-jpa)
* [Reddit post](https://www.reddit.com/r/java/comments/7weq71/ebean_orm_javakotlinjvm/)

## Search for Jekyll

### Lunr.js

Javascript-only solution (entirely client-side).

#### Links

* [Tutorial](https://learn.cloudcannon.com/jekyll/jekyll-search-using-lunr-js/)

### Searchyll (Elasticsearch)

More interesting, but heavier, solution; also requires an external Elasticsearch
cluster.

#### Links

* [Searchyll](https://github.com/omc/searchyll)
* [Tutorial](https://blog.omc.io/elasticsearch-for-jekyll-part-1-ab456ac7c093)

## Custom Spring PropertySource

When looking into answering a StackOverflow question, I came upon how to create
and configure a custom PropertySource. There are many implementations, and all
it takes is to define a `@Bean` that consumes a `ConfigurableEnvironment`,
creates and configures the PropertySource, and adds it to the environment. The
object can then make use of that source with a `@Value` annotation in the same
way as any setting in a properties file.

```java
@Configuration
class MyConfiguration {
  @Bean
  PropertySource myPropertySource(ConfigurableEnvironment env) {
    MapPropertySource source = new MapPropertySource("myPropertySource", singletonMap("myPropertyValue", "example"));
    env.getPropertySources().addFirst(source);
    return source;
  }
}

class Sample {
  @Value("${myPropertyValue}")
  private String message;

  public String getMessage() {
    return message;
  }
}
```

### Links

* [StackOverflow Answer](https://stackoverflow.com/a/48716905/4094)
* [Tutorial](https://coderwall.com/p/mm5ihw/how-to-add-custom-property-source-to-spring-s-environment)
* [JavaDoc](https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/core/env/PropertySource.html)
