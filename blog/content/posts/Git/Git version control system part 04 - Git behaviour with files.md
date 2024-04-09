---
title: "Git version control system part 04 - Git behaviour with files"
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
Git ignore
Git sees every file in your working copy as one of three things:

1. tracked - a file which has been previously staged or committed;

2. untracked - a file which has not been staged or committed; or

3. ignored - a file which Git has been explicitly told to ignore.

Ignored files are usually build artifacts and machine generated files that can be derived from your repository source or should otherwise not be committed. Some common examples are:

dependency caches, such as the contents of /node_modules or /packages
compiled code, such as .o, .pyc, and .class files
build output directories, such as /bin, /out, or /target
files generated at runtime, such as .log, .lock, or .tmp
hidden system files, such as .DS_Store or Thumbs.db
personal IDE config files, such as .idea/workspace.xml
Ignored files are tracked in a special file named .gitignore that is checked in at the root of your repository. There is no explicit git ignore command: instead the .gitignore file must be edited and committed by hand when you have new files that you wish to ignore. .gitignore files contain patterns that are matched against file names in your repository to determine whether or not they should be ignored.

In this document, we'll cover:

Git ignore patterns
Shared .gitignore files in your repository
Personal Git ignore rules
Global Git ignore rules
Ignoring a previously committed file
Committing an ignored file
Stashing an ignored file
Debugging .gitignore files
Git ignore patterns
.gitignore uses globbing patterns to match against file names. You can construct your patterns using various symbols:

Pattern
Example matches
Explanation*
**/logs

logs/debug.log
logs/monday/foo.bar
build/logs/debug.log

You can prepend a pattern with a double asterisk to match directories anywhere in the repository.

**/logs/debug.log

logs/debug.log
build/logs/debug.log
but not
logs/build/debug.log

You can also use a double asterisk to match files based on their name and the name of their parent directory.

*.log

debug.log
foo.log
.log
logs/debug.log

An asterisk is a wildcard that matches zero or more characters.

*.log
!important.log

debug.log
but not
logs/debug.log

Prepending an exclamation mark to a pattern negates it. If a file matches a pattern, but also matches a negating pattern defined later in the file, it will not be ignored.

/debug.log

debug.log
but not
logs/debug.log

Patterns defined after a negating pattern will re-ignore any previously negated files.

debug.log

debug.log
logs/debug.log

Prepending a slash matches files only in the repository root.

debug?.log

debug0.log
debugg.log
but not
debug10.log

A question mark matches exactly one character.

debug[0-9].log

debug0.log
debug1.log
but not
debug10.log

Square brackets can also be used to match a single character from a specified range.

debug[01].log

debug0.log
debug1.log
but not
debug2.log
debug01.log

Square brackets match a single character form the specified set.

debug[!01].log

debug2.log
but not
debug0.log
debug1.log
debug01.log

An exclamation mark can be used to match any character except one from the specified set.

debug[a-z].log

debuga.log
debugb.log
but not
debug1.log

Ranges can be numeric or alphabetic.

logs

logs
logs/debug.log
logs/latest/foo.bar
build/logs
build/logs/debug.log

If you don't append a slash, the pattern will match both files and the contents of directories with that name. In the example matches on the left, both directories and files named logs are ignored

logs/

logs/debug.log
logs/latest/foo.bar
build/logs/foo.bar
build/logs/latest/debug.log

Appending a slash indicates the pattern is a directory. The entire contents of any directory in the repository matching that name – including all of its files and subdirectories – will be ignored

logs/
!logs/important.log

logs/debug.log
logs/important.log

Wait a minute! Shouldn't logs/important.logbe negated in the example on the left

Nope! Due to a performance-related quirk in Git, you can not negate a file that is ignored due to a pattern matching a directory

logs/**/debug.log

logs/debug.log
logs/monday/debug.log
logs/monday/pm/debug.log

A double asterisk matches zero or more directories.

logs/*day/debug.log

logs/monday/debug.log
logs/tuesday/debug.log
but not
logs/latest/debug.log

Wildcards can be used in directory names as well.

logs/debug.log

logs/debug.log
but not
debug.log
build/logs/debug.log

Patterns specifying a file in a particular directory are relative to the repository root. (You can prepend a slash if you like, but it doesn't do anything special.)

** these explanations assume your .gitignore file is in the top level directory of your repository, as is the convention. If your repository has multiple .gitignore files, simply mentally replace "repository root" with "directory containing the .gitignore file" (and consider unifying them, for the sanity of your team).*

In addition to these characters, you can use # to include comments in your .gitignore file:

# ignore all logs
*.log
You can use \ to escape .gitignore pattern characters if you have files or directories containing them:

# ignore the file literally named foo[01].txt
foo\[01\].txt
Git branch
RELATED MATERIAL
Git branch
Read article
Bitbucket logo
SEE SOLUTION
Learn Git with Bitbucket Cloud
Read tutorial
Shared .gitignore files in your repository
Git ignore rules are usually defined in a .gitignore file at the root of your repository. However, you can choose to define multiple .gitignore files in different directories in your repository. Each pattern in a particular .gitignore file is tested relative to the directory containing that file. However the convention, and simplest approach, is to define a single .gitignore file in the root. As your .gitignore file is checked in, it is versioned like any other file in your repository and shared with your teammates when you push. Typically you should only include patterns in .gitignore that will benefit other users of the repository.

Personal Git ignore rules
You can also define personal ignore patterns for a particular repository in a special file at .git/info/exclude. These are not versioned, and not distributed with your repository, so it's an appropriate place to include patterns that will likely only benefit you. For example if you have a custom logging setup, or special development tools that produce files in your repository's working directory, you could consider adding them to .git/info/exclude to prevent them from being accidentally committed to your repository.

Global Git ignore rules
In addition, you can define global Git ignore patterns for all repositories on your local system by setting the Git core.excludesFile property. You'll have to create this file yourself. If you're unsure where to put your global .gitignore file, your home directory isn't a bad choice (and makes it easy to find later). Once you've created the file, you'll need to configure its location with git config:

$ touch ~/.gitignore
$ git config --global core.excludesFile ~/.gitignore
You should be careful what patterns you choose to globally ignore, as different file types are relevant for different projects. Special operating system files (e.g. .DS_Store and thumbs.db) or temporary files created by some developer tools are typical candidates for ignoring globally.

Ignoring a previously committed file
If you want to ignore a file that you've committed in the past, you'll need to delete the file from your repository and then add a .gitignore rule for it. Using the --cached option with git rm means that the file will be deleted from your repository, but will remain in your working directory as an ignored file.

$ echo debug.log >> .gitignore
  
$ git rm --cached debug.log
rm 'debug.log'
  
$ git commit -m "Start ignoring debug.log"
You can omit the --cached option if you want to delete the file from both the repository and your local file system.

Committing an ignored file
It is possible to force an ignored file to be committed to the repository using the -f (or --force) option with git add:

$ cat .gitignore
*.log
  
$ git add -f debug.log
  
$ git commit -m "Force adding debug.log"
You might consider doing this if you have a general pattern (like *.log) defined, but you want to commit a specific file. However a better solution is to define an exception to the general rule:

$ echo !debug.log >> .gitignore
  
$ cat .gitignore
*.log
!debug.log
  
$ git add debug.log
  
$ git commit -m "Adding debug.log"
This approach is more obvious, and less confusing, for your teammates.

Stashing an ignored file
git stash is a powerful Git feature for temporarily shelving and reverting local changes, allowing you to re-apply them later on. As you'd expect, by default git stash ignores ignored files and only stashes changes to files that are tracked by Git. However, you can invoke git stash with the --all option to stash changes to ignored and untracked files as well.

Debugging .gitignore files
If you have complicated .gitignore patterns, or patterns spread over multiple .gitignore files, it can be difficult to track down why a particular file is being ignored. You can use the git check-ignore command with the -v (or --verbose) option to determine which pattern is causing a particular file to be ignored:

$ git check-ignore -v debug.log
.gitignore:3:*.log  debug.log
The output shows:

<file containing the pattern> : <line number of the pattern> : <pattern>    <file name>
You can pass multiple file names to git check-ignore if you like, and the names themselves don't even have to correspond to files that exist in your repository.
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

