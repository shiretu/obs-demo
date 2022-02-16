{
  "targets": [
    {
      "target_name": "my_module",
      "sources": ["<!@(find ../source/my_module/src -type f -name *.cpp)"],
      "include_dirs":[
          "node_modules/node-addon-api",
          "../3rdparty/obs-studio/libobs"
      ],
      "defines":["NAPI_DISABLE_CPP_EXCEPTIONS"],
      "libraries": [
          "-L/Users/shiretu/work/interview/builders/build/libobs",
          "-lobs",
          "-framework AppKit"
      ]
    }
  ]
}
