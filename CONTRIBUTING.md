# Complete installation guide for contributors
Some quick notes:
* Before following this guide, please [create a GitHub account](https://github.com/join) if you have not already done so
* This guide was written for Windows 10, but it should work for Windows 7 as well
* If you are already familiar with GitHub and you have set up pushing to repos from your Windows PC, then you can skip steps 2, 3, 5 and 6 of this guide
* I am assuming you have your file explorer set to [show file extensions](http://www.sevenforums.com/tutorials/10570-file-extensions-hide-show.html)

### Step 1: Installing Node.js
1. Go to [NodeJS.org](https://nodejs.org)
2. Click the install button to download the installer
3. Run the installer (all the default settings are fine)

### Step 2: Installing Git for Windows
1. Go to [git-scm.com/download/win](http://git-scm.com/download/win)
2. The correct installer should start downloading automatically
3. Open the installer
4. Click next until presented with the Component Selection screen
5. Ensure _Associate .git* configuration files with the default text editor_ is checked, then click next
6. When you've arrived at the _Adjusting your PATH environment_ screen, select _Use Git from the Windows Command Prompt_ and click next
7. Ensure _Checkout Windows-style, commit Unix-style line endings_ is selected **(important)**
8. Leave the rest of the settings at their defaults and click next until the setup is finished

### Step 3: Installing SmartGit
SmartGit is a Git client. It is not required (in theory you could use only the command line), but it is highly recommended. [GitHub for Windows](https://desktop.github.com) is a reasonable though less versatile alternative.

1. Go to [syntevo.com/smartgit](http://www.syntevo.com/smartgit)
2. Click the download button to download a .zip file containing the installer
3. Run the installer (all the default settings are fine)

### Step 4: Installing Sublime Text 3
You will need a text editor that has syntax highlighting for CoffeeScript, Jade, Stylus and JSON.
Sublime Text 3 is recommended, but not required.

1. Go to [sublimetext.com/3](http://www.sublimetext.com/3)
2. Download the 64-bit installer if your OS is 64-bit, otherwise download the regular installer
3. Open the installer
4. You will probably want to enable the _Add to explorer context menu_ option, but the rest of the defaults are fine

### Step 5: Configuring SmartGit
1. Open SmartGit. The first-time setup wizard should start
2. Accept the license agreement and select **non-commercial use**
3. Check _I confirm solely non-commercial use_ and click OK on the pop-up window
4. Select _Use SmartGit as SSH client_ and press next
5. Enter a username (preferably your GitHub username) and your email address and click next. **This information is required for git pushing to function**, although you _can_ enter fake information if you prefer
6. When asked to configure a hosting provider, select GitHub and enter your GitHub username under _Account_
7. Follow the on-screen instructions to generate an API token. When asked to configure a SmartGit master password, **please do so** and make sure it's one you'll remember.
8. Skip the _existing repositories_ screen, then click finish to finish the first-time setup
9. Close the welcome screen that appears, then go to Edit > Preferences
10. Select your GitHub account under _Hosting Providers_ and click Edit
11. Check _Use SSH instead of https to access repositories_ and click OK, then click OK to save your preferences
12. Exit SmartGit (Alt+X)

### Step 6: Setting up your SSH keys
1. Follow [GitHub's Generating SSH keys guide](https://help.github.com/articles/generating-ssh-keys/), **but at step 3.1 run ``eval `ssh-agent -s` `` instead**

### Step 7: Configuring Sublime Text 3
1. Follow the installation guide at [packagecontrol.io/installation](https://packagecontrol.io/installation) to install the Sublime Text 3 package manager
2. Restart Sublime
3. Press Ctrl+Shift+P in Sublime to open the command palette
4. Type `install`, then select _Install Package_ by either clicking it or pressing enter if it's on top of the list
5. After a short delay, a search bar should appear with a list of matching packages below it
6. Search for and install the following packages, repeating steps 3-5 as needed:
   * `Better CoffeeScript`
   * `Jade`
   * `Monokai JSON+`
   * `Stylus`
   * `INI` (for Sublime Text 2, works for 3 as well)
7. Restart Sublime (You can close the _Package Control Messages_ tab)
8. Under View > Indentation, click _Indent Using Spaces_ and _Tab Width: 2_ **(important)**
9. Under Preferences > Color Scheme > Monokai JSON+, click Monokai JSON+

### Step 8: Installing Karma's global dependencies
1. Open `cmd.exe`
2. Run the following command: `npm install -g coffee-script & npm install -g grunt-cli & npm install -g mocha`
3. Assuming no errors were thrown, your system is now configured to run Karma and you can close cmd

### Step 9: Downloading and configuring Karma
1. Open SmartGit
2. On the welcome screen that appears, select _clone an existing repository_
3. Enter `git@github.com:eve-apps/karma.git` as the repository URL and click next
4. Enter your SSH key passphrase, check _Store passphrase_ and click login
5. Enter your SmartGit master password when prompted and click OK
6. Keep _Include Submodules_ and _Fetch all Heads and Tags_ checked and click next
7. Specify a directory to download the project to. I recommend `[username]/Documents/Projects/Karma`
8. Once it is done cloning, SmartGit's file list may still appear empty because unchanged files are not shown. There is a row of file icons on the top right above the file list. Hover over them to view their tooltips which explain what they do, or just press Ctrl+1 to show unchanged files
9. Open a command prompt in the folder where you cloned Karma (You can press Alt, F, P in sequence in Windows 10's file explorer)
10. Run `npm install` to automagically download and install all the project's dependencies
11. In Sublime, click Project > Add folder to project and select the Karma folder
12. Sublime should now show a sidebar with a tree view of all the files and folders in the Karma folder. If this sidebar does not appear, click View > Side Bar > Show Side Bar
13. Click Project > Save project as, type `karma` as the file name and save the file in the Karma folder

### Step 10: Running Karma
1. Open a command prompt in the folder where you cloned Karma (or use the one from the last step if you haven't closed it yet)
2. Type `grunt` and press enter. Karma should then be available in the browser at http://127.0.0.1:3436 after a few seconds
