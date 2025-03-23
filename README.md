# List-of-Commands
A list of various shell commands

========================================================  

```find . -L | grep -vE 'pyc|swp|__init' | sed -e "s/[^-][^\/]*\// |/g" -e "s/|\([^ ]\)/|-\1/"```    

Displays all sub-directories / files in your current directory. Excludes file names containing "pyc", "swp", "__init". If the command gives the error: "find: -L: unknown primary or operator
," try putting formatting the command as ```find -L .``` instead of ```find . -L```.      

========================================================  

```find . -L | sed -e "s/[^-][^\/]*\// |/g" -e "s/|\([^ ]\)/|-\1/"```    

Displays all sub-directories / files in your current directory. If you are seeing "find: -L: unknown primary or operator
," use ```find -L .``` instead.    

========================================================  

A note about the ```-L``` flag for ```find```   

The ```-L``` flag will make it so that if the find command comes across a symbolic link, it will also find the directory/file that the symbolic link is pointing to. Symbolic links seem to be a way to have easier to access references to certain directories.

========================================================  

```ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'```

Displays all sub-directories in your current directory. Does not show files. Note that the largest gap in this command is 3 spaces.    

========================================================    
```find -L . -name "*.py" -print | xargs -I {} grep -Hil "term1" {} | xargs -I {} grep -Hil "term2" {}```     
Displays all python scripts within the current directory, including only those files whose content contains both term1 and term2.

========================================================    
```
$jsonLines = Get-Content -Path 'test.jsonl' -ErrorAction Stop

$jsonObject = $jsonLines[0] | ConvertFrom-Json

$jsonSchema = ConvertTo-Json -InputObject $jsonObject -Depth 10

Write-Output $jsonSchema

$jsonSchema | Out-File -FilePath 'schema.json'
```

Should extract a record and format it. Made for when using powershell.

========================================================  


# A List of Scripts
List of various shell scripts    
========================================================    

```pretty_tree.sh <directory>```    

This script will attempt to display all files and subdirectories inside the provided directory argument using the tree command. If the tree command isn't found, it will perform the function using the first find command contained in this document. It also excludes any files containing "pyc" "swp" "__init." If the original script doesn't work and you see errors relating to the sed command, try out the ```pretty_tree_mac.sh``` script also contained within the repository.    

========================================================    

```Lrsearch.sh -file <file-pattern> -f <directory> -o <file|content> search_term1 search_term2 searchterm3 ... search_termN ```    

This script will search the specified directory for files whose name match the specified file pattern (ex. ```-file "*.py"``` will search all .py files). Files will then be filtered based on if they have content contained in the whitelist constructed from the specified search terms. You need at least one search time. The script will output to the console all file names that match these parameters if ```-o file``` is used and the previous and next 5 lines from the matched line if ```-o content``` is used.  

