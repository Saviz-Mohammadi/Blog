---
title: "CMake build system generator part 01 - Hello CMake"
date: 2023-05-12T14:06:22-07:00
draft: true

weight: 1
---



<br>
<br>
<br>



### Introduction



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



##### What is a Build System?

<p>
I am certain that many of you have experience working with various Integrated Development Environments (IDEs) like <span class="special">Visual Studio</span>, <span class="special">XCode</span>, <span class="special">Qt Creator</span>, and others (if you are coding in C++ atleast). But have you ever wondered what exactly occurs when you initiate a new project? How do the implementation (.cpp) files locate the necessary header (.h/.hpp) files located in different folders? How does the project integrate third-party libraries? What exactly unfolds when you execute the "Create New file" operation from the action menu? The answer to most of these questions lies in the combination of several tools that come together to create an entity known as a Build System that your IDE is taking advantage of. <span class="special">A build system can be defined as a suite of tools that together enable developers to combine and transform code files, resources, directives, and third-party utilities and libraries to produce meaningful entities such as executable programs and reusable libraries (shared/static)</span>. The challenge arises when there are numerous build tools with variations and their own requirements. Some famous ones are GNU Make, MS build, QMake, Ninja, and many more.

As many of you are aware, we operate under different environments; some of us code on the Windows platform, some on macOS, and some on Linux. Various decisions regarding to the project must be made, such as determining the architecture (64-bit/32-bit), the compiler being utilized (MSVC, MinGW, Ninja, etc.), and many other factors. Different platforms have their distinct compilers, IDEs, libraries, and many other utilities, which are often incompatible with each other. This creates a significant challenge, especially in compiled languages like C and C++, where we need to generate different variations of our programs to ensure compatibility with the target platform. Although it's occasionally possible to emulate other environments under a single operating system, in most cases, attempting to manage a project across diverse environments can quickly become chaotic. For example, on Windows, available compilers include MSVC (Microsoft Visual Compiler), MinGW (Windows version of GCC compiler), and Ninja. On macOS, you're likely to use Clang. And under Linux, Make and g++ are commonly used.

The challenge escalates when multiple developers are working on the same project under different environments. Having to create detailed configuration files for each of these environments per each programmmers needs can be time-consuming. Some IDEs only cooperate with specific compilers, and certain compilers only function on particular platforms. All these factors influence how your project is structured. Although we might wish to exist in a world where none of these considerations matter, the reality is that they do. Some libraries are only compatible with certain environments and compilers, certain IDEs are exclusive to specific platforms, etc. This reality mirrors the complexities of the real world; just as not all blood types are compatible, not all software environments are interchangeable. This is one of the most daunting aspects of languages like C and C++; unlike other languages like Java, we don't have the luxury of universal compatibility. That's the trade-off for the power that these languages provide.
</p>



<br>
<br>


##### Hello CMake

<p>
CMake has managed to solidify its position as the de-facto standard build system (generator) for C++. As is often the case, the leading technology is criticized for its short-comings and even despised by some. I suspect that for those reasons some new competitors have been cropping up lately (we may look at some in the future), but it doesn’t seem like CMake is going anywhere anytime soon. It has been adopted on all major platforms, and many frameworks and essentially all C++ developers are now expected to have at least rudimentary knowledge of CMake.

In my experience it has always been critical to understand the reasoning behind what is being done – what are we actually trying to achieve? Without a logical explenation we’d be trying to memorize an arbitrary set of rules – this is often what CMake examples available on the internet provide. In this series of posts I’ll try to go over some of the fundamentals of CMake, while also explaining the decision-making and looking at some of the implementation details, that help understand the why. So let us do just that – review the basics of CMake and take a look at what happens underneath while we’re at it.
</p>



<!-- ############################################# Separator - Bottom ############################################# -->

<div class="line-divider-bottom">
  <hr class="left-line">
  <span>|</span>
  <span class="middle">Introduction</span>
  <span>|</span>
  <hr class="right-line">
</div>

<!-- ############################################# Separator - Bottom ############################################# -->