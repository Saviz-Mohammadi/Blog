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
For many beginner programmers, a significant challenge is mastering the basic commands in the terminal and directly engaging with the compiler to transform a traditional "hello world" example into an executable program. While this initial achievement is exiting, dealing with more complex projects often involves managing multiple files, including numerous header files, which introduces the need to work with the linker. Moreover, as projects become more sophisticated, integrating resource files like JSON, text, icons, and PNGs becomes essential. Stepping up further may involve incorporating third-party library dependencies such as Boost, and (Add some more names).

To make things worse, ever platform has its own set of perferred set of compiler, linker, etc.. tools that work well with one another. If they are very generous they will maybe include some other platforms set of tools as well, but this rarely happens. For example, on Windows, the most dominant compiler is MSVC (Microsoft Visual Compiler), chances are if you never really pay any close attention you will most likely learn the specific commands to work with MSVC directly, which is not a bad thing, but these set of commands will most likely differ a lot for otther platforms and set of tools.

Trying to find your way through these complexities can be challenging, particularly when it involves having to recall and execut various commands repeatedly. Over time, the demand to remember and input these commands for every interaction with the compiler, linker, and other necessary tools can become frustrating. Hence, there arises a necessity for a system that streamlines this process, saving time and effort by automating the execution of these detailed commands and facilitating smoother interactions with the development tools needed to translate projects and generate desired outcomes.

This is where a build system becomes valuable. Simply put, <span class="special">a build system can be defined as a suite of tools that together enable developers to combine and transform their source code, resources, directives, third-party utilities and libraries to produce meaningful entities such as executable programs and reusable libraries (shared/static)</span>. Typically, a build system consists of a compiler, a linker, and other tools such as a Resource Compiler, Preprocessor, Code Analyzers, and Package Managers, among others.

A very key thing to remember is that every build-system that is made for a specific platform will help you to make it easier to deal with the tools made for that platform and it is not the responsibility of that build-system to do anything more than that for other platforms. For example if you use MSBuild, then MSBuild is made for making it easier to deal with MSVS compiler and its tool sets. It is not made for example to deal with Make files under linux.

Over the years, a variety of build systems have been developed for different platforms, each with varying levels of complexity and included tools, tailored to achieve diverse objectives. While build systems excel in abstracting these complexities, they introduce an additional layer of complications. Instead of memorizing individual commands, developers now need to familiarize themselves with the commands and instructions specific to the chosen build system. Although this is generally less demanding and simpler, it can still pose a challenge. Some examples of build systems include GNU Make (for Linux), MSBuild (for Windows), LLVM/Clang (macOS).


Many IDes (integrated balh....) try and hide away the complextiies of having to deal with a build system by providing a nice GUI that provides a nice interface for dealing witth a build system underneath. Famous examples for every platform include:  <span class="special">Visual Studio</span> for Windows, <span class="special">XCode</span> for MacOS, for linux theer is no distinct single one but some are <span class="special">Qt Creator</span>, GNU Emacs, Vim, etc... Chances are whenever you exectue actions such as Create new project, add new file, add resource file, add third-party library, in reality the IDE is inserting these instructions to the build-system on your behalf instead. 

 
 
 

Although learning a build-systm is considered knowledeg and knowledeg in general in good, but the problem with learning a single individual build-system can restrict us to that build-system. As many of you are aware, we operate under different environments; some of us code on the Windows platform, some on macOS, and some on Linux. Various decisions regarding to the project must be made, such as determining the architecture (64-bit/32-bit), the compiler being utilized (MSVC, MinGW, Ninja, etc.), and many other factors. Different platforms have their distinct compilers, IDEs, libraries, and many other utilities, which are often incompatible with each other. This creates a significant challenge, especially in compiled languages like C and C++, where we need to generate different variations of our programs to ensure compatibility with the target platform. Although it's occasionally possible to emulate other environments under a single operating system, in most cases, attempting to manage a project across diverse environments can quickly become chaotic. This also means that we cannot transfer this knowldege to other build-systems because they operate totally differently.

Some IDEs only cooperate with specific compilers, and certain compilers only function on particular platforms. All these factors influence how your project is structured. Although we might wish to exist in a world where none of these considerations matter, the reality is that they do. Some libraries are only compatible with certain environments and compilers, certain IDEs are exclusive to specific platforms, etc. This reality mirrors the complexities of the real world; just as not all blood types are compatible, not all software environments are interchangeable. This is one of the most daunting aspects of languages like C and C++; unlike other languages like Java, we don't have the luxury of universal compatibility. That's the trade-off for the power that these languages provide.

The challenge escalates when multiple developers are working on the same project under different environments. Having to create detailed configuration files for each of these environments and their specific perferred build-system can be time-consuming. 

It is quite obvious at this point that each platfrom has its own set of tools and build-system that they perfer. So, do we just learn every build-system there ever was? No, that would be too time-consuming and not worth the effort. instead...


this is the reason for the exsitance of tools such as CMake. Although many other tools exist, but CMake has become the defacto standard. In todays world though even having a build system is not enough anymore. Now we need systems that generate the build system!
</p>

##### What is CMake?


##### Why choose CMake?

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