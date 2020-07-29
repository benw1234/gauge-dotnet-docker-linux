# gauge-dotnet-linux
Gauge with customized dotnet plugin, which can be used to run gauge tests for dotnet.

# Included
* dotnet core 2.1
* Gauge: 1.0.8
* gague-dotnet-plugin: 2.1.4 (customized - to solve Gauge dotnet plugin [can not load assembly System.Data.SqlClient problem](https://github.com/getgauge/gauge-dotnet/issues/80))

# Example Usage
## Command Line
* Go to the root folder of the automation test project.
* Open Powershell under the folder, run 

### Linux
```
docker run --rm -v $(PWD):/workspace -w /workspace jenniferz79/gaugedotnetlinux gauge run ./DS_AUT.Test/specs/WebServiceTest.spec
```

### Windows
```
docker run --rm -v ${PWD}:/workspace -w /workspace jenniferz79/gaugedotnetlinux gauge run ./DS_AUT.Test/specs/WebServiceTest.spec
```

## Interactive mode
* Go to the root folder of the automation test project.
* Open Powershell under the folder, run 
### Linux
```
docker run --rm -it -v $(PWD):/workspace -w /workspace jenniferz79/gaugedotnetlinux
```

### Windows
```
docker run --rm -it -v ${PWD}:/workspace -w /workspace jenniferz79/gaugedotnetlinux
```

* A container will be created in interactive mode. You can run gauge command to run test in the PowerShell terminal. e.g.
```
gauge run specs/WebService.spec
```