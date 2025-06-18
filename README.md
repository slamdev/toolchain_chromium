# Bazel toolchain for [chromium](https://github.com/chromium/chromium)

## Installation

Include this in your WORKSPACE file:

```starlark
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "slamdev_toolchain_chromium",
    url = "https://github.com/slamdev/toolchain_chromium/releases/download/0.0.0/slamdev_toolchain_chromium-v0.0.0.tar.gz",
    sha256 = "",
)

load("@slamdev_toolchain_chromium//chromium:repositories.bzl", "chromium_register_toolchains", "toolchain_chromium_dependencies")

toolchain_chromium_dependencies()

chromium_register_toolchains(
    name = "chromium1178",
    chromium_revision = "1178",
    sha256 = {
        "Mac_Arm": "f9c151bc5e8868a1a8493a4704a5d701462f9094ef1f915417ad0919f34386cb",
        "Mac": "85b29d14241b3236805e6aa458b79f3a1bdff57c45855bed553ef11d5e15d181",
        "Linux_x64": "0eb52534de2ee34e978c546ddda54478772124e6e6bd1b492069cbd0ed95d36c",
    },
)
```

> note, in the above, replace the version and sha256 with the one indicated
> in the release notes for toolchain_chromium.
