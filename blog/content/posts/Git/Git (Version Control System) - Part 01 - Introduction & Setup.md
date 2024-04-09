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
</p>



<br>
<br>



<p>
Leading a team of over 2000 developers in today's complex software era to build a large-scale product poses as a formidable challenge. Before Version Control Systems became widely adopted, managing such projects was daunting. When multiple developers collaborate within a shared codebase, it's common for them to make edits to the same pieces of code. Even when developers appear to be working on separate features, those features often rely on shared code modules and attempting to make numerous edits simultaneously across different timestamps and platforms can lead to chaos.


For instance, Developer 1 may be currently focusing on Feature 1 and makes alterations to the codebase, only to later discover that Developer 2, also working on Feature 1, has made conflicting changes. Furthermore, developers might simultaneously tackle diverse tasks, like integrating new features or resolving bugs and other issues, leading to changes dispersed throughout various sections of the file tree. Moreover, developers lacking the most recent updates could be operating with obsolete and faulty codebases. Additionally, what if an error occurred necessitating a rollback to a prior version of the codebase?



Some systems in the past attempted to mitigate issues related to collaboration by allowing file locking, preventing concurrent access. However, this approach significantly hindered productivity as developers had to wait for files to become available (free) by the developer using it, leading to delays. While it's technically possible to develop software without using a Version Control System, doing so poses significant risks that no professional team would recommend. But, what exactly is a Version Control System? And how does a Version Control System help us in resolving the problems around collaboration?

</p>



<br>
<br>
<br>



##### What is a Version Control system?

<p>
Version control systems (VCS) are software tools designed to track changes made to files, particularly code modifications, throughout the development process. As software engineers often collaborate in groups dispersed across different locations, each member contributes specific functionalities or features to the project by modifying the source code. Version control systems facilitate efficient communication and management of these changes by recording who made the changes, what changes were made, and when they occurred.

Version control helps teams solve these kinds of problems, tracking every individual change by each contributor and helping prevent concurrent work from conflicting. Changes made in one part of the software can be incompatible with those made by another developer working at the same time. This problem should be discovered and solved in an orderly manner without blocking the work of the rest of the team.

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

git is also free and open source.

Having a distributed architecture, Git is an example of a DVCS (hence Distributed Version Control System). Rather than have only one single place for the full version history of the software as is common in once-popular version control systems like CVS or Subversion (also known as SVN), in Git, every developer's working copy of the code is also a repository that can contain the full history of all changes.


git is local, For example, say a developer, Alice, makes changes to source code, adding a feature for the upcoming 2.0 release, then commits those changes with descriptive messages. She then works on a second feature and commits those changes too. Naturally these are stored as separate pieces of work in the version history. Alice then switches to the version 1.3 branch of the same software to fix a bug that affects only that older version. The purpose of this is to enable Alice's team to ship a bug fix release, version 1.3.1, before version 2.0 is ready. Alice can then return to the 2.0 branch to continue working on new features for 2.0 and all of this can occur without any network access and is therefore fast and reliable. She could even do it on an airplane. When she is ready to send all of the individually committed changes to the remote repository, Alice can "push" them in one command.

The raw performance characteristics of Git are very strong when compared to many alternatives. Committing new changes, branching, merging and comparing past versions are all optimized for performance. The algorithms implemented inside Git take advantage of deep knowledge about common attributes of real source code file trees, how they are usually modified over time and what the access patterns are.

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
 if you've installed XCode (or it's Command Line Tools), Git may already be installed. Apple actually maintain and ship their own fork of Git, but it tends to lag behind mainstream Git by several major versions. You may want to install a newer version of Git using one of the methods below:
 
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

When you've successfully started the installer, you should see the Git Setup wizard screen. Follow the Next and Finish prompts to complete the installation. The default options are pretty sensible for most users

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



### Configuring Git for the first time



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->


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









In this document, we'll take an in-depth look at the git config command. We briefly discussed git config usage on our Setting up a Repository page.

The git config command is a convenience function that is used to set Git configuration values on a global or local project level. These configuration levels correspond to .gitconfig text files. Executing git config will modify a configuration text file.

We'll be covering common configuration settings like email, username, and editor. We'll discuss Git aliases, which allow you to create shortcuts for frequently used Git operations. Becoming familiar with git config and the various Git configuration settings will help you create a powerful, customized Git workflow.

Usage
The most basic use case for git config is to invoke it with a configuration name, which will display the set value at that name. Configuration names are dot delimited strings composed of a 'section' and a 'key' based on their hierarchy. For example: user.email

git config user.email
In this example, email is a child property of the user configuration block. This will return the configured email address, if any, that Git will associate with locally created commits.

git config levels and files
Before we further discuss git config usage, let's take a moment to cover configuration levels. The git config command can accept arguments to specify which configuration level to operate on. The following configuration levels are available:

Git branch
RELATED MATERIAL
Git branch
Read article
Bitbucket logo
SEE SOLUTION
Learn Git with Bitbucket Cloud
Read tutorial
--local
By default, git config will write to a local level if no configuration option is passed. Local level configuration is applied to the context repository git config gets invoked in. Local configuration values are stored in a file that can be found in the repo's .git directory: .git/config  

 --global
Global level configuration is user-specific, meaning it is applied to an operating system user. Global configuration values are stored in a file that is located in a user's home directory. ~ /.gitconfig on unix systems and C:\Users\\.gitconfig on windows  

 --system
System-level configuration is applied across an entire machine. This covers all users on an operating system and all repos. The system level configuration file lives in a gitconfig file off the system root path. $(prefix)/etc/gitconfig on unix systems. On windows this file can be found at C:\Documents and Settings\All Users\Application Data\Git\config on Windows XP, and in C:\ProgramData\Git\config on Windows Vista and newer.

Thus the order of priority for configuration levels is: local, global, system. This means when looking for a configuration value, Git will start at the local level and bubble up to the system level.  

Writing a value
Expanding on what we already know about git config, let's look at an example in which we write a value:

git config --global user.email "your_email@example.com"
This example writes the value your_email@example.com to the configuration name user.email. It uses the --global flag so this value is set for the current operating system user.

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

Merge tools
In the event of a merge conflict, Git will launch a "merge tool." By default, Git uses an internal implementation of the common Unix diff program. The internal Git diff is a minimal merge conflict viewer. There are many external third party merge conflict resolutions that can be used instead. For an overview of various merge tools and configuration, see our guide on tips and tools to resolve conflits with Git. 

git config --global merge.tool kdiff3
Colored outputs
Git supports colored terminal output which helps with rapidly reading Git output. You can customize your Git output to use a personalized color theme. The git config command is used to set these color values.

color.ui
This is the master variable for Git colors. Setting it to false will disable all Git's colored terminal output.
 

$ git config --global color.ui false
By default, color.ui is set to auto which will apply colors to the immediate terminal output stream. The auto setting will omit color code output if the output stream is redirected to a file or piped to another process.

You can set the color.ui value to always which will also apply color code output when redirecting the output stream to files or pipes. This can unintentionally cause problems since the receiving pipe may not be expecting color-coded input.

Git color values
In addition to color.ui, there are many other granular color settings. Like color.ui, these color settings can all be set to false, auto, or always. These color settings can also have a specific color value set. Some examples of supported color values are:

normal
black
red
green
yellow
blue
magenta
cyan
white
Colors may also be specified as hexadecimal color codes like #ff0000, or ANSI 256 color values if your terminal supports it.

Git color configuration settings
1. color.branch 

Configures the output color of the Git branch command 
2. color.branch.<slot> 

This value is also applicable to Git branch output. <slot> is one of the following: 
1. current: the current branch 
2. local: a local branch 
3. remote: a remote branch ref in refs/remotes 
4. upstream: an upstream tracking branch 
5. plain: any other ref
3. color.diff 

Applies colors to git diff, git log, and git show output 
4. color.diff.<slot> 

Configuring a <slot> value under color.diff tells git which part of the patch to use a specific color on. 
1. context: The context text of the diff. Git context is the lines of text content shown in a diff or patch that highlights changes. 
2. plain: a synonym for context 
3. meta: applies color to the meta information of the diff 
4. frag: applies color to the "hunk header" or "function in hunk header" 
5. old: applies a color to the removed lines in the diff 
6. new: colors the added lines of the diff 
7. commit: colors commit headers within the diff 
8. whitespace: sets a color for any whitespace errors in a diff
5. color.decorate.<slot> 

Customize the color for git log --decorate output. The supported <slot> values are: branch, remoteBranch, tag, stash, or HEAD. They are respectively applicable to local branches, remote-tracking branches, tags, stashed changes and HEAD. 
6. color.grep

Applies color to the output of git grep. 
7. color.grep. <slot> 

Also applicable to git grep. The <slot> variable specifies which part of the grep output to apply color. 
1. context: non-matching text in context lines 
2. filename: filename prefix 
3. function: function name lines 
4. linenumber: line number prefix 
5. match: matching text 
6. matchContext: matching text in context lines 
7. matchSelected: matching text in selected lines 
8. selected: non-matching text in selected lines 
9. separator: separators between fields on a line (:, -, and =) and between hunks (--) 
8. color.interactive 

This variable applies color for interactive prompts and displays. Examples are git add --interactive and git clean --interactive 
9. color.interactive.<slot> 

The <slot> variable can be specified to target more specific "interactive output". The available <slot> values are: prompt, header, help, error; and each act on the corresponding interactive output. 
10. color.pager

Enables or disables colored output when the pager is in use 
11. color.showBranch 

Enables or disables color output for the git show branch command 
12. color.status 

A boolean value that enables or disables color output for Git status 
13. color.status.<slot>

Used to specify custom color for specified git status elements. <slot> supports the following values:

1. header

Targets the header text of the status area
2. added or updated

Both target files which are added but not committed
3. changed

Targets files that are modified but not added to the git index
4. untracked

Targets files which are not tracked by Git
5. branch

Applies color to the current branch
6. nobranch

The color the "no branch" warning is shown in
7. unmerged

Colors files which have unmerged changes
Aliases
You may be familiar with the concept of aliases from your operating system command-line; if not, they're custom shortcuts that define which command will expand to longer or combined commands. Aliases save you the time and energy cost of typing frequently used commands. Git provides its own alias system. A common use case for Git aliases is shortening the commit command. Git aliases are stored in Git configuration files. This means you can use the git config command to configure aliases.

git config --global alias.ci commit
This example creates a ci alias for the git commit command. You can then invoke git commit by executing git ci. Aliases can also reference other aliases to create powerful combos.
 

git config --global alias.amend ci --amend
This example creates an alias amend which composes the ci alias into a new alias that uses --amend flag.

Formatting & whitespace
Git has several "whitespace" features that can be configured to highlight whitespace issues when using git diff. The whitespace issues will be highlighted using the configured color color.diff.whitespace

The following features are enabled by default:

blank-at-eol highlights orphan whitespaces at the line endings
space-before-tab highlights a space character that appears before a tab character when indenting a line
blank-at-eof highlights blank lines inserted at the end of a file
The following features are disabled by default

indent-with-non-tab highlights a line that is indented with spaces instead of tabs
tab-in-indent highlights an initial tab indent as an error
trailing-space is shorthand for both blank-at-eol and blank-at-eof
cr-at-eol highlights a carriage-return at the line endings
tabwidth= defines how many character positions a tab occupies. The default value is 8. Allowed values are 1-63
Summary
In this article, we covered the use of the git config command. We discussed how the command is a convince method for editing raw git config files on the filesystem. We looked at basic read and write operations for configuration options. We took a look at common config patterns:

How to configure the Git editor
How to override configuration levels
How to reset configuration defaults
How to customize git colors
Overall, git config is a helper tool that provides a shortcut to editing raw git config files on disk. We covered in depth personal customization options. Basic knowledge of git configuration options is a prerequisite for setting up a repository. See our guide there for a demonstration of the basics