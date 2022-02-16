# obs-demo

1. Clone:
```
git clone https://github.com/shiretu/obs-demo.git
```

2. Fetch submodules
```
cd obs-demo
git submodule update --init --recursive 
```

3. Do the build and run the script
```
cd builders
./build.sh
```

It will start the build process and it will finish by running a testing JS file. The output should look like this:

```
{ version: [Function (anonymous)], test_obs: [Function (anonymous)] }
0.0.1
Call test_obs
info: CPU Name: Intel(R) Core(TM) i9-8950HK CPU @ 2.90GHz
info: CPU Speed: 2900MHz
info: Physical Cores: 6, Logical Cores: 12
info: Physical Memory: 32768MB Total
info: OS Name: Mac OS X
info: OS Version: Version 10.15.7 (Build 19H1713)
info: Kernel Version: 19.6.0
error: hotkeys-cocoa: Getting keyboard keys failed
error: hotkeys-cocoa: Getting keyboard keys failed
error: hotkeys-cocoa: Getting keyboard keys failed
error: hotkeys-cocoa: Getting keyboard keys failed
info: hotkeys-cocoa: Using layout 'com.apple.keylayout.ABC'
Call test_obs again. Should fail
warning: Tried to call obs_startup more than once
Error: obs_startup() failed
    at Object.<anonymous> (/Users/shiretu/work/interview/source/my_module/js/test.js:11:11)
    at Module._compile (internal/modules/cjs/loader.js:1085:14)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:1114:10)
    at Module.load (internal/modules/cjs/loader.js:950:32)
    at Function.Module._load (internal/modules/cjs/loader.js:790:12)
    at Function.executeUserEntryPoint [as runMain] (internal/modules/run_main.js:76:12)
    at internal/main/run_main_module.js:17:47
```

