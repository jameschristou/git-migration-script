# git-migration-script
Powershell script for migrating git repos from one host to another.

You need to have already created the empty destination repos (make sure they are empty)

## Features
- Copies a git repository from one host to another
- Includes complete repository history

## Possible Enhancements
Create the destination repos for you!

## Usage
1. First create the empty repositories in the destination. These need to be completely empty without even a `.gitignore` file or readme.
2. Edit the `migrate.ps1` script and update to use appropriate values for `$sourceRepoBase`, `$destRepoBase` and `$repos` array. In the $repos array you only need to specify the dest property if you are changing the repo name as part of the migration, otherwise the existing name will be used.
3. Run the script in an empty folder. The source repos will be cloned into this folder and then pushed into the destination repo. The entire history is also migrated.