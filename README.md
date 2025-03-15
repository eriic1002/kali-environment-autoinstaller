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
   cd kali-environment-autoinstaller
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

## Contact
For questions, issues, or suggestions, please open an **issue** in the repository. 

## Information
**Disclaimer**: This script is provided "as is" without any warranty. Use it at your own risk.
