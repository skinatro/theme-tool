# Theme Tool

This is a small tool I made using SED to help me to make themes and variants.

I tried to make it compatible with the UNIX shell, so feel to [open an issue](https://github.com/skinatro/theme-tool/issues/new) if anything breaks (this wont work on fish shell but i am planning to add a fish version soon:tm:)

# How Does It Work?

It Takes In Your User Inputs which are the source files, and output directories,then it determines the file extension of your source file to make the final output file's name,and runs the sed-fu (which just compares a set of value then replaces it with another set)

# Usage 

```sh
Usage:./build.sh -o Output -s Source
```

# What is a source file

A Source file is the base theme file with `$colorname` instead of the hex/hsv.

Example Snippet:-


```qss
* 
  border: none;
	color : {$mantle};
	background-color: {$rosewater};
}

#frame {
	padding: 6px;
	border-radius: 12px;
	background-color: {$teal};
	border: 6px solid {$text};
```

# Currently Supported Themes And Variants

- Catppuccin
  - Latte
  - Macho
  - Machhiato
  - Frappe
