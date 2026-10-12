# Skylanders Portal Emulator
## Table of Contents
<!-- TOC -->
* [Skylanders Portal Emulator](#skylanders-portal-emulator)
  * [Table of Contents](#table-of-contents)
  * [Contact Information](#contact-information)
  * [Legality](#legality)
  * [AI Usage](#ai-usage)
  * [Background](#background)
  * [Description](#description)
    * [Features](#features)
    * [Limitations](#limitations)
  * [Motivation](#motivation)
  * [Operating System Compatibility](#operating-system-compatibility)
  * [Console Compatibility](#console-compatibility)
  * [Using](#using)
    * [Prerequisites](#prerequisites)
    * [Installing](#installing)
    * [Configuring the app](#configuring-the-app)
      * [Obtaining Figurine Dumps](#obtaining-figurine-dumps)
      * [Obtaining Figurine Icons](#obtaining-figurine-icons)
      * [Creating Figurine Groups](#creating-figurine-groups)
      * [Adding a Figurine](#adding-a-figurine)
      * [Removing Groups or Figurines](#removing-groups-or-figurines)
    * [Playing the Games with the Emulator](#playing-the-games-with-the-emulator)
      * [Setting Up](#setting-up)
      * [Transferring Figurines between the App and the Game](#transferring-figurines-between-the-app-and-the-game)
      * [Troubleshooting](#troubleshooting)
    * [Uninstalling](#uninstalling)
  * [Building](#building)
  * [Planned Features](#planned-features)
  * [Resources and Tools Used](#resources-and-tools-used)
  * [Credits](#credits)
<!-- TOC -->
## Contact Information
You may [create a GitHub Issue](https://github.com/alexander-shaffer/skylanders-portal-emulator/issues/new) if you need help, want to suggest features, have found a bug, or have other questions. There are no formatting rules or topic restrictions. Alternatively, you may email me at alexander.shaffer.623@gmail.com.
## Legality
This project is a non-commercial, fan-made creation designed for entertainment and educational purposes only. It is not approved by or affiliated with Activision Publishing, Inc. or any of its current or former affiliated companies. These companies include but are not limited to TFB Games, Inc. and Vicarious Visions, Inc. All rights are reserved to their respective owners. 

This repository does not contain any copyrighted images or assets from the Skylanders franchise, or any proprietary information like encryption keys or code. Also, no proprietary code was decompiled or reverse-engineered to develop this project. Because the true implementation of the Skylanders portal is unknown, this project strictly follows a [clean-room design](https://en.wikipedia.org/wiki/Clean-room_design), and is protected by the legal precedent established in [Sony Computer Entertainment v. Connectix Corporation](https://en.wikipedia.org/wiki/Sony_Computer_Entertainment,_Inc._v._Connectix_Corp.).
## AI Usage
This project will always be 100% open source and human-made. All files in this repository contain zero AI-generated text or code. Although some AI models can drastically accelerate software development, this project is intended to represent the extent of my programming knowledge.

I use Google Gemini to find resources, summarize topics, or identify best practices, but I never use it to understand concepts in detail. The [Resources and Tools Used](#resources-and-tools-used) and [Credits](#credits) sections document where I source most of my information.
## Background
[Skylanders](https://en.wikipedia.org/wiki/Skylanders) is a video game franchise that features six mainline [toys-to-life](https://en.wikipedia.org/wiki/Toys-to-life) games. These games encourage players to purchase five figurine types: Skylanders, Traps, Vehicles, Creation Crystals, and Magic Items. The Skylanders type can be further categorized into Cores, Giants, Swappers, LightCores, Trap Masters, Minis, Eon’s Elites, SuperChargers, and Senseis. In addition, players must purchase a circular platform known as a portal, which is a [USB HID](https://en.wikipedia.org/wiki/USB_human_interface_device_class) device that contains a [NFC](https://en.wikipedia.org/wiki/Near-field_communication) reader/writer.

To play the games, players plug the portal into their console. Then, they place one or more figurines on the portal, transferring each into the game. While a figurine is on the portal, the game frequently reads and writes data to the NFC tag embedded in it. When a figurine is removed from the portal, it is removed from the game.

Skylanders: Trap Team is the only game to introduce a portal embedded with a speaker. This speaker occasionally plays audio depending on game events and the player's actions.
## Description
This project emulates the Skylanders: Trap Team portal using a [Pico Series Raspberry Pi](https://www.raspberrypi.com/documentation/microcontrollers/pico-series.html) controlled by a user interacting with a desktop app. Users plug this Pico, which mimics the original portal and communicates to the user's computer via Bluetooth, into their console. Please watch this [YouTube demonstration video](TBD).
### Features
- This project is compatible with all figurines and the six mainline games.
- Users transfer displayed figurines between their computer and the game by clicking its icon on the app.
- The app automatically plays the same audio as the original portal.
- The app can display the top and bottom halves of Swappers vertically adjacent to each other.
- Users can mark figurine icons on the app with a red tint. This feature is helpful for keeping track of defeated Skylanders.
- Users can assign figurines to groups. The app displays figurines in the same group adjacent to each other.
### Limitations
- Users must source figurine data and icons themselves and store them on the computer running the app.
- The app does not automatically detect figurine types.
- Updated figurine data is only saved onto the user's computer when they remove it from the game.
## Motivation
The toys-to-life aspect of the Skylanders franchise is arguably its most appealing feature. This appeal is rooted in how almost all figurines have unique in-game abilities. Also, some game content is only accessible if the player owns a specific figurine type.

The last mainline game was released in 2016, yet there has been a recent resurgence in the franchise. Because the figurines are no longer being produced, they are only distributed by resellers, and their prices have risen significantly.

Workarounds to the rising prices exist, but have major disadvantages. For instance, figurine data can be written to blank NFC tags using a specific NFC reader/writer. However, keeping track of which figurines are stored on a set of NFC tags is tedious.

This project makes purchasing NFC tags obsolete for the [compatible consoles](#console-compatibility) because the app can display a virtually unlimited number of figurines. Also, the cost of this project is fixed. In comparison, players must purchase additional NFC tags if they wish to store more figurines at once.

Although this project grants players the freedom to play Skylanders without overspending, it will never extinguish the hobby of collecting the original figurines.
## Operating System Compatibility
| Name(s) or Description                             | Compatible |
|----------------------------------------------------|------------|
| Windows 10 and Windows 11                          | Yes        |
| Other Windows versions                             | Untested   |
| Debian, Fedora, and Arch-based Linux distributions | Yes        |
| Other Linux distributions                          | Untested   |
| macOS                                              | Yes        |
## Console Compatibility
| Names(s)                 | Compatible | Reason                                                                                                                                                                        |
|--------------------------|------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| PS3, PS4, Wii, and Wii U | Yes        | These consoles do not authenticate USB devices.                                                                                                                               |
| Xbox 360 and Xbox One    | No         | If a USB device lacks a proprietary computer chip used for authentication, the Xbox rejects it.                                                                               |
| Nintendo Switch          | No         | The Nintendo Switch version does not support an external portal. Instead, players transfer figurines to the game using an NFC reader/writer embedded in a Joy-Con controller. |

> [!NOTE]
> This project supports emulators compatible with the original portals that can run the supported game versions listed above. Therefore, [RPCS3](https://rpcs3.net), [Dolphin](https://dolphin-emu.org/), and [CEMU](https://cemu.info/) are supported.
## Using
### Prerequisites
Ensure you have access to the following before continuing:
- Raspberry Pi Pico W or Raspberry Pi Pico 2 W (pin headers are not required)
- USB-A to Micro-B cable
- Desktop computer or laptop with a [compatible operating system](#operating-system-compatibility)
- Bluetooth adapter that supports Bluetooth Low Energy (BLE) and connects to your computer
- [Compatible console](#console-compatibility)
> [!IMPORTANT]
> It is likely your computer already has a Bluetooth adapter. If you experienced pairing Bluetooth devices to your computer, then it has a Bluetooth adapter. Today, almost all Bluetooth adapters support BLE.

> [!TIP]
> Here are products that meet some of these prerequisites:
> - Bundled Raspberry Pi Pico W with headers and USB-A to Micro-B cable: [Amazon link](https://www.amazon.com/waveshare-Pre-Soldered-Pi-Pico-Microcontroller/dp/B0BN14J26Q?ref_=ast_bl_cpl_dp)
> - Bundled Raspberry Pi Pico 2 W with headers and USB-A to Micro-B cable: [Amazon Link](https://www.amazon.com/waveshare-Pre-Soldered-Raspberry-Microcontroller-Bluetooth/dp/B0DQ7NHGH8?ref_=ast_bl_cpl_dp)
> - USB Bluetooth adapter that supports BLE: [Amazon Link](https://www.amazon.com/Long-Range-USB-Bluetooth-Adapter-Desktop/dp/B0C1ZDYFSZ/ref=ast_sto_dp_puis?th=1)
### Installing
TODO
### Configuring the app
Below is a list of resources you can use to obtain figurine dumps and icons, which are required to use this project. Consider conducting your own research to discover alternative resources.
#### Obtaining Figurine Dumps
- [Skylanders Ultimate NFC Pack](https://github.com/skylandersnfc/Skylanders-Ultimate-NFC-Pack/): A GitHub repository containing a comprehensive collection of figurine dumps from each game.
- [SkyDumps Generator](https://skylandersnfc.github.io/SkyDumps-Generator/): A website that allows you to generate dumps with specific UIDs.
- [RPCS3](https://rpcs3.net) or [Dolphin](https://dolphin-emu.org/): These emulators have a built-in feature that generates figurine dumps.
#### Obtaining Figurine Icons
There are no image size requirements for the icons. The app displays six icons per row by scaling the icons to have the same width. 
- [Skylanders Image Generator](https://skylandersnfc.github.io/Skylanders-Image-Generator/): Generates figurine icons for a specific game. You can right-click an icon and select `Save Image As` to download it.
- Drawing your own images using an image editor like [GIMP](https://www.gimp.org/) or [Paint.NET](https://paint.net/).
#### Creating Figurine Groups
1. If missing, create a folder named `Figures` in the same location as the app binary.
2. Create a folder within `Figures` named after the group you wish to create.
3. Create a folder named `Dumps` and another named `Icons` within the group folder.
4. You may optionally create a directory named `Top Halves` and another named `Bottom Halves` within the group folder. These two folders must have their own `Dumps` and `Icons` folders.
#### Adding a Figurine
1. Ensure the figurine dump and icon files have the same name. Differing file extensions are allowed.
2. Find the `Dumps` and `Icons` folders for the group or Swapper half to which you are assigning the figurine.
3. Move the figurine dump into the `Dumps` folder.
4. Move the figurine icon into the `Icons` folder.
#### Removing Groups or Figurines
Delete or move out their corresponding files from the `Figures` folder.
### Playing the Games with the Emulator
#### Setting Up
- Plug the Pico into the console.
- Boot the game.
- The app will automatically connect to the Pico.
- Ensure the location of the Pico does not disrupt the connection by maximizing its line of sight to your computer's Bluetooth adapter.
#### Transferring Figurines between the App and the Game
Left-clicking a figurine causes the app to transfer it to the game. The app displays all active figurines in a gold tint. Left or right-clicking the figurine again will remove it from the game, and any modifications to the figurine by the game are saved. Like the original portals, at most 16 figurines can be active at a time.

Right-clicking a figurine causes it to display in a red tint. Because the game never notifies the portal when a figurine is defeated or used, the red tint is intended to help the user keep track of used and defeated figurines. However, the user may interpret the red tint in any way they wish. Marking a figurine red is purely visual and serves no functional purpose. Left or right-clicking the figurine again will remove the red tint.

Pressing the middle mouse button removes all figurines from the game and red tints. This action is helpful after all figurines are revived when a level in the game ends or is restarted.

If there are too many figurines to display all at once, use the scroll wheel to scroll up and down.
#### Troubleshooting
- If the figurine icon is blank, then the app failed to read the icon file. Ensure the icon file has a supported format like `.jpg` or `.png` and the app has permission to read it.
- If the figurine icon is displayed in a blue tint, then the app failed to read or write to the dump file. Ensure the app has permission to read and write to the dump file.
- If the game displays an error while receiving a figurine from the app, then the dump file is invalid or corrupted.
### Uninstalling
Because the app never saves data outside the `Figures` directory, uninstalling is as simple as deleting the app binary and the `Figures` directory.

The binary stored on the Pico does not need to be deleted. It is naturally replaced when another binary is flashed onto it.
## Building
TODO
## Planned Features
- Automatically generate figurine dumps and icons.
- Automatically detect figurine types.
- Implement a figurine search and filter system.
- Implement a figurine backup system.
- Port the app to mobile devices.
- Allow mobile devices to plug into consoles and emulate the portal.
- Implement an overlay mode that makes the app easier to use on console emulators.
- Allow users to view and edit figurine data.
## Resources and Tools Used
| Name(s)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Description and Usage                                                                                           |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
| [Beginning C++23: From Beginner to Pro](https://link.springer.com/book/10.1007/978-1-4842-9343-0)                                                                                                                                                                                                                                                                                                                                                                                                                | A book containing core C++ concepts.                                                                            |
| [cppreference.com](https://cppreference.com/)                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | A website that documents the C++ standard library and language.                                                 |
| [CMake Documentation](https://cmake.org/cmake/help/latest/)                                                                                                                                                                                                                                                                                                                                                                                                                                                      | CMake is a build system generator that can automatically fetch library dependencies.                            |
| [Wireshark](https://www.wireshark.org/)                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | A tool used to capture and reverse engineer the unencrypted USB protocol of a PS3 Skylanders: Trap Team portal. |
| [dev_hid_composite](https://github.com/raspberrypi/pico-examples/tree/master/usb/device/dev_hid_composite)                                                                                                                                                                                                                                                                                                                                                                                                       | A code example useful for learning how to create a Pico W USB peripheral.                                       |
| [Building a Bluetooth GATT Server on the Pi Pico W by V. Hunter Adams](https://vanhunteradams.com/Pico/BLE/GATT_Server.html), [ble_temp_sensor](https://github.com/raspberrypi/pico-examples/tree/950d634ef768a61f79de1f764dc1779cfbb1997b/bluetooth/ble_temp_sensor), [server.c](https://github.com/raspberrypi/pico-examples/blob/0d62f75bafc2c8120d3276c3343d1a9195e909e9/bluetooth/ble_secure_temp_sensor/server.c), and [BTstack Documentation](https://bluekitchen-gmbh.com/btstack/profiles/#gatt-server) | Documentation and code examples useful for learning how to develop a Pico W Bluetooth server.                   |
| [multicore.c](https://github.com/raspberrypi/pico-examples/blob/0d62f75bafc2c8120d3276c3343d1a9195e909e9/multicore/hello_multicore/multicore.c)                                                                                                                                                                                                                                                                                                                                                                  | A code example that demonstrates how to call functions on different Pico W CPU cores.                           |
| [SimpleBLE Documentation](https://docs.simpleble.org/)                                                                                                                                                                                                                                                                                                                                                                                                                                                           | SimpleBLE is a library used to allow the app to communicate with the Pico W.                                    |
| [Dear ImGui Image Loading and Displaying Examples](https://github.com/ocornut/imgui/wiki/Image-Loading-and-Displaying-Examples#example-for-sdl_renderer-users) and [main.cpp](https://github.com/ocornut/imgui/blob/master/examples/example_sdl3_sdlrenderer3/main.cpp)                                                                                                                                                                                                                                          | Dear ImGui code examples useful for developing the app frontend.                                                |
| [Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html)                                                                                                                                                                                                                                                                                                                                                                                                                                      | Documentation useful for writing the build and installation scripts.                                            |
## Credits
| Name                                                                           | License                                                                                                                             | Usage                                                                                               |
|--------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| [Dear ImGui](https://github.com/ocornut/imgui)                                 | [MIT License](https://github.com/ocornut/imgui/blob/ed73ef4e84c9488256c5710de6ff1ebc2c9a8496/LICENSE.txt)                           | Library for the app                                                                                 |
| [SDL](https://github.com/libsdl-org/SDL)                                       | [zlib License](https://github.com/libsdl-org/SDL/blob/4a17e772ea9a4ff77dd10fa6ea6f45fc6731eb01/LICENSE.txt)                         | Library for the app                                                                                 |
| [stb_image](https://github.com/nothings/stb/blob/master/stb_image.h)           | [MIT License](https://github.com/nothings/stb/blob/2c980bb59875b0d32144a71867fbdebb2f77cd20/stb_image.h#L7952)                      | Library for the app                                                                                 |
| [SimpleBLE](https://github.com/simpleble/simpleble)                            | [Business Source License 1.1](https://github.com/simpleble/simpleble/blob/8b572613eb35c2873058b6bf721e1fedd9fc0ea1/LICENSE.md)      | Library for the app                                                                                 |
| [Techna Sans Font](https://github.com/somefreefonts/techna-sans)               | [SIL Open Font License 1.1](https://github.com/somefreefonts/techna-sans/blob/8caf97a0176a85d9880167c1d7192a40a7984161/LICENSE.txt) | [Font.cppm](./app/src/Font.cppm)                                                                    |
| [Raspberry Pi Pico SDK](https://github.com/raspberrypi/pico-sdk)               | [BSD 3-Clause License](https://github.com/raspberrypi/pico-sdk/blob/079c6f39023649b154152db30f1d781e884879bc/LICENSE.TXT)           | Library for the Raspberry Pi                                                                        |
| [Raspberry Pi Pico SDK Examples](https://github.com/raspberrypi/pico-examples) | [BSD 3-Clause License](https://github.com/raspberrypi/pico-examples/blob/0d62f75bafc2c8120d3276c3343d1a9195e909e9/LICENSE.TXT)      | [btstack_config.h](./pico/config/btstack_config.h) and [tusb_config.h](./pico/config/tusb_config.h) |
| [TinyUSB](https://github.com/hathach/tinyusb)                                  | [MIT License](https://github.com/hathach/tinyusb/blob/064afa3774cbbb2093d6af9805bdaa15b4e0f751/LICENSE)                             | Library for the Raspberry Pi                                                                        |
| [BTstack](https://github.com/bluekitchen/btstack)                              | [Custom](https://github.com/bluekitchen/btstack/blob/e38553977a25fb0b55b383c72c289be0975f422c/LICENSE)                              | Library for the Raspberry Pi                                                                        |
| [CYW43xx WiFi/BT SoC driver](https://github.com/georgerobotics/cyw43-driver)   | [MIT License](https://github.com/georgerobotics/cyw43-driver/blob/bed438f119cfba03f75957fceb6a5623ef95e6d9/LICENSE)                 | Library for the Raspberry Pi                                                                        |
