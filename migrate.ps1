# copies required files into folders and then runs docker-compose to startup motoring dev environment
$ErrorActionPreference = "Stop"

$sourceRepoBase = "https://james-christou-carsales@bitbucket.org/my-account/";
$destRepoBase = "https://github.com/my-account/";

# the list of repos...if the repo name is not changing then you only need to specify the source name
$repos = 
@(
    [pscustomobject]@{source="my.repo.git";dest="my.new.repo.git";},
    [pscustomobject]@{source="my.other.repo.git";}
)

ForEach ($repo in $repos) {
    Write-Output "Migrating  $($repo.source)..................................."

    git clone --bare "$($sourceRepoBase)$($repo.source)"
    Set-Location -Path ./"$($repo.source)"
    $dest = $repo.source;
    if(![string]::IsNullOrEmpty($repo.dest)){
        $dest = $repo.dest;
    }
    git remote add dest "$($destRepoBase)$($dest)"
    git push --all dest
    git push --tags dest

    Set-Location -Path ..

    Write-Output "Done  $($repo.source)........................................"
}
