# AP2 ZSH Theme

### Terminal Preview
![ZSH Preview](/images/1.png)

### Terminal Style
![ZSH Preview](/images/2.png)
![ZSH Preview](/images/3.png)

### Zsh Syntax Highlighting
```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
### Zsh Autosuggestions
```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

**`.zshrc`**
```shell
plugins=( git zsh-syntax-highlighting zsh-autosuggestions )
```

You can check how to install git on ubuntu and configure `.zsh`

[Install Git On Ubuntu 24.04](https://www.aungpyaephyo.com/blog/git-in-ubuntu)