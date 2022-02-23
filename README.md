# wsl-use-windows-openssh
# Use your Windows SSH Agent in WSL2

This project sets your WSL installation to use the SSH agent built into Windows.
Did you know there's an SSH Agent built into Windows? What a world!

## To enable the Windows SSH Agent (one-time only)

```sh
## This will show a UAC dialog
wsl-enable-ssh-agent
```

Then, add a key:

```sh
ssh-add     ## Here's where you put in your password, once
```

## To install

```sh
sudo make install
```
