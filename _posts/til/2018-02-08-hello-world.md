---
layout: post
title: Hello, World!
categories: dev til
tags: lombok spring aspectj aop java vim intellij sql graph
---

This site will serve as a repository of notes for programming-related things
I've learned each day. It will largely just be a mish-mash of notes so I can
find them later on.

I might not learn something new each day. I might forget to post. I might even
post inaccurate or just plain wrong information.  **Reader beware.**

Without further ado, today I learned...

## Lombok

{% highlight java %}
@AllArgsContructor(onConstructor=@__{@Autowired})
{% endhighlight %}

The Lombok `@AllArgsConstructor` annotation provides an `onConstructor` member
which allows adding any annotation to the generated constructor (e.g. Spring's
`@Autowired`).

The documentation says that for JDK8 the syntax should be
`onConstructor_={@Autowired}`. However, I seemed to still need to define it
using the (above) JDK7 syntax.

### Links

* [Lombok](https://projectlombok.org/)
* [@AllArgsContructor](https://projectlombok.org/api/lombok/AllArgsConstructor.html)
* [onConstructor](https://projectlombok.org/api/lombok/AllArgsConstructor.html#onConstructor--)
* [Spring](https://spring.io/)
* [@Autowired](https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/beans/factory/annotation/Autowired.html)

## AspectJ / Spring AOP

{% highlight java %}
@Pointcut("target(com.example.ExampleService)")
void exampleService() {}
{% endhighlight %}

This can act as a shortcut for limiting the scope to a type.

{% highlight java %}
execution(* *.methodName(String, *))
{% endhighlight %}

This describes a method that:
- returns anything
- is in a class in any package
- is named 'methodName'
- first param is a String
- second param is anything

{% highlight java %}
@AfterReturning(value = "exampleService() && execution(* *.methodName(String, *)", returning "result")
void handle(JoinPoint joinPoint, SomeParamType result) {
  String firstParam = (String) joinPoint.getArgs()[0];
  // handle param and result
}
{% endhighlight %}

This combines the two above to match only on methods in the ExampleService class
named 'methodName' with two parameters where the first one is a String. The
'result' parameter maps to the returning object from the method, and can be
safely typed if there is only one such method satisfying the pointcut.

### Links

* [AspectJ Cheat Sheet](https://blog.espenberntsen.net/2010/03/20/aspectj-cheat-sheet/)
* [Pointcut Expressions Tutorial](http://www.baeldung.com/spring-aop-pointcut-tutorial)

## VIM / IdeaVim

| Command | Example | Description                                                    |
|:-------:|:-------:|:---------------------------------------------------------------|
| `h`     |         | Move left                                                      |
| `j`     |         | Move down                                                      |
| `k`     |         | Move up                                                        |
| `l`     |         | Move right                                                     |
| `t`     | `dt`    | Delete from the current position until the first instance of ) |
| `m`     | `ma`    | Marks the current position as 'a'                              |
| `` ` `` | `` `a`` | Jumps the cursor to the previously marked position at 'a'      |

## Directed Acyclic Graphs in SQL

Found an article providing an interesting interesting model for representing
DAG's in SQL.

### Links

* [Directed Acyclic Graphs in SQL](https://www.codeproject.com/Articles/22824/A-Model-to-Represent-Directed-Acyclic-Graphs-DAG-o)
