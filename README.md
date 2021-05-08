# Ubuntu OP

A custom-built version of Ubuntu with 1Password for Linux and 1Password officially supported browsers preinstalled. This aids in testing via a reproducible environment as well as a quick way for folks not familiar with Linux to try 1Password for Linux.

## What is included?

- Ubuntu LTS
-
-
-
-

## What would I want this for?

- Testing 1Password in a clean and reproducible environnement.
- To try out 1Password for Linux without needing to fuss with how to install applications on Linux.
- You need a quick bootstrap to running 1Password in a VM.

## Why did you make it?

A few reasons:

- I came across someone who did a lot of the hard work creating the underlying scripts which quickly create a new ubuntu live iso.
- Github has actions now which are completely free public repositories. With a little bit of automation magic I now have an up-to-date version of Ubuntu with the latest version of 1Password and supported browsers.
- I couldn't sleep because my brain was racing about how cool this was.

## Todo

- Create SHA256 checksum and sign it using GPG on every iso creation.
- Create a sweet landing/download page. In the meantime, you can grab the latest version here:

## Authors

- **Andrew Beyer** - Maintainer of this fork which is a customization of
- **Marcos Vallim** - All credit for the underlying scripts and awesome documentation goes to to [mvallim](https://github.com/mvallim) and the other [contributors](https://github.com/mvallim/live-custom-ubuntu-from-scratch/blob/master/CONTRIBUTORS.txt) of [mvallim/live-custom-ubuntu-from-scratch](https://github.com/mvallim/live-custom-ubuntu-from-scratch).

## License

This project is licensed under the Apache License - see the [LICENSE](LICENSE) file for details.

The artifacts built by this project installs code from multiple open source projects as well as public software repositories for the following companies:

- 1Password (1Password for Linux, 1Password CLI)
- Brave (Browser)
- Google (Chrome)
- Microsoft (Edge)
- Mozilla (Firefox)

## Disclaimer

This project is not officially endorsed by any of the companies listed above. Please use any generated artifacts at your own risk.
