# Terminal-Started-Theme

> This project was inspired by Oh My Zsh. Every time Oh My Zsh updates, the terminal displays stunning colorful ASCII art that leaves a lasting impression. Since this visual effect only appears during updates, I created this project to bring a similar experience every time you connect via SSH.

A customized terminal startup theme that displays colorful ASCII art and system information when connecting via SSH.

## 🌟 Features

- Rainbow ASCII art welcome banner
- System information display including:
    - System load (as CPU usage percentage)
    - Memory usage
    - System uptime
    - CPU model and cores

## 📸 Preview

![Preview](Pic.png)

## 🚀 Installation

1. Clone this repository:
```bash
git clone https://github.com/Oakshen/Terminal-Started-Theme
```

2. Choose your preferred setup:

### Option A: SSH connections only
Copy the content from `zshrc_ssh_only` to your shell configuration file:
```bash
# For zsh users
cat zshrc_ssh_only >> ~/.zshrc

# For bash users
cat zshrc_ssh_only >> ~/.bashrc
```

### Option B: All terminal sessions
Copy the content from `zshrc_all_terminal` to your shell configuration file:
```bash
# For zsh users
cat zshrc_all_terminal >> ~/.zshrc

# For bash users
cat zshrc_all_terminal >> ~/.bashrc
```

3. Install required dependencies:
```bash
# For Ubuntu/Debian
sudo apt-get install lolcat figlet
```

💡 **Tips**: 
- Customize the rainbow text effect by modifying lolcat parameters: `lolcat -f -F 0.5`
- Generate different ASCII text art using `figlet`: `figlet -f slant "Your Text"`
- Create ASCII art without figlet using [ASCII-generator](https://github.com/vietnh1009/ASCII-generator)

## 💡 Requirements

- Zsh shell or Bash shell
- lolcat package
- figlet package

## 📄 License

MIT License

