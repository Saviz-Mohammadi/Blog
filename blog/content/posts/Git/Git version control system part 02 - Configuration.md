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

