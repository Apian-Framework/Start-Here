# Installing the Apian Framework

## Install the .NET Core SDK

[Get it from MicroSoft](https://dotnet.microsoft.com/download)

## Clone the Apian-Framework Repositories

While Apian is in its current *very* early state of development it turns out that the most convenient way to use it is to check out the source code and build it along with any app you are working on. The example apps ( [Beam.Cli](), [Beam.Unity]() ) currently expect their repositories to be in the same folder as the other Apian repositories.

To make this a little easier, there are 2 scripts that can automate this for you:

- `clone-apian-repos.bat` (for Windows)
- `clone-apian-repos.sh` (Linux/MacOs)

Both of these scripts will first verify that you have the Git [Large File Storage](https://git-lfs.github.com/) extension installed and will then proceed to clone the Apian repositories.

Eventually these repositories will be published as .NET packages and application projects will be able to reference them using `PackageReference` statements. For now, though, they will have to use `ProjectReference` statements pointing to the source code.
