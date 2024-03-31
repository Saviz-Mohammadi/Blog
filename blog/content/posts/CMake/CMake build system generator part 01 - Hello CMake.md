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
For many beginner programmers, a significant challenge is the attempt to transform a traditional "hello world" example into an executable program by interacting with the compiler directly via the terminal. While this initial achievement is exiting, dealing with more complex projects often involves managing multiple files, including numerous header files, which introduces the need to work with the linker. Moreover, as projects become more sophisticated, integrating resource files like JSON, text, icons, and PNGs becomes essential. Stepping it up further may involve incorporating third-party library dependencies such as Boost, nlohmann, fmt, and many more.

Complicating matters further, each platform has its preferred set of compiler, linker, and other tools that go well with one another. For instance, on Windows, the predominant compiler is MSVC (Microsoft Visual Compiler). If one does not pay close attention, they are likely to become proficient only with the specific commands for MSVC, which, while not inherently problematic, may differ significantly from those required for other platforms and toolsets. This adds even more complication as now you need to memorize even more commands for each platform and their specific set of tools.

Trying to find your way through these complexities can be challenging, particularly when it involves having to recall and execute various commands repeatedly. Over time, the demand to remember and input these commands for every interaction with the compiler, linker, and other necessary tools can become frustrating (and this is only for one platform and their toolset). Hence, there arises a necessity for a system that streamlines this process, saving time and effort by automating the execution of these detailed commands and facilitating smoother interactions with the development tools needed to translate projects and generate desired outcomes.

This is where a build system becomes valuable. Simply put, <span class="special">a build system can be defined as a suite of tools that together enable developers to combine and transform their source code, resources, directives, third-party utilities and libraries to produce meaningful entities such as executable programs and reusable libraries (shared/static)</span>. Typically, a build system consists of a compiler, a linker, and other tools such as a Resource Compiler, Preprocessor, Code Analyzers, and Package Managers, among others. Each build system features its own unique scripting language along with a set of commands, simplifying interaction compared to directly engaging with individual toolsets. This abstraction streamlines the development process, enhancing efficiency and productivity for developers.

A crucial aspect to keep in mind is that each build system designed for a specific platform aims to facilitate the utilization of tools tailored for that particular platform. It's important to note that the primary role of a build system is to streamline the interaction with the tools specific to its platform and not to extend its functionality to other platforms. For instance, if you utilize MSBuild (a build system developed by Microsoft), its purpose is to simplify working with the MSVS (Microsoft Visual Studio) compiler and its associated toolsets. However, it's not intended to handle tasks such as managing Makefiles on Linux.

Over the years, a variety of build systems have been developed for different platforms, each with varying levels of complexity and included tools, tailored to achieve diverse objectives. While build systems excel in abstracting these complexities, they introduce an additional layer of complications. Instead of memorizing individual commands, developers now need to familiarize themselves with the commands and instructions specific to the chosen build system. Although this is generally less demanding and simpler, it can still pose a challenge. Some examples of build systems include GNU Make (for Linux), MSBuild (for Windows), LLVM/Clang (macOS).


Many Integrated Development Environments (IDEs) try to alleviate the complexities associated with managing a build system by offering user-friendly graphical interfaces. These interfaces shield users from the complexities of the underlying build system. Famous examples tailored for various platforms include Visual Studio for Windows, Xcode for MacOS, and for Linux, although there isn't a singular dominant IDE, options such as Qt Creator, GNU Emacs, Vim, among others, serve the purpose. When users perform actions like creating a new project, adding new files, incorporating resource files, or integrating third-party libraries within these IDEs, the software seamlessly executes these instructions by interfacing with the build system on behalf of the user.

 
 
 
##### Problems with a Build System

While gaining expertise in a specific build system is beneficial, it's important to recognize that this knowledge can potentially confine us to that particular system. In our diverse coding environments, spanning Windows, macOS, and Linux, each platform boasts its own compilers, Integrated Development Environments (IDEs), and build systems. This presents a significant hurdle, particularly in compiled languages like C and C++, where adapting programs to different platforms is crucial for compatibility.

Despite occasional attempts to emulate other environments within a single operating system, managing projects across diverse platforms often leads to chaos. Furthermore, the idiosyncrasies of various build systems mean that knowledge acquired in one system may not easily translate to another. Some IDEs are tightly integrated with specific compilers, while certain compilers are only compatible with particular platforms.

This reality reflects the complexities of the software landscape; just as not all blood types are compatible, not all software environments are interchangeable. This inherent challenge is particularly pronounced in languages like C and C++, which lack the universal compatibility enjoyed by languages such as Java. This trade-off underscores the robustness of these languages but also underscores the necessity of adapting to diverse environments.

The complexity further escalates when multiple developers collaborate on the same project across different environments. Crafting detailed configuration files tailored to each environment and its preferred build system can consume valuable time and resources.

</p>

##### What is CMake?

It is quite obvious at this point that each platfrom has its own set of tools and build-system that they perfer. So, do we just learn every build-system there ever was? No, that would be too time-consuming and not worth the effort. instead...


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