{
  "targets": [
    {
      "target_name": "my_module",
      "sources": [
        "<!@(find ../source/my_module/src -type f -name *.cpp)"
      ],
      "include_dirs":[
          "<!@(node -p \"require('node-addon-api').include\")",
          "../3rdparty/obs-studio/libobs"
      ],
      "defines":["NAPI_DISABLE_CPP_EXCEPTIONS"],
      "libraries": [
        "-L<!@(realpath build/libobs)",
        "-lobs",
        "-framework AppKit"
      ],
      "conditions": [
        [
          "OS=='mac'",
          {
            "libraries": [
              "-framework AppKit"
            ]
          }
        ]
      ]
    }
  ]
}
