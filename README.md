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
    name = "chromium961656",
    chromium_revision = "961656",
    sha256 = {
        "Mac_Arm": "0c34085537c08d7ccd912abf8e16cd5c548652c3f9f8e9b49b5e392897d9b737",
        "Mac": "a658e17d5bd380c9979b09573bd4c98d0a0cf57a009c2fe125e52b86606e9d70",
        "Linux_x64": "3467146abacd8fae1f2af72f5b51635b1e4e050e67a3ab4589a8cabf6937b8b5",
    },
)
```

> note, in the above, replace the version and sha256 with the one indicated
> in the release notes for toolchain_chromium.
