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
    name = "chromium1178",
    chromium_revision = "1178",
    sha256 = {
        "Mac_Arm": "f9c151bc5e8868a1a8493a4704a5d701462f9094ef1f915417ad0919f34386cb",
        "Mac": "85b29d14241b3236805e6aa458b79f3a1bdff57c45855bed553ef11d5e15d181",
        "Linux_x64": "0eb52534de2ee34e978c546ddda54478772124e6e6bd1b492069cbd0ed95d36c",
    },
)

############################################
# Gazelle, for generating bzl_library targets
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

go_rules_dependencies()

go_register_toolchains(version = "1.17.2")

gazelle_dependencies()
