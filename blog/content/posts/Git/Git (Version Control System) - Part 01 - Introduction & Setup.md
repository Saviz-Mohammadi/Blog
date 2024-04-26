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










### Configuring Git {#Configuring-Git}



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<p>
Like any other software, Git offers a specific set of configurations and settings to the programmer in order to operate optimally. In Git, a configuration file is a text file that stores preferences and settings for the Git Version Control System. These settings encompass various aspects such as user information, default behaviors for Git commands, aliases for commonly used commands, choice of editor for composing messages, and many more.
</p>



<br>
<br>



<p>
There are numerous configurations you can apply to this file. If you're only interested in setting up the essential configurations to ensure Git functions smoothly without errors, focus on configuring your email, user details, and maybe even your editor. You can do this by refering to the section of ... . However, If you're aiming for a deeper understanding of Git's configuration, it's essential to familiarize yourself with the various levels of configuration that Git provides.
</p>



<br>
<br>
<br>



##### Configuration Scopes {#Configuring-Git-Scopes}



<p> As mentioned earlier, Git stores configuration settings in a text file, where each setting is represented as a pair of values, typically with the setting preceding an equal sign and followed by the corresponding value. However, it's important to note that Git can have multiple levels of configuration files, and depending on their placement, certain settings take precedence over others. Here are the three situations for a Git configuration file:
</p>



<br>
<br>



<ul class="justified-list">
    <li><span class="special" style="font-weight: bold;">Local:</span> By default, every Git repository you create or clone from a central server will contain a Git configuration file named "config" located within the hidden <span class="special">.git</span> directory. Git typically prefers to use and write to this local-level config file unless otherwise specified. Local-level configuration settings are applied only within the context of the current working repository.</li>
	<br>
	<br>
	<li><span class="special" style="font-weight: bold;">Global:</span> Global-level configuration is user-specific, meaning it applies to an operating system user account. These configuration values are stored in a file located in the user's home directory, typically <span class="special">"~/.gitconfig"</span> on Unix systems and <span class="special">"C:\YourUserName\.gitconfig"</span> on Windows. These settings are associated with the logged-in user on the computer, thus applying to all local Git repositories under that user's existence on the machine.</li>
	<br>
	<br>
	<li><span class="special" style="font-weight: bold;">System:</span> System-level configuration applies universally across an entire machine, affecting all users and repositories. This configuration file resides in a <span class="special">"gitconfig"</span> file located off the system root path, typically <span class="special">"$(prefix)/etc/gitconfig"</span> on Unix systems. On Windows, you can find this file at <span class="special">"C:\Documents and Settings\All Users\Application Data\Git\config"</span> for Windows XP, and at <span class="special">"C:\ProgramData\Git\config"</span> for Windows Vista and newer versions.</li>
</ul>



<br>
<br>



<p>
What's the rationale behind this structure instead of having just one configuration file? Git opted for this approach to provide maximum flexibility. By having three stages and levels of importance, developers and companies can establish their own standards without conflicting with each other's settings. If there were only one configuration file, individual users would likely have to rewrite their preferred settings every time they started a new project to align with the specific needs and requirements of that project. Therefore, the order of priority for configuration levels is local, global, system. This hierarchy implies that when Git searches for a configuration value, it begins at the local level and cascades upwards to the system level.
</p>



<br>
<br>



<p>
 While it might be tempting to modify the system configuration file to apply settings universally, this is not typically the norm and can be inconvenient. For instance, if you share a computer with your other collegues, he/she may have different preferences for Git settings, such as a distinct username and email associated with her account. Thus, it's advisable not to tamper with the system configuration file unnecessarily. Generally, setting configurations at the global level is preferable, as it eliminates the need to reconfigure settings for each repository while still respecting the preferences of other users.
</p>



<br>
<br>
<br>



##### Printing Configuration Values {#Configuring-Git-Printing}



<p>
One fundamental application of git config is to use it to retrieve and display the value of a specific configuration. Git will search through system, global, and local configuration files to find the most appropriate value to display, if any exist. To retrieve configuration values in Git, you can employ the following command where you replace 'key' with the configuration key you wish to retrieve. The --show-origin option will show you from which of the git config files this setting originated from. You can omit this option, but I recommend keeping it in as it can be useful:
</p>



<br>
<br>



``` {linenos=false}
git config --get --show-origin key
```



<br>
<br>


<p>Here is a list of most commonly used commands for printing values registered in git config files:</p>



<br>
<br>



<p class="codeTitle">Registered name</p>

``` {linenos=false}
git config --get --show-origin user.name
```

<br>

<p class="codeTitle">Registered email</p>

``` {linenos=false}
git config --get --show-origin user.email
```



<br>
<br>



<p>
While those commands work, executing them individually can be tedious. A more efficient approach is to use the following git config command, which presents a comprehensive list of all Git configuration settings alongside their current values. When invoked, Git will output configuration settings from three potential sources, following a precedence order. In essence, this command provides a consolidated view of every setting from all configuration files, presented in one extensive output.
</p>



<br>
<br>



<p class="codeTitle">Shows list</p>

``` {linenos=false}
git config --list
```

<br>

<p class="codeTitle">Shows list (plus origin)</p>

``` {linenos=false}
git config --list --show-origin
```



<br>
<br>



<p>
If you wish to view settings and their values specifically from the local, global, or system configuration files, you can include an additional flag corresponding to their names, as demonstrated below. (Note: you can also include the --show-origin flag for confirmation, although it may seem redundant since you're already specifying the file you're listing. However, it could be useful for verifying the file's location):
</p>


<br>
<br>


<p class="codeTitle">Local</p>

``` {linenos=false}
git config --list --local
```

<br>

<p class="codeTitle">Local (plus origin)</p>

``` {linenos=false}
git config --list --local --show-origin
```



<br>
<br>

<p class="codeTitle">Global</p>

``` {linenos=false}
git config --list --global
```

<br>

<p class="codeTitle">Global (plus origin)</p>

``` {linenos=false}
git config --list --global --show-origin
```



<br>
<br>

<p class="codeTitle">System</p>

``` {linenos=false}
git config --list --system
```

<br>

<p class="codeTitle">System (plus origin)</p>

``` {linenos=false}
git config --list --system --show-origin
```

<br>
<br>
<br>



##### Changing Configuration Values {#Configuring-Git-Changing}



<p>
Modifying the settings of each configuration file typically involves navigating to their respective locations and editing them using a text editor. Fortunately, Git offers a more convenient method for accomplishing this. Simply execute the following set of commands, make the necessary edits, save, and exit the editor. Your desired configuration values will then be applied to the configuration files:
</p>


<br>
<br>

<p class="codeTitle">Local</p>

``` {linenos=false}
git config --local --edit
```

<br>

<p class="codeTitle">Global</p>

``` {linenos=false}
git config --global --edit
```

<br>

<p class="codeTitle">System</p>

``` {linenos=false}
git config --system --edit
```



<br>
<br>
<br>



##### Important Configuration Values {#Configuring-Git-Important}


<p>
There are numerous settings available for configuration in Git, but if you're eager to start using Git as soon as possible, the most crucial ones to set up are your username, email, and preferred editor. At its core, Git is a collaboration tool. When collaborating with others, it's essential for Git and programmers to know who made the changes/actions (this has to do with your username and email) and the rationale behind each change, typically conveyed through a text message (this relates to your chosen editor). Configuring these settings in the global config file is generally advisable to avoid the need for repeated changes in local config files, as these settings remain relatively stable. Below are the commands to configure each setting:
</p>

<br>
<br>

<p class="codeTitle">Global Username</p>

``` {linenos=false}
git config --global user.name "Your Name"
```

<br>

<p class="codeTitle">Global Email</p>

``` {linenos=false}
git config --global user.email "your.email@example.com"
```

<br>

<p class="codeTitle">Global Editor</p>

``` {linenos=false}
git config --global core.editor "editor_name"
```


For the editors you can can replace "editor_name" with the following set of values for each platform:

<p class="codeTitle">Windows</p>

``` {linenos=false}
Notepad++: "notepad++"
Visual Studio Code: "code" (if installed and added to PATH)
Sublime Text: "subl" (if installed and added to PATH)
Atom: "atom" (if installed and added to PATH)
Notepad: "notepad.exe"
```

<br>

<p class="codeTitle">Linux</p>

``` {linenos=false}
Vim: "vim"
Emacs: "emacs"
Nano: "nano"
```

<br>

<p class="codeTitle">macOS</p>

``` {linenos=false}
Vim: "vim"
Emacs: "emacs"
Nano: "nano"
```


-- Made a mistake when configuring?

there are a 1000 ways to do the same thing, but I will give you some of the most commond options that can be useful as you don't want to spent yoru entire life trying to figure this stuff out. 2 ways to go about correcting your mistakes. either you can simply try and change the configuration for a particular setting or collection of settings by simply calling the same command for changing them again, but this time the correct version like this: ... in that case I will refer you back to the list of commands so you can have a go at it again :)


But, if you simply want to reset something to its original then you can use these list of commands which simply use teh --unset flag which means reest or unset back to the default value. Note that this will reset configurations back to original, but you want to change them again, then you have to again change them using these commands referde to here:)


You can fully reset all properties to their default values for a particular git config the following ways:

git config --global --unset-all

naturally if you execute all 3 the entire git will be reset and good as new. Also note that some articles may mention to just delete the git config files, but I don't recommend this as there is no way to get them back.

Something that is worth mentionning is that sometimes you will see that your diffrenet levels of config files may not contain all the properties that they can like local will not contain user and email even though it totally can and you can even go ahead and add it if you like, but the reason for this is because it generally does not make sense to have this for every single local file and therefore git intelligently inserts it for just global at the initial installation since it makes more sense to have it in global than local. the same goes for many other settings.


Now if you simply want to reset all and don't care about changing them, then do this




<!-- ############################################# Separator - Bottom ############################################# -->

<div class="line-divider-bottom">
  <hr class="left-line">
  <span>|</span>
  <span class="middle">Introduction</span>
  <span>|</span>
  <hr class="right-line">
</div>

<!-- ############################################# Separator - Bottom ############################################# -->



