
# Powershell-Profile 👋  

Hi there! This repository contains my powershell profile which I use daily! You are absolutely welcome to grab the profile, and submit PR for changes! 

## 🔗 Authors

- [@codebarbarian](https://www.github.com/codebarbarian)

## 🧠 Requirements

- PowerShell version 5.1
- International UTF-8 Support:
```text
    1. Open Powershell
    2. Run the following command to open language and region settings: intl.cpl
    3. Turn On: Beta: Use Unicode UTF-8 for Worldwide language support and Restart your computer
```
- There will be a bootstrap script for first time use. (NOT IMPLEMENTED YET)

## 🚀 Installation

```text
    The profile comes with everything you need to run it on your local system. Just make sure to to do everything
    that is described in the requirements section.
```
## ⚡️ Features

### Fast Debugging (Non Interruptive Module Import)

Debugging a module and don't wanna reload the entire powershell profile?

Go into the Module Directory where the module you wanna debug is:

```powershell
cd /Application/Int-Modules/ModuleName/
```
Issue the following command: 
```Powershell
Register-DebugTask -ModuleName ModuleName
```

Now, whenever you wanna reload that specific module just run Resolve-DebugTask
```powershell
Resolve-DebugTask
```