# Declare the local Bazel workspace.
# This is *not* included in the published distribution.
workspace(
    name = "slamdev_toolchain_chromium",
)

load(":internal_deps.bzl", "toolchain_chromium_internal_deps")

# Fetch deps needed only locally for development
toolchain_chromium_internal_deps()

load("//chromium:repositories.bzl", "chromium_register_toolchains", "toolchain_chromium_dependencies")

# Fetch our "runtime" dependencies which users need as well
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

############################################
# Gazelle, for generating bzl_library targets
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.17.2")

gazelle_dependencies()
