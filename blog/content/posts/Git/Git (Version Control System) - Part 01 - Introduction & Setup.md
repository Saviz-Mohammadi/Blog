---
title: "Git (Version Control System) - Part 01 - Introduction & Setup"
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



##### Motivational Problem



<p>
Leading a team of over 2000 developers in today's complex software era to build a large-scale product poses as a formidable challenge. Before Version Control Systems became widely adopted, managing such projects was daunting. When multiple developers collaborate within a shared codebase, it's common for them to make edits to the same pieces of code. Even when developers appear to be working on separate features, those features often rely on shared code modules and attempting to make numerous edits simultaneously across different timestamps and platforms can lead to chaos.
</p>



<br>
<br>



<p>
For instance, Developer 1 may be currently focusing on Feature 1 and makes alterations to the codebase, only to later discover that Developer 2, also working on Feature 1, has made conflicting changes. Furthermore, developers might simultaneously tackle diverse tasks, like integrating new features or resolving bugs and other issues, leading to changes dispersed throughout various sections of the file tree. Moreover, developers lacking the most recent updates could be operating with obsolete and faulty codebases. Additionally, what if an error occurred necessitating a rollback to a prior version of the codebase?
</p>



<br>
<br>



<p>
Some systems in the past attempted to mitigate issues related to collaboration by allowing file locking, preventing concurrent access. However, this approach significantly hindered productivity as developers had to wait for files to become available (free) by the developer using it, leading to delays. While it's technically possible to develop software without using a Version Control System, doing so poses significant risks that no professional team would recommend. But, what exactly is a Version Control System? And how does a Version Control System help us in resolving the problems around collaboration?
</p>



<br>
<br>
<br>



##### What is a Version Control System?



<p>
Version control Systems (VCS) are software tools designed to track changes made to files, particularly code modifications, throughout the development process. As software engineers often collaborate in groups dispersed across different locations, each member contributes specific functionalities or features to the project by modifying the source code. Version Control Systems facilitate efficient communication and management of these changes by recording who made the changes, what changes were made, and when they occurred.
</p>



<br>
<br>



<p>
Version Control Systems help teams by tracking every individual change made by each contributor and helping prevent concurrent work from conflicting. Changes made in one part of the software can be incompatible with those made by another developer working at the same time. This problem should be discovered and solved in an orderly manner without blocking the work of the rest of the team. Version Control Systems also offer the capability to revert back to previous stages of the code in case of errors such as accidental file deletion or corruption.
</p>



<br>
<br>
<br>



##### Version Control System types



<ul class="justified-list">
	<li><span class="special" style="font-weight: bold;">Centralized Version Control System (CVCS):</span> In CVCS, there exists a single repository, and each user maintains their own working copy. Users must commit their changes to the repository to make them visible to others, who can then update to see the modifications. However, CVCS has significant drawbacks, including the need for a constant network connection and the risk of data loss if the central server crashes.</li>
	<br>
	<br>
    <li><span class="special" style="font-weight: bold;">Distributed Version Control System (DVCS):</span> DVCS features multiple repositories, with each developer having their own repository and working copy. Changes made by a developer are initially reflected only in their local repository and must be pushed to the central repository to become visible to others. Similarly, updates do not automatically include changes made by others; developers need to pull those changes into their local repositories. DVCS offers several advantages over CVCS, such as faster operations, the ability to commit changes locally before pushing them to the main repository, and easier data recovery in the event of a central server failure.</li>
</ul>



<br>
<br>
<br>



##### What is Git?



<p>
Git is a free, open-source distributed version control system tool renowned for its ability to manage projects of varying sizes efficiently and swiftly by providing aid in the management and tracking of file changes, predominantly scripts and code-related files. It does this by diligently monitoring all modifications made to your code, enabling you to save your progress as snapshots in time. Git originated from the ingenious mind of Linus Torvalds, the mastermind behind the Linux operating system kernel.
</p>



<br>
<br>



<p>
 Git was initially conceived to tackle the intricate task of managing and monitoring changes within the Linux codebase, which involved contributions from a global community of developers. Git enables you to effortlessly revert to a previously functioning version. Similarly, it facilitates the retrieval of deleted code snippets or functionalities inadvertently removed during development. These are only some of the abilities of this amazing tool.
</p>



<br>
<br>



<p>
Whether you're a web developer, app developer, or any individual working with code and file modifications, Git proves to be an invaluable asset. The algorithms implemented inside Git take advantage of deep knowledge about common attributes of real source code file trees, how they are usually modified over time and what the access patterns are. This allows Git to be very performant compared to many other alternatives. Git is also local, this means that each developer can work on their own version and push the changes to a server when they wish to do so.
</p>



<br>
<br>
<br>



##### What is github?



<p>
GitHub is an online repository hosting service where you can store and share your Git repositories. You do not necessarily need GitHub to use Git - you can just work with your own Git repositories locally. However, GitHub is a safe place to keep your code that is not your own computer, so it is less likely that you or anyone you work with will lose your code. Aside from the ability to easily share and collaborate on your code with GitHub, GitHub also offers some other nice features such as the ability to more easily compare changes made to code, edit your code, search your repositories, and many more.
</p>



<br>
<br>



<p>
In this series of articles, we'll initially explore utilizing Git on your local machine independently. Subsequently, we'll delve into configuring Git to connect with a remote GitHub repository, highlighting the seamless integration of these two aspects. The rationale behind this approach is to emphasize that GitHub isn't a prerequisite for Git utilization.
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










### Checking for Git installation



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->


##### Windows


<ul class="justified-list">
	<li>Execute the command provided below via CMD or PowerShell (both work the same).</li>
</ul>



<br>
<br>



```powershell {linenos=false}
git --version
```



<br>
<br>



<ul class="justified-list">
	<li>If the program responds with the message seen below, it indicates that Git cannot be located by the system. There could be several reasons, but the primary reason is typically the absence of the Git program itself. If this is the case, then I recommend going to the next section about <a href="#Installing-Git-Windows">Installing Git - Windows</a>.</li>
</ul>



<br>
<br>



<p class="codeTitle">Output 1 (Git is not installed)</p>

```powershell {linenos=false}
'git' is not recognized as an internal or external command, operable program or batch file.
```



<br>
<br>



<ul class="justified-list">
	<li>If Git is installed you will most likely recieve the following output, where it indicates the version of Git on your machine. In this case being the version 2.44.0 for the Windows operating system.</li>
</ul>



<br>
<br>



<p class="codeTitle">Output 2 (Git is installed)</p>

```powershell {linenos=false}
git version 2.44.0.windows.1
```



<br>
<br>
<br>



##### Linux



<ul class="justified-list">
	<li>Execute the command provided below via Bash.</li>
</ul>



<br>
<br>



```bash {linenos=false}
which git
```



<br>
<br>



<ul class="justified-list">
	<li>If the terminal does not print anything, it suggests that Git cannot be found by the system. The following is a representation of how the terminal would typically respond. There could be various reasons for this, but the primary cause is usually the absence of the Git program itself. If this is the case, then I recommend going to the next section about <a href="#Installing-Git-Linux">Installing Git - Linux</a>.</li>
</ul>



<br>
<br>


<p class="codeTitle">Output 1 (Git is not installed)</p>

```bash {linenos=false}
username@ubuntu:~/Desktop$ which git
username@ubuntu:~/Desktop$
```



<br>
<br>



<ul class="justified-list">
	<li>If Git is installed, you will likely receive the following output specifying the installation directory of Git on your machine</li>
</ul>



<br>
<br>


<p class="codeTitle">Output 2 (Git is installed at location: "usr/bin/git")</p>

```bash {linenos=false}
username@ubuntu:~/Desktop$ which git
usr/bin/git
username@ubuntu:~/Desktop$
```



<br>
<br>



<ul class="justified-list">
	<li>The which command is useful, but one problem is that it only checks if Git is installed and will output the path to the Git executable. However, it will not show you the version of the program installed on your machine. If you like to check the version as well you can use the following command after confirming that git exists on your machine to check its version as well</li>
</ul>



<br>
<br>



```bash {linenos=false}
git --version
```



<br>
<br>



<ul class="justified-list">
	<li>Since we are sure that git is installed you will most likely recieve the following output, where it indicates the version of Git on your machine. In this case being the version 2.25.1</li>
</ul>



<br>
<br>



<p class="codeTitle">Output (Git is installed. Version is 2.25.1)</p>

```bash {linenos=false}
username@ubuntu:~/Desktop$ git version 2.25.1
```



<br>
<br>
<br>



##### macOS


<ul class="justified-list">
	<li>Execute the command provided below via the terminal (Zsh/Bash).</li>
</ul>



<br>
<br>



```bash {linenos=false}
which git
```



<br>
<br>



<ul class="justified-list">
	<li>If the terminal does not print anything, it suggests that Git cannot be found by the system. The following is a representation of how the terminal would typically respond. There could be various reasons for this, but the primary cause is usually the absence of the Git program itself. If this is the case, then I recommend going to the next section about <a href="#Installing-Git-Linux">Installing Git - Linux</a>.</li>
</ul>



<br>
<br>


<p class="codeTitle">Output 1 (Git is not installed)</p>

```bash {linenos=false}
MacBook-Pro:~ username$ which git
MacBook-Pro:~ username$
```



<br>
<br>



<ul class="justified-list">
	<li>If Git is installed, you will likely receive the following output specifying the installation directory of Git on your machine</li>
</ul>



<br>
<br>


<p class="codeTitle">Output 2 (Git is installed at location: "usr/bin/git")</p>

```bash {linenos=false}
MacBook-Pro:~ username$ which git
usr/bin/git
MacBook-Pro:~ username$
```



<br>
<br>



<ul class="justified-list">
	<li>The which command is useful, but one problem is that it only checks if Git is installed and will output the path to the Git executable. However, it will not show you the version of the program installed on your machine. If you like to check the version as well you can use the following command after confirming that git exists on your machine to check its version as well</li>
</ul>



<br>
<br>



```bash {linenos=false}
git --version
```



<br>
<br>



<ul class="justified-list">
	<li>Since we are sure that git is installed you will most likely recieve the following output, where it indicates the version of Git on your machine. In this case being the version 2.25.1</li>
</ul>



<br>
<br>



<p class="codeTitle">Output (Git is installed. Version is 2.25.1)</p>

```bash {linenos=false}
MacBook-Pro:~ username$ git version 2.25.1
```


<!-- ############################################# Separator - Bottom ############################################# -->

<div class="line-divider-bottom">
  <hr class="left-line">
  <span>|</span>
  <span class="middle">Checking for Git installation</span>
  <span>|</span>
  <hr class="right-line">
</div>

<!-- ############################################# Separator - Bottom ############################################# -->






### Installing Git



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->


##### Windows {#Installing-Git-Windows}

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

When you've successfully started the installer, you should see the Git Setup wizard screen. Follow the Next and Finish prompts to complete the installation. The default options are pretty sensible for most users

<br>
<br>
<br>


##### Linux {#Installing-Git-Linux}

<ul class="justified-list">
    <li>Since there are an absolute immense amount of Linux distributions it is impossible to list them all here, therefore I leave it to you to find the neccessary command your linux platofrms package manager in order to install git. You can find the list of commands at the official page for <a href="https://git-scm.com/download/linux" target="_blank">installing git on Linux</a>, which already contains a comprehensive list. Make sure to get correct command and put it in your terminal.</li>
	<br>
	<br>
	<li>Once the installation process is finished you can confirm your installation by revisiting the previsous section on <a href="#checking-if-git-is-installed-on-your-machine">Checking if Git is installed on your machine</a> for the Linux part.</li>
</ul>


##### macOS {#Installing-Git-macOS}

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



### Configuring Git for the first time



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->


<p>
In Git, a configuration file is a text file that stores settings and preferences for the Git version control system on your local system. These settings can include user information, default behaviors for Git commands, aliases for frequently used commands, and more. THere are tons of things that you can learn to apply to a configuration file, but for the sake of simplicity we will discuss very briefly what you need to setup in order to make Git work and not complain.


We'll be covering common configuration settings like email, username, and editor. We'll discuss Git aliases, which allow you to create shortcuts for frequently used Git operations. 


--local
By default, git config will write to a local level if no configuration option is passed. Local level configuration is applied to the context repository git config gets invoked in. Local configuration values are stored in a file that can be found in the repo's .git directory: .git/config  

 --global
Global level configuration is user-specific, meaning it is applied to an operating system user. Global configuration values are stored in a file that is located in a user's home directory. ~ /.gitconfig on unix systems and C:\Users\\.gitconfig on windows (Related to the loged in user on the computer, so per your account. Settings here are applied to all local git repositories on the machine that are unedr the users existinace) 

 --system
System-level configuration is applied across an entire machine. This covers all users on an operating system and all repos. The system level configuration file lives in a gitconfig file off the system root path. $(prefix)/etc/gitconfig on unix systems. On windows this file can be found at C:\Documents and Settings\All Users\Application Data\Git\config on Windows XP, and in C:\ProgramData\Git\config on Windows Vista and newer. (Lives in the machines system and is applied to absolutely everything, for all users and all repositories)
</p>



Thus the order of priority for configuration levels is: local, global, system. This means when looking for a configuration value, Git will start at the local level and bubble up (cascading order) to the system level.


Even though it may seem tempting to modify system config file and have everything be applied everywhere, but this is not really the norm and can be inconvinente as maybe lets say your lovely wife who also happens to be a programmer and shares a pc with you does not want your settings for git to be for her as well. She probably wants different settings including a different user name and email to be associated with her account. So don'tt messs around with this one if you can help it. mostyl global is better as it prevents you from having to redo settings for every repository that you create with git for your projects and at the same time does not mess with others users prefereneces.


Usage
The most basic use case for git config is to invoke it with a configuration name, which will display the set value at that name. Configuration names are dot delimited strings composed of a 'section' and a 'key' based on their hierarchy. For example: user.email

git config user.email
In this example, email is a child property of the user configuration block. This will return the configured email address, if any, that Git will associate with locally created commits.




The git config --list command displays a list of all Git configuration settings along with their current values. When you run this command, Git will output all configuration settings from three possible sources, listed in the following order of precedence: 

Repository-specific configuration: Settings specific to the current Git repository. These settings are stored in the .git/config file within the repository directory.

User-specific configuration: Settings specific to the current user. These settings are typically stored in the user's .gitconfig or .config/git/config file in their home directory (~).

System-wide configuration: Settings that apply to all users on the system. These settings are typically stored in the system-wide /etc/gitconfig or /usr/local/etc/gitconfig file.

in other words this command will show every setting from every config files perspective in one long ass output.


if for some reason you want to see only settings and their values from local, global, or system you can add an additional falg tat has their name correspoding like this:

git config --list --local

this will only show local git config file settings located in .git folder

git config --list --global
git config --list --system


The --show-origin flag is used with the git config --list command to display not only the configuration settings and their values but also the origin (source) of each setting.

When you run git config --list --show-origin, Git will not only list all configuration settings but also indicate where each setting was defined: whether it's in the system-wide configuration, the user-specific configuration, or the repository-specific configuration.



-- Edditing Settings


if you wish to just open these files like a text editor and then modify their values just type this command and once you edit them just save and exit the editor:

git config --local --edit
git config --global --edit


You can even navigate to the locations of each of these files on your machine and edit them in your favourite text editor. But the whole purpose of these commands is from having you to know where it is located on your system.

-- Made a mistake when configuring?

there are a 1000 ways to do the same thing, but I will give you some of the most commond options that can be useful as you don't want to spent yoru entire life trying to figure this stuff out. 2 ways to go about correcting your mistakes. either you can simply try and change the configuration for a particular setting or collection of settings by simply calling the same command for changing them again, but this time the correct version like this: ... in that case I will refer you back to the list of commands so you can have a go at it again :)


But, if you simply want to reset something to its original then you can use these list of commands which simply use teh --unset flag which means reest or unset back to the default value. Note that this will reset configurations back to original, but you want to change them again, then you have to again change them using these commands referde to here:)


You can fully reset all properties to their default values for a particular git config the following ways:

git config --global --unset-all

naturally if you execute all 3 the entire git will be reset and good as new. Also note that some articles may mention to just delete the git config files, but I don't recommend this as there is no way to get them back.

Something that is worth mentionning is that sometimes you will see that your diffrenet levels of config files may not contain all the properties that they can like local will not contain user and email even though it totally can and you can even go ahead and add it if you like, but the reason for this is because it generally does not make sense to have this for every single local file and therefore git intelligently inserts it for just global at the initial installation since it makes more sense to have it in global than local. the same goes for many other settings.


Now if you simply want to reset all and don't care about changing them, then do this


-- Setting up the editor


git config editor - core.editor
Many Git commands will launch a text editor to prompt for further input. One of the most common use cases for git config is configuring which editor Git should use. Listed below is a table of popular editors and matching git config commands:

Editor
config command
Atom

~ git config --global core.editor "atom --wait"~

emacs

~ git config --global core.editor "emacs"~

nano

~ git config --global core.editor "nano -w"~

vim

~ git config --global core.editor "vim"~

Sublime Text (Mac)

~ git config --global core.editor "subl -n -w"~

Sublime Text (Win, 32-bit install)

~ git config --global core.editor "'c:/program files (x86)/sublime text 3/sublimetext.exe' -w"~

Sublime Text (Win, 64-bit install)

~ git config --global core.editor "'c:/program files/sublime text 3/sublimetext.exe' -w"~

Textmate

~ git config --global core.editor "mate -w"~



##### Windows

if this is the first time you have installed git on your device, then you need to do a one-time configuration to make sure that git can work properly. You can add more description about this here... .Configure your Git username and email using the following commands, replacing Emma's name with your own. These details will be associated with any commits that you create:

$ git config --global user.name "Emma Paris"
$ git config --global user.email "eparis@atlassian.com"



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



