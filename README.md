# Word Parser examples
## Downloading
in an empty directory execute
```
git clone rickalm/Parser
```

## Downloading files to process

You do not need to download the demo files, but if you need a good source of demo material then use the fetch.sh script included.
This will create a directory called files with two subdirectories 

```
sh fetch.sh
```

## Prepping your execution environment.
If you have Ruby already installed you can simply execute the main.rb file passing as
command arguments the files or directories to read and process.

```
ruby main.rb <file1> ... <fileN>
```

## Executing in Docker
The easiest way to run this is inside of a Docker Container. If you've not used docker before 
refer to the [docker-machine website](https://docs.docker.com/machine/) and setup your host to
run docker containers either directly or through a virtual linux machine

*If your on a Mac or PC, once you setup docker-machine execute a ```docker-machine ssh default`` to get a shell prompt on the VM before you clone the git repo*

Executing the example is as easy as running ```
./run.sh ruby main files
```
