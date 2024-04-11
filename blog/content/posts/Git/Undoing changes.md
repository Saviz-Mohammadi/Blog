---
title: "Undoing changes in git"
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
Git revert
The git revert command can be considered an 'undo' type command, however, it is not a traditional undo operation. Instead of removing the commit from the project history, it figures out how to invert the changes introduced by the commit and appends a new commit with the resulting inverse content. This prevents Git from losing history, which is important for the integrity of your revision history and for reliable collaboration.

Reverting should be used when you want to apply the inverse of a commit from your project history. This can be useful, for example, if you’re tracking down a bug and find that it was introduced by a single commit. Instead of manually going in, fixing it, and committing a new snapshot, you can use git revert to automatically do all of this for you.

How it works
The git revert command is used for undoing changes to a repository's commit history. Other 'undo' commands like, git checkout and git reset, move the HEAD and branch ref pointers to a specified commit. Git revert also takes a specified commit, however, git revert does not move ref pointers to this commit. A revert operation will take the specified commit, inverse the changes from that commit, and create a new "revert commit". The ref pointers are then updated to point at the new revert commit making it the tip of the branch.

To demonstrate let’s create an example repo using the command line examples below:

$ mkdir git_revert_test
$ cd git_revert_test/
$ git init .
Initialized empty Git repository in /git_revert_test/.git/
$ touch demo_file
$ git add demo_file
$ git commit -am"initial commit"
[main (root-commit) 299b15f] initial commit
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 demo_file
$ echo "initial content" >> demo_file
$ git commit -am"add new content to demo file"
[main 3602d88] add new content to demo file
n 1 file changed, 1 insertion(+)
$ echo "prepended line content" >> demo_file
$ git commit -am"prepend content to demo file"
[main 86bb32e] prepend content to demo file
 1 file changed, 1 insertion(+)
$ git log --oneline
86bb32e prepend content to demo file
3602d88 add new content to demo file
299b15f initial commit
Git logo
RELATED MATERIAL
Git cheat sheet
Check it out
Bitbucket logo
SEE SOLUTION
Learn Git with Bitbucket Cloud
Read tutorial
Here we have initialized a repo in a newly created directory named git_revert_test. We have made 3 commits to the repo in which we have added a file demo_file and modified its content twice. At the end of the repo setup procedure, we invoke git log to display the commit history, showing a total of 3 commits. With the repo in this state, we are ready to initiate a git revert.

$ git revert HEAD
[main b9cd081] Revert "prepend content to demo file" 1 file changed, 1 deletion(-)
Git revert expects a commit ref was passed in and will not execute without one. Here we have passed in the HEAD ref. This will revert the latest commit. This is the same behavior as if we reverted to commit 3602d8815dbfa78cd37cd4d189552764b5e96c58. Similar to a merge, a revert will create a new commit which will open up the configured system editor prompting for a new commit message. Once a commit message has been entered and saved Git will resume operation. We can now examine the state of the repo using git log and see that there is a new commit added to the previous log:

$ git log --oneline 1061e79 Revert "prepend content to demo file" 86bb32e prepend content to demo file 3602d88 add new content to demo file 299b15f initial commit
Note that the 3rd commit is still in the project history after the revert. Instead of deleting it, git revert added a new commit to undo its changes. As a result, the 2nd and 4th commits represent the exact same code base and the 3rd commit is still in our history just in case we want to go back to it down the road.

Common options
-e
--edit
This is a default option and doesn't need to be specified. This option will open the configured system editor and prompts you to edit the commit message prior to committing the revert

--no-edit
This is the inverse of the -e option. The revert will not open the editor.

-n
--no-commit
Passing this option will prevent git revert from creating a new commit that inverses the target commit. Instead of creating the new commit this option will add the inverse changes to the Staging Index and Working Directory. These are the other trees Git uses to manage the state of the repository. For more info visit the git reset page.

Resetting vs. reverting
It's important to understand that git revert undoes a single commit—it does not "revert" back to the previous state of a project by removing all subsequent commits. In Git, this is actually called a reset, not a revert.

Resetting vs reverting diagram
Reverting has two important advantages over resetting. First, it doesn’t change the project history, which makes it a “safe” operation for commits that have already been published to a shared repository. For details about why altering shared history is dangerous, please see the git reset page.

Second, git revert is able to target an individual commit at an arbitrary point in the history, whereas git reset can only work backward from the current commit. For example, if you wanted to undo an old commit with git reset, you would have to remove all of the commits that occurred after the target commit, remove it, then re-commit all of the subsequent commits. Needless to say, this is not an elegant undo solution. For a more detailed discussion on the differences between git revert and other 'undo' commands see Resetting, Checking Out and Reverting.  

Summary
The git revert command is a forward-moving undo operation that offers a safe method of undoing changes. Instead of deleting or orphaning commits in the commit history, a revert will create a new commit that inverses the changes specified. Git revert is a safer alternative to git reset in regards to losing work. To demonstrate the effects of git revert we leveraged other commands that have more in-depth documentation on their individual pages: git log, git commit, and git reset.



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













git revert
This command creates a new commit that undoes the changes from a previous commit. This command adds new history to the project (it doesn't modify existing history).

git checkout
This command checks-out content from the repository and puts it in your work tree. It can also have other effects, depending on how the command was invoked. For instance, it can also change which branch you are currently working on. This command doesn't make any changes to the history.

git reset
This command is a little more complicated. It actually does a couple of different things depending on how it is invoked. It modifies the index (the so-called "staging area"). Or it changes which commit a branch head is currently pointing at. This command may alter existing history (by changing the commit that a branch references).

Using these commands
If a commit has been made somewhere in the project's history, and you later decide that the commit is wrong and should not have been done, then git revert is the tool for the job. It will undo the changes introduced by the bad commit, recording the "undo" in the history.

If you have modified a file in your working tree, but haven't committed the change, then you can use git checkout to checkout a fresh-from-repository copy of the file.

If you have made a commit, but haven't shared it with anyone else and you decide you don't want it, then you can use git reset to rewrite the history so that it looks as though you never made that commit.

These are just some of the possible usage scenarios. There are other commands that can be useful in some situations, and the above three commands have other uses as well.








Some people say that git reset is better for local branches since online remote branch will give you errors saying that you need to pull before pushing and that it is better to use git revert since it creates a new commit and you can push it. But, this is total belony! git reset and git revert should be used based on which behaviour you perfer and not that one is better with remote and one is better with local. for the problem of remote with git reset you can use the command If you know you want to overwrite your remote you need to run git push --force and it will overwrite the remote with what’s on local. Just remember that this command is not undoable, but I assume that if you are so sure to overwrite, then you have noting to worry about. So, just know that both work, but the main question is what are you looking for? I personally tend to use git revert more because it is safer, you never know when someone wants to go back even after being sure that they dont want to and more importantly it is easier to work with pushing because of its nature.