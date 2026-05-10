---
layout: default
title: DRV Tutorial
---

## Distributed Runtime Verification in Proximity-based Networks: A Tutorial on the Aggregate Programming Approach

**WORK IN PROGRESS**

### Installation

The next sections contain the setup instructions based on the CMake build system for the various supported OSs. Jump to the section dedicated to your system of choice and ignore the others.

<!--
#### Windows

Pre-requisites:
- [MSYS2](https://www.msys2.org)
- [Asymptote](http://asymptote.sourceforge.io) (for building the plots)
- [Doxygen](https://www.doxygen.nl/) (for building the documentation)

At this point, run "MSYS2 MinGW x64" from the start menu; a terminal will appear. Run the following commands:
```
pacman -Syu
```
After updating packages, the terminal will close. Open it again, and then type:
```
pacman -Sy --noconfirm --needed base-devel mingw-w64-x86_64-toolchain mingw-w64-x86_64-cmake mingw-w64-x86_64-make git doxygen
```
The build system should now be available from the "MSYS2 MinGW x64" terminal.
-->

#### Linux

Pre-requisites:
- Xorg-dev package (X11)
- G++ 9 (or higher)
- CMake 3.18 (or higher)
- Asymptote (for building the plots)
- Doxygen (for building the documentation)

To install these packages in Ubuntu, type the following command:
```
sudo apt-get install xorg-dev g++ cmake asymptote doxygen
```
In Fedora, the `xorg-dev` package is not available. Instead, install the packages:
```
libX11-devel libXinerama-devel.x86_64 libXcursor-devel.x86_64 libXi-devel.x86_64 libXrandr-devel.x86_64 mesa-libGL-devel.x86_64
```

#### MacOS

Pre-requisites:
- Xcode Command Line Tools
- CMake 3.18 (or higher)
- Asymptote (for building the plots)
- Doxygen (for building the documentation)

To install them, assuming you have the [brew](https://brew.sh) package manager, type the following commands:
```
xcode-select --install
brew install cmake asymptote doxygen
```

### Obtaining the source code

To retrieve the source code clone the repository with the following command:

```bash
git clone https://github.com/fcpp-experiments/past-ctl-monitoring.git
```

#### Build the demos

The repository contains the source code of simulations running past-CTL monitors to verify different properties.

Launching the bash script without additional input showcase the list of available
simulations:

```bash
./make.sh
```

To build and run the drone recognition example execute the following command:

```bash
./make.sh drone_recognition
```

### Running a simulation

When launching a simulation it is initially paused by pressing the **P key** you can pause/unpause the execution.

You can toggle the grid visualization with the **G key** and toggle the link
visualization with the **L key**.

You can move the view around using the **W,A,S,D keys** and increase or decrease
the zoom factor using the **Q,E keys**.

Simulation speed can be increased or decreased using the **I,O keys** and by pressing the **H key** or any unmapped key the help menu is presented pausing the
simulation. To exit from the help menu press the **P key** again.

By **clicking** on a node in the simulation is possible to inspect the current
state of the storage memory of a node.
