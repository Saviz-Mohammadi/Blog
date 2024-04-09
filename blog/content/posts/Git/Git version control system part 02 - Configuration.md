---
title: "Git version control system part 02 - Configuration"
date: 2023-05-12T14:06:22-07:00
draft: true

weight: 1
---



<br>
<br>
<br>



### Setting up a project with Git



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



##### New (without any source code)

<p>
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
</p>



<br>
<br>

Version 1
```bash {linenos=false}
git init Project
```


Version 2
```bash {linenos=false}
git init
```


<br>
<br>
<br>



##### Already existing one

<p>
</p>



<br>
<br>
<br>



<!-- ############################################# Separator - Bottom ############################################# -->

<div class="line-divider-bottom">
  <hr class="left-line">
  <span>|</span>
  <span class="middle">Introduction</span>
  <span>|</span>
  <hr class="right-line">
</div>

<!-- ############################################# Separator - Bottom ############################################# -->




### Removing git from a project



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



##### New (without any source code)

<p>
As mentioned earlier for every project that is tracked by a git repository all the information is inside the .git folder, so one can easilly remove the repository tracking by simply deleting the hidden folder either via their Operating systems file manager through GUI (...). or via the following terminal commands per operating system:
</p>



<br>
<br>

Version 1
```bash {linenos=false}
git init Project
```


Version 2
```bash {linenos=false}
git init
```


<br>
<br>
<br>



##### Already existing one

<p>
</p>



<br>
<br>
<br>



<!-- ############################################# Separator - Bottom ############################################# -->

<div class="line-divider-bottom">
  <hr class="left-line">
  <span>|</span>
  <span class="middle">Introduction</span>
  <span>|</span>
  <hr class="right-line">
</div>

<!-- ############################################# Separator - Bottom ############################################# -->




### Checking the status of your repository



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->


##### Windows

<p>
One can check the current status of the repository, meaning the changes that need to be saved changes to files and other things, by simply typing the following command in the terminal. This command enables the programmer to view the current status of the repository:
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






### Adding files for staging



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->


##### Windows

<p>
To add filest to be staged by git, meaning for git to know to keep track of them, you can use the following command:

THere are multiple ways of specfiynig to git to add files to staging area index. You can either individually add all files or add all files at once. notice that there is a slight difference between the following 2 commands for adding all files. the . option means all files in the current directory where as the -A option means all files recursively. So, you want to make sure you add all files in every knoc and crany you must use the -A option. this option works well for a sceniario where not all of my files are in the current directory and are instead in multiple sub folders and a more complex architecutre, which is usually teh case with todays projects.


SCM’s offer a ‘staging area’. The staging area can be used to collect a group of edits before writing them to a commit. The staging area can be used to manage and review changes before creating the commit snapshot. Utilizing the staging area in this manner provides a buffer area to help refine the contents of the commit.
</p>


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






### Commiting



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->


##### Windows

<p>
Commiting is the process of telling git to proceed with actually staging the changes. The best way to think about committing is to think of as creating a save point or check point in a game that you can always go back to. This can be done by using the following command: It is commen practice to have the first commit text to be "First commit". But, generally it is better to have from here on onward the message to be something that is actually useful and describes what has happend at this saving point. For example... . Also important to note that it is best practice to create save points whenever something useful happens and keep it single pracitice. For example...


Commits are cheap and easy to make. They should be made frequently to capture updates to a code base. Each commit is a snapshot that the codebase can be reverted to if needed. Frequent commits give many opportunities to revert or undo work. A group of commits can be combined into a single commit using a rebase to clarify the development log.

Each commit has a corresponding log entry. At the time of commit creation, this log entry is populated with a message. It is important to leave descriptive explanatory commit log messages. These commit log messages should explain the “why” and “what” that encompass the commits content. These log messages become the canonical history of the project’s development and leave a trail for future contributors to review.
</p>


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



Thees are for the github section with pull and push:



SCM enables rapid updates from multiple developers. It’s easy to have a local copy of the codebase fall behind the global copy. Make sure to git pull or fetch the latest code before making updates. This will help avoid conflicts at merge time.

For those teams coming from a non-distributed VCS, having a central repository may seem like a good thing that they don't want to lose. However, while Git has been designed as a distributed version control system (DVCS), with Git, you can still have an official, canonical repository where all changes to the software must be stored. With Git, because each developer's repository is complete, their work doesn't need to be constrained by the availability and performance of the "central" server. During outages or while offline, developers can still consult the full project history. Because Git is flexible as well as being distributed, you can work the way you are accustomed to but gain the additional benefits of Git, some of which you may not even realise you're missing.

Having a full local history makes Git fast, since it means you don’t need a network connection to create commits, inspect previous versions of a file, or perform diffs between commits.

Many source code management tools such as Bitbucket enhance core Git functionality with pull requests. A pull request is a way to ask another developer to merge one of your branches into their repository. This not only makes it easier for project leads to keep track of changes, but also lets developers initiate discussions around their work before integrating it with the rest of the codebase. Since they’re essentially a comment thread attached to a feature branch, pull requests are extremely versatile. When a developer gets stuck with a hard problem, they can open a pull request to ask for help from the rest of the team. Alternatively, junior developers can be confident that they aren’t destroying the entire project by treating pull requests as a formal code review.



Many cloud based servers for git including github, bitbucket, gitlab and many more require you to login to their website before attempting to use git, which for this day and age is a very typical thing to do if you want to access accounts and online repos for verification.
5. (Optional) To make Git remember your username and password when working with HTTPS repositories, configure the git-credential-osxkeychain helper.

Install the git-credential-osxkeychain helper
Bitbucket supports pushing and pulling your Git repositories over both SSH and HTTPS. To work with a private repository over HTTPS, you must supply a username and password each time you push or pull. The git-credential-osxkeychain helper allows you to cache your username and password in the OSX keychain, so you don't have to retype it each time.

1. If you followed the MacPorts or Homebrew instructions above, the helper should already be installed. Otherwise you'll need to download and install it. Open a terminal window and check:

$ git credential-osxkeychain
usage: git credential-osxkeychain <get|store|erase>
If you receive a usage statement, skip to step 4. If the helper is not installed, go to step 2.

2. Use curl to download git-credential-osxkeychain (or download it via your browser) and move it to /usr/local/bin:

$ curl -O http://github-media-downloads.s3.amazonaws.com/osx/git-credential-osxkeychain
$ sudo mv git-credential-osxkeychain /usr/local/bin/
3. Make the file an executable:

$ chmod u+x /usr/local/bin/git-credential-osxkeychain
4. Configure git to use the osxkeychain credential helper.

$ git config --global credential.helper osxkeychain
The next time Git prompts you for a username and password, it will cache them in your keychain for future use.


Create a git tips and tricks section and add this:

https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet




If a project has already been set up in a central repository, the clone command is the most common way for users to obtain a local development clone. Like git init, cloning is generally a one-time operation. Once a developer has obtained a working copy, all version control operations are managed through their local repository.

git clone <repo url>
git clone is used to create a copy or clone of remote repositories. You pass git clone a repository URL. Git supports a few different network protocols and corresponding URL formats. In this example, we'll be using the Git SSH protocol. Git SSH URLs follow a template of: git@HOSTNAME:USERNAME/REPONAME.git

An example Git SSH URL would be: git@bitbucket.org:rhyolight/javascript-data-store.git where the template values match:

HOSTNAME: bitbucket.org
USERNAME: rhyolight
REPONAME: javascript-data-store
When executed, the latest version of the remote repo files on the main branch will be pulled down and added to a new folder. The new folder will be named after the REPONAME in this case javascript-data-store. The folder will contain the full history of the remote repository and a newly created main branch.

For more documentation on git clone usage and supported Git URL formats, visit the git clone Page.

