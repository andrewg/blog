---
layout: post
title: Spring JSON serialization, conversion, and validation
categories: dev til
tags: spring json serialization validation
---

## Spring `@JsonComponent`

Annotate a Jackson deserializer with this annotation so that it's auto-wired to
the `ObjectMapper`.

### Links

* [Baeldung](http://www.baeldung.com/spring-boot-jsoncomponent)

## Spring Converter and Validators

A validator can be added to the parameter being converted in a converter. Spring
will pass the value through the validations before processing the converter.

```java
class Example {
    String value;
    public Example(String value) {
        this.value = value;
    }
}

class ExampleConverter implements Converter<String, Example> {
    @Override
    Example convert(@NotNull @SomeCustomValidator String value) {
        return new Example(value);
    }
}
```