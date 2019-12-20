# git-migration-script
Powershell script for migrating git repos from one host to another.

You need to have already created the empty destination repos (make sure they are empty including no readme or gitignore)

Just update your $sourceRepoBase, $destRepoBase and $repos array. Then run the script in an empty folder. The source repos will be cloned into this folder and then pushed into the destination repo. The entire history is also migrated.

In the $repos array you only need to specify the dest property if you are changing the repo name as part of the migration, otherwise the existing name will be used.
