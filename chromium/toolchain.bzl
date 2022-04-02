"""This module implements the language-specific toolchain rule.
"""

ChromiumInfo = provider(
    doc = "Information about how to invoke the tool executable.",
    fields = {
        "target_tool_path": "Path to the tool executable for the target platform.",
        "tool_files": """Files required in runfiles to make the tool executable available.

May be empty if the target_tool_path points to a locally installed tool binary.""",
    },
)

# Avoid using non-normalized paths (workspace/../other_workspace/path)
def _to_manifest_path(ctx, file):
    if file.short_path.startswith("../"):
        return "external/" + file.short_path[3:]
    else:
        return ctx.workspace_name + "/" + file.short_path

def _chromium_toolchain_impl(ctx):
    if not ctx.attr.target_tool and not ctx.attr.target_tool_path:
        fail("Must set one of target_tool or target_tool_path.")

    tool_files = ctx.attr.target_tool.files.to_list()
    target_tool_path = _to_manifest_path(ctx, ctx.file.target_tool_path)

    # Make the $(CHROMIUM_BIN) variable available in places like genrules.
    # See https://docs.bazel.build/versions/main/be/make-variables.html#custom_variables
    template_variables = platform_common.TemplateVariableInfo({
        "CHROMIUM_BIN": target_tool_path,
        # Variable to use with disabled legacy_external_runfiles
        "CHROMIUM_RUNFILES_BIN": target_tool_path.replace("external/", "../", 1),
    })
    default = DefaultInfo(
        files = depset(tool_files),
        runfiles = ctx.runfiles(files = tool_files),
    )
    chromiuminfo = ChromiumInfo(
        target_tool_path = target_tool_path,
        tool_files = tool_files,
    )

    # Export all the providers inside our ToolchainInfo
    # so the resolved_toolchain rule can grab and re-export them.
    toolchain_info = platform_common.ToolchainInfo(
        chromiuminfo = chromiuminfo,
        template_variables = template_variables,
        default = default,
    )
    return [
        default,
        toolchain_info,
        template_variables,
    ]

chromium_toolchain = rule(
    implementation = _chromium_toolchain_impl,
    attrs = {
        "target_tool": attr.label(
            doc = "A hermetically downloaded executable target for the target platform.",
            mandatory = True,
            allow_files = True,
        ),
        "target_tool_path": attr.label(
            doc = "Path to an existing executable for the target platform.",
            allow_single_file = True,
            mandatory = True,
        ),
    },
    doc = """Defines a chromium compiler/runtime toolchain.

For usage see https://docs.bazel.build/versions/main/toolchains.html#defining-toolchains.
""",
)
