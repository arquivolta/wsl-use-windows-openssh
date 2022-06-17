# Use your Windows SSH Agent in WSL2

This project sets your WSL installation to use the SSH agent built into Windows.
Did you know there's an SSH Agent built into Windows? What a world!

## To install

1. Clone the repository from _within WSL_, to a WSL directory. This tool
   installs symbolic links which will be **completely broken** if you clone
   from Windows to a Windows directory.
2. From within the cloned repository, run the following:

```sh
sudo make install
```

## To enable the Windows SSH Agent (one-time only)

```sh
## This will show a UAC dialog
wsl-enable-ssh-agent
```

Then, add a key:

```sh
ssh-add     ## Here's where you put in your password, once
```

