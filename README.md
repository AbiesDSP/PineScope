# PineScope

## Cross-Compiling
My build computer: Ubuntu
My pine phone: Manjaro, plasma mobile

### Sync pinephone sysroot to build system using rsync
rsync -avz user@ip:/usr user@ip:/lib /home/user/pine-sysroot

### Install toolchain on build system
sudo apt install gcc-aarch64-linux-gnu