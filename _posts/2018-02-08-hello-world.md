---
layout: post
title: "Hello, World!"
date: 2018-02-08 18:00:00 -0800
categories: blog lombok spring aspectj aop vim ideavim intellij
---

Hello, this site will serve as a repository of notes for programming-related things I've learned each. I might not learn
something new each day. I might forget to post. I might post inaccurate or plain wrong information. This will largely
just be a mish-mash of notes so I can find them later on. Reader beware.

# Things I've Learned

## Lombok

The [Lombok|https://projectlombok.org/] [@AllArgsContructor|https://projectlombok.org/api/lombok/AllArgsConstructor.html]
annotation provides a [onConstructor|https://projectlombok.org/api/lombok/AllArgsConstructor.html#onConstructor--]
member which allows adding any annotation to the generated constructor (e.g. [Spring|https://spring.io/]'s
[@Autowired|https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/beans/factory/annotation/Autowired.html]).

The documentation says that for JDK8 the syntax should follow `@AllArgsContructor(onConstructor_={@Autowired})`.
However, I seemed to still need to define it using the JDK7 syntax (`@AllArgsContructor(onConstructor=@__{@Autowired})`).
I'm likely missing something...

## AspectJ / Spring AOP

> @Pointcut("target(com.example.ExampleService)")
> void exampleService() {}

This can act as a shortcut for limiting the scope to a type.

> execution(* *.methodName(String, *))

A method that:
- returns anything
- is in a class in any package
- is named 'methodName'
- first param is a String
- second param is anything

> @AfterReturning(value = "exampleService() && execution(* *.methodName(String, *)", returning "result")
> void handle(JoinPoint joinPoint, SomeParamType result) {
>   String firstParam = (String) joinPoint.getArgs()[0];
>   // handle param and result
> }

Combines the two above to match only on methods in the ExampleService class named 'methodName' with two parameters where
the first one is a String. The 'result' parameter maps to the returning object from the method, and can be safely typed
if there is only one such method satisfying the pointcut.

## VIM / IdeaVim

* Navigation
  * h (left)
  * j (down)
  * k (up)
  * l (right)
* Match to some character
  * t
    * E.g. dt)
      * Delete from the current position until the first instance of )
* Mark
  * m
    * E.g. ma
      * Marks the current position as 'a'
  * `
    * E.g. `a
      * Jumps the cursor to the previously marked position at 'a'

## Directed Acyclic Graphs in SQL

[This article|https://www.codeproject.com/Articles/22824/A-Model-to-Represent-Directed-Acyclic-Graphs-DAG-o] provides
an interesting model for representing DAG's in SQL.

# Links

* [AspectJ Cheat Sheet|https://blog.espenberntsen.net/2010/03/20/aspectj-cheat-sheet/]
* [Pointcut Expressions Tutorial|http://www.baeldung.com/spring-aop-pointcut-tutorial]
* [Directed Acyclic Graphs in SQL|https://www.codeproject.com/Articles/22824/A-Model-to-Represent-Directed-Acyclic-Graphs-DAG-o]
