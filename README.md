# Termux Banner

A customizable persistent Termux startup banner that displays:

- User-defined banner name with colorful ASCII art
- Current date and time
- Network status (Wi-Fi, Mobile Data, or Offline)
- System uptime
- Colored separator line

## Features

- Saves banner name after first input
- Uses `figlet` and `lolcat` for colorful text display
- Automatically shows banner on Termux startup and after `clear` command

## Installation

1. Clone this repository:
```bash
git clone https://github.com/Cyb3rflex/termux-banner.git
```
2. Navigate into the directory:
```bash
cd termux-banner
```
3. Make the script executable:
```bash
chmod +x termux_banner.sh
```
4. Add the following lines into your `~/.bashrc`:
   ```bash
   nano ~/.bashrc
   ```
```bash
~/termux_banner.sh
alias clear='command clear && ~/termux_banner.sh'
alias c='clear'
```
5. Reload your shell or restart Termux.



## Requirements

- figlet (install with ```bash pkg install figlet```

- ruby and lolcat install with ```bash pkg install ruby and gem install lolcat```


## Usage

- Open Termux or run:
```bash
~/termux_banner.sh
```
to see your banner.


---

## Contributions and Feedback

Feel free to open issues or submit pull requests.

