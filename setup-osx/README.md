# OSX Dev Tools configuration script

This script try to configure all required dev tools for a clean setup.
There are 2 files:
- setup.sh: Runs all required configuration asking if you want to install each tool.
- env_config.sh: Create specific config files required for ZSH with environment variables and nice default options.

To run the whole configuration executre from this folder:
```
# Don't forget the first dot
$ . ./setup.sh
```

If you just need to configure the env variables (already executed by `setup.sh`):
```
$ . ./env_config.sh
```