# Installing the ErionMud UI Package in Mudlet

First, make sure you have [Mudlet](mudlet.org) installed and running.

These instructions are generic and can be used to install any package in Mudlet.

## Option 1: Automatically Download and Install from Mudlet's Package Repository

You can download and install any registered package from Mudlet's package repository using the 2 following methods.

### Using the `mpkg` Tool

`mpkg` is a great tool for managing all your packages. You can install, upgrade, and remove any package. Enter `mpkg help` for details. (Yes! `mpkg` is a package!)

Open the Mudlet profile that you want to install the package into, in **OFFLINE** mode. Enter the following in the command line.

```lua
lua installPackage("https://github.com/Mudlet/mudlet-package-repository/raw/refs/heads/main/packages/mpkg.mpackage")
```

To install the ErionMud-UI package from the packes repository, enter the following command in the Mudlet command line.

```lua
mpkg search erionmud-ui
```

From the results list, you can click `[install now]` to install the package or enter the following command.

```lua
mpkg install erionmud-ui
```

Once the package in installed, close and reopen the profile.

## Option 2: Manually Download and Install the package

You can manually download the package from the Mudlet package repository or from Github/Gitlab using these links.

[ErionMud-UI on Mudlet PR](https://packages.mudlet.org/packages#pkg-ErionMud-UI)
[ErionMud-UI on Github](https://github.com/ssharpjr/erionmud-ui)

Once you have the package downloaded, open the Mudlet profile that you want to install the package into, in **OFFLINE** mode.

Click on Toolbox and Package Manager from the top menu. You can also use the hotkey, `ALT-O` to open the Package Manager.

![Open Package Manager](/src/resources/images/install_1.png "Open Package Manager")

Click on `Install new package`.

![Install new package](/src/resources/images/install_2.png "Click Install new package")

Click the `.mpackage` you want to install and click `Open`.

![Select package](/src/resources/images/install_3.png "Select package")

You should now see your new package in the Package Manager list.

![New package installed](/src/resources/images/install_4.png "New package installed")

Once the package in installed, close the Package Manager. Close and reopen the profile.

## Uninstalling Packages

To uninstall any installed package in Mudlet, you can open them Package Manager as shown above (`ALT-O`). Select the package you want to remove and click `Remove 1 package`.

If you have `mpkg` installed, you can use it to remove packages as well.

Use `mpkg list` to see what packages you have installed. Then uninstall a package with this command.

```lua
mpkg remove erionmud-ui
```
