# Kali Linux Environment Auto Installer 📀

This project provides an automatic installation script to set up a **Kali Linux** environment based in [s4vitar environment](https://hack4u.io/cursos/personalizacion-de-entorno-en-linux/). 
The `install.sh` script installs all necessary tools and configurations for a complete Kali Linux setup.

## Preview
![home-image](./images/background.png)
![nvim-image](./images/nvim.png)

## Requirements

Before running the installation script, make sure to execute:
```bash
sudo apt-get update && upgrade
```

## Installation Instructions

Follow the steps below to install the Kali Linux environment using the `install.sh` script:

1. **Clone the Repository**: First, clone this repository to your local machine.
   ```bash
   git clone https://github.com/eriic1002/kali-environment-autoinstaller.git
   cd work-environment-autoinstaller
   ```

2. **Grant Execution Permissions**: You must grant execution permissions to the `install.sh` script:
  ```bash
  chmod +x install.sh
  ```

3. **Execute the installer**: You have to execute it as a **non-privileged user** ⚠️:
   ```bash
   ./install.sh
   ```
4. Provide your user's password to use commands with sudo.
5. Follow the installation steps.

### Optional configurations after installation
If you want to set nvim transparent you can execute `configure-nvim.sh`.
If you want to set burpsuite to dark mode you can execute `configure-burpsuite.sh`.
1. **Open burpsuite**: to generate config files
1. **Grant Execution Permissions**: You must grant execution permissions to the `configure-burpsuite.sh` script:
```bash
chmod +x configure-burpsuite.sh
```
3. **Execute the configurator**:
```bash
./configure-burpsuite.sh
```
4. **Open vim**: to generate install required files
5. **Grant Execution Permissions**: You must grant execution permissions to the `configure-nvim.sh` script:
```bash
chmod +x configure-nvim.sh
```
6. **Execute the configurator**
```bash
./configure-nvim.sh
```
7. **Set oxocarbon theme**: Execute vim and do space + t + h and select oxocarbon theme

## Contact
For questions, issues, or suggestions, please open an **issue** in the repository. 

## Information
**Disclaimer**: This script is provided "as is" without any warranty. Use it at your own risk.
