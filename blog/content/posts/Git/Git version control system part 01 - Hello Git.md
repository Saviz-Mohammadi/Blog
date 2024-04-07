---
title: "Git version control system part 01 - Hello Git"
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



##### Motivational problem

<p>
You find yourself in the year 1990 leading a project alongside your colleagues as the leading engineer. The project you're working on involves significant coding, and as a diligent team, you're striving to improve the codebase constantly. However, like many projects of that time, you encounter a common challenge: managing versions of your code effectively. One day, while working on a crucial part of the project, you develop some code that doesn't work as expected. Recognizing the need to revert back to your old, functional code, you decide to retrieve it from the backup stored on your external hard drive. As you go to retrieve it, you receive urgent calls from your colleagues notifying you that they've made some improvements to the codebase. 
</p>



<br>
<br>



<p>
Rushing to integrate their changes, you realize that their code isn't compatible with the version you're working with. It becomes apparent that they didn't have access to the latest iteration of your code. This discrepancy leads to frustration and confusion among the team, as they've spent time and effort on changes that can't be seamlessly integrated. Adding to the chaos, you discover that you inadvertently sent the wrong version of the code to two other colleagues. They've unknowingly started working on the outdated version, compounding the issue further. It's a disaster, highlighting the inherent challenges of collaborative coding without proper version control mechanisms in place. Reflecting on the situation, you recognize the dire need for a solution to streamline code management and collaboration. Fortunately, as you ponder this dilemma, you realize that the modern era offers a solution: Version Control Systems (VCS).
</p>



<br>
<br>
<br>



##### What is a Version Control system?

<p>
Version control systems are software tools designed to track changes made to files, particularly code modifications, throughout the development process. As software engineers often collaborate in groups dispersed across different locations, each member contributes specific functionalities or features to the project by modifying the source code. Version control systems facilitate efficient communication and management of these changes by recording who made the changes, what changes were made, and when they occurred.

There are two main categories of version control systems:

1. Centralized Version Control System (CVCS):
   In CVCS, there exists a single repository, and each user maintains their own working copy. Users must commit their changes to the repository to make them visible to others, who can then update to see the modifications. However, CVCS has significant drawbacks, including the need for a constant network connection and the risk of data loss if the central server crashes.

2. Distributed Version Control System (DVCS):
   DVCS features multiple repositories, with each developer having their own repository and working copy. Changes made by a developer are initially reflected only in their local repository and must be pushed to the central repository to become visible to others. Similarly, updates do not automatically include changes made by others; developers need to pull those changes into their local repositories. DVCS offers several advantages over CVCS, such as faster operations, the ability to commit changes locally before pushing them to the main repository, and easier data recovery in the event of a central server failure. Additionally, because every contributor has a full copy of the project repository, they can readily share changes with one another as needed.

</p>



<br>
<br>
<br>



##### What is Git?

Git is a free, open-source distributed version control system tool renowned for its ability to manage projects of varying sizes efficiently and swiftly by providing aid in the management and tracking of file changes, predominantly scripts and code-related files. It does this by diligently monitoring all modifications made to your code, enabling you to save your progress as snapshots in time. if you encounter errors in your script after making alterations, Git enables you to effortlessly revert to a previously functioning version. Similarly, it facilitates the retrieval of deleted code snippets or functionalities inadvertently removed during development. These are only some of the abilities of this amazing tool.

Whether you're a web developer, app developer, or any individual working with code and file modifications, Git proves to be an invaluable asset. Its robust functionality, high performance, stringent security measures, and adaptable nature make it indispensable for both teams and solo developers alike. As you might have inferred from our discussion on Version Control Systems, Git falls under the category of Distributed Version Control System (DVCS), offering users the comprehensive features characteristic of this system.

Beyond its role as a DVCS, Git plays a crucial part in the landscape of distributed version-control DevOps tools. In this article, we'll delve into Git, exploring its features and functionalities. However, before diving into Git specifics, let's establish a basic understanding of Version Control Systems (VCS). Git originated from the ingenious mind of Linus Torvalds, the mastermind behind the Linux operating system kernel. Initially conceived to tackle the intricate task of managing and monitoring changes within the Linux codebase, which involved contributions from a global community of developers.

##### What is github?


GitHub is an online repository hosting service where you can store and share your Git repositories. You do not necessarily need GitHub to use Git - you can just work with your own Git repositories locally. However, GitHub is a safe place to keep your code that is not your own computer, so it is less likely that you or anyone you work with will lose your code. Aside from the ability to easily share and collaborate on your code with GitHub, GitHub also offers some other nice features such as the ability to more easily compare changes made to code, edit your code, search your repositories, make comments, create and track issues, host web sites and even create Wikis for your code. However, if you just want to keep track of some of your script files in one place and don't need anything extravagant, GitHub may be unnecessary overkill. We'll leave that decision up to you!



<!-- ############################################# Separator - Bottom ############################################# -->

<div class="line-divider-bottom">
  <hr class="left-line">
  <span>|</span>
  <span class="middle">Introduction</span>
  <span>|</span>
  <hr class="right-line">
</div>

<!-- ############################################# Separator - Bottom ############################################# -->






### Checking if Git is installed on your machine



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->


##### Windows

<p>
A reliable method to verify the installation of Git on a Windows machine is by executing the command provided in the code box below via CMD or PowerShell and observing the output. If the program responds with "'git' is not recognized as an internal or external command, operable program or batch file.", it indicates that Git cannot be located by the system. There could be several reasons, but the primary reason is typically the absence of the Git program itself. If Git is installed you will most likely recieve output that specifies the version of the program on your machine.
</p>



<br>
<br>
<br>



```powershell {linenos=false}
git --version
```

<br>
<br>
<br>


##### Linux

<p>
A reliable method to verify the installation of Git on a Linux machine is by executing the command provided in the code box below via Bash (or other shells) and examining the output. If the terminal does not print anything, it suggests that Git cannot be found by the system. There could be various reasons for this, but the primary cause is usually the absence of the Git program itself. If Git is installed, you will likely receive output specifying the installation directory of the program on your machine.
</p>



<br>
<br>
<br>



```bash {linenos=false}
which git
```

<br>
<br>
<br>

The which command is useful, but one problem is that it only checks the system's PATH to find the location of the Git executable. If Git is installed and properly configured in the PATH, it will output the path to the Git executable. However, it will not show you the version of the program installed on your machine. If you like to check the version as well you can use the following command after confirming that git exists on your machine to check its version as well.

<br>
<br>
<br>


```bash {linenos=false}
git --version
```


##### macOS

<p>
A reliable method to verify the installation of Git on a macOS machine is by executing the command provided in the code box below via the terminal (Zsh/Bash) and examining the output. If the terminal does not print anything, it suggests that Git cannot be found by the system. There could be various reasons for this, but the primary cause is usually the absence of the Git program itself. If Git is installed, you will likely receive output specifying the installation directory of the program on your machine.
</p>



<br>
<br>
<br>



```bash {linenos=false}
which git
```

<br>
<br>
<br>

The which command is useful, but one problem is that it only checks the system's PATH to find the location of the Git executable. If Git is installed and properly configured in the PATH, it will output the path to the Git executable. However, it will not show you the version of the program installed on your machine. If you like to check the version as well you can use the following command after confirming that git exists on your machine to check its version as well.

<br>
<br>
<br>


```bash {linenos=false}
git --version
```


<!-- ############################################# Separator - Bottom ############################################# -->

<div class="line-divider-bottom">
  <hr class="left-line">
  <span>|</span>
  <span class="middle">Introduction</span>
  <span>|</span>
  <hr class="right-line">
</div>

<!-- ############################################# Separator - Bottom ############################################# -->






### Installing Git



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->


##### Windows

<ul class="justified-list">
    <li>Obtain the <a href="https://git-scm.com/download/win" target="_blank">git installer wizard for windows</a> from the official <a href="https://git-scm.com/" target="_blank">Git website</a> by clicking on the "Download" button. This will automatically download the latest version of Git for Windows. Make sure you download the appropriate installer depending if your machine is 64-bit or 32-bit.</li>
	<br>
	<br>
    <li>Once the download is complete, locate the downloaded installer file and double-click on it to run the installer. Follow the steps in the installation wizard. You can generally accept the default settings, but you may customize the installation directory if needed.</li>
	<br>
	<br>
	<li>During the installation process, you may be prompted to adjust your PATH environment. Select the recommended option "Use Git from the Windows Command Prompt" or "Use Git and optional Unix tools from the Command Prompt" for better command-line integration.</li>
	<br>
	<br>
	<li>Once the installation process is finished you can confirm your installation by revisiting the previsous section on <a href="#checking-if-git-is-installed-on-your-machine">Checking if Git is installed on your machine</a> for the windows part.</li>
</ul>



<br>
<br>
<br>


##### Linux

<ul class="justified-list">
    <li>Since there are an absolute immense amount of Linux distributions it is impossible to list them all here, therefore I leave it to you to find the neccessary command your linux platofrms package manager in order to install git. You can find the list of commands at the official page for <a href="https://git-scm.com/download/linux" target="_blank">installing git on Linux</a>, which already contains a comprehensive list. Make sure to get correct command and put it in your terminal.</li>
	<br>
	<br>
	<li>Once the installation process is finished you can confirm your installation by revisiting the previsous section on <a href="#checking-if-git-is-installed-on-your-machine">Checking if Git is installed on your machine</a> for the Linux part.</li>
</ul>


##### macOS

<ul class="justified-list">
    <li>According to the official git webpage guide on installing git for macOS the best way to install git for macOS is to use the homebrew package manager. You can use the following two commands to install both git and git-gui modules for macOS.</li>
</ul>

<br>
<br>
<br>



```bash {linenos=false}
brew install git
```

<br>


```bash {linenos=false}
brew install git-gui
```

<br>
<br>
<br>

<ul class="justified-list">
    <li>Once the homebrew packaeg manager is finished you can confirm your installation by revisiting the previsous section on <a href="#checking-if-git-is-installed-on-your-machine">Checking if Git is installed on your machine</a> for the macOS part.</li>
</ul>


<!-- ############################################# Separator - Bottom ############################################# -->

<div class="line-divider-bottom">
  <hr class="left-line">
  <span>|</span>
  <span class="middle">Introduction</span>
  <span>|</span>
  <hr class="right-line">
</div>

<!-- ############################################# Separator - Bottom ############################################# -->