# List-of-Commands
A list of various shell commands

```find . -L | grep -vE 'pyc|swp|__init' | sed -e "s/[^-][^\/]*\// |/g" -e "s/|\([^ ]\)/|-\1/"```    

Displays all sub-directories / files. Excludes file names containin "pyc", "swp", "__init". If the command gives the error "find: -L: unknown primary or operator
", try putting formatting the command as ```find -L .``` instead of ```find . -L.```      

```find . | sed -e "s/[^-][^\/]*\// |/g" -e "s/|\([^ ]\)/|-\1/"```    

Displays all sub-directories / files.     

```ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'```

Displays all sub-directories. Does not show files.
