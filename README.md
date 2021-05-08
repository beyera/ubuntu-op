# Ubuntu OP

A custom-built version of Ubuntu with 1Password for Linux and 1Password officially supported browsers preinstalled. This aids in testing via a reproducible environment and a quick way for folks not familiar with Linux to try 1Password for Linux.

## What's included?

- An updated version of Ubuntu 20.10
- The latest version of 1Password for Linux Beta
- The following browsers with 1Password in your browser set to install on launch
  - Firefox Stable
  - Google Chrome Stable
  - Microsoft Edge Beta
  - Brave Stable (1Password not installed by default)

## What would I want this for?

- Testing 1Password in a clean and reproducible environment.
- To try out 1Password for Linux without needing to fuss about how to install applications on Linux.
- You need a quickly bootstrap a VM and run 1Password.
- You use 1Password and Ubuntu and want a ton of browsers installed

## Download the latest iso

https://1pw.dev/download/ubuntu-op-latest.iso

## Why did you make it?

A few reasons:

- I came across someone who did a lot of the hard work creating the underlying scripts, which quickly create a new Ubuntu live iso.
- Github has actions that are entirely free public repositories. With a little bit of automation magic, I now have an up-to-date version of Ubuntu with the latest version of 1Password and supported browsers.
- I couldn't sleep because my brain wanted to make this.

## Todo

- Create SHA256 checksum and sign it using GPG on every iso creation.
- Create a sweet landing/download page. In the meantime, you can grab the [latest version here](https://1pw.dev/download/ubuntu-op-latest.iso).
- Test updating to Ubuntu 21.04
- Some fun customizations
  - Default wallpaper
  - Add 1Password to Gnome Dash

## Authors

- **Andrew Beyer** - Maintainer of this fork and developer of customizations.
- **Marcos Vallim** - All credit for the underlying scripts and awesome documentation goes to to [mvallim](https://github.com/mvallim) and the other [contributors](https://github.com/mvallim/live-custom-ubuntu-from-scratch/blob/master/CONTRIBUTORS.txt) of [mvallim/live-custom-ubuntu-from-scratch](https://github.com/mvallim/live-custom-ubuntu-from-scratch).

## License

This project is licensed under the Apache License - see the [LICENSE](LICENSE) file for details.

The artifacts built by this project install code from multiple open source projects as well as public software repositories for the following companies:

- 1Password (1Password for Linux, 1Password CLI)
- Brave (Browser)
- Google (Chrome)
- Microsoft (Edge)
- Mozilla (Firefox)

## Disclaimer

Any of the companies listed above does not officially endorse this project. You assume your own risk by using any of the generated artifacts.
