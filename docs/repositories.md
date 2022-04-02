<!-- Generated with Stardoc: http://skydoc.bazel.build -->

Declare runtime dependencies

These are needed for local dev, and users must install them as well.
See https://docs.bazel.build/versions/main/skylark/deploying.html#dependencies


<a id="#chromium_repositories"></a>

## chromium_repositories

<pre>
chromium_repositories(<a href="#chromium_repositories-name">name</a>, <a href="#chromium_repositories-chromium_revision">chromium_revision</a>, <a href="#chromium_repositories-os">os</a>, <a href="#chromium_repositories-platform">platform</a>, <a href="#chromium_repositories-repo_mapping">repo_mapping</a>, <a href="#chromium_repositories-sha256">sha256</a>)
</pre>

TODO

**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :------------- | :------------- | :------------- | :------------- | :------------- |
| <a id="chromium_repositories-name"></a>name |  A unique name for this repository.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| <a id="chromium_repositories-chromium_revision"></a>chromium_revision |  -   | String | required |  |
| <a id="chromium_repositories-os"></a>os |  -   | String | required |  |
| <a id="chromium_repositories-platform"></a>platform |  -   | String | required |  |
| <a id="chromium_repositories-repo_mapping"></a>repo_mapping |  A dictionary from local repository name to global repository name. This allows controls over workspace dependency resolution for dependencies of this repository.&lt;p&gt;For example, an entry <code>"@foo": "@bar"</code> declares that, for any time this repository depends on <code>@foo</code> (such as a dependency on <code>@foo//some:target</code>, it should actually resolve that dependency within globally-declared <code>@bar</code> (<code>@bar//some:target</code>).   | <a href="https://bazel.build/docs/skylark/lib/dict.html">Dictionary: String -> String</a> | required |  |
| <a id="chromium_repositories-sha256"></a>sha256 |  -   | String | optional | "" |


<a id="#chromium_register_toolchains"></a>

## chromium_register_toolchains

<pre>
chromium_register_toolchains(<a href="#chromium_register_toolchains-name">name</a>, <a href="#chromium_register_toolchains-sha256">sha256</a>, <a href="#chromium_register_toolchains-kwargs">kwargs</a>)
</pre>

Convenience macro for users which does typical setup.

- create a repository for each built-in platform like "chromium_linux_amd64" -
  this repository is lazily fetched when chromium is needed for that platform.
- TODO: create a convenience repository for the host platform like "chromium_host"
- create a repository exposing toolchains for each platform like "chromium_platforms"
- register a toolchain pointing at each platform
Users can avoid this macro and do these steps themselves, if they want more control.


**PARAMETERS**


| Name  | Description | Default Value |
| :------------- | :------------- | :------------- |
| <a id="chromium_register_toolchains-name"></a>name |  base name for all created repos, like "chromium0_6_1"   |  none |
| <a id="chromium_register_toolchains-sha256"></a>sha256 |  <p align="center"> - </p>   |  none |
| <a id="chromium_register_toolchains-kwargs"></a>kwargs |  passed to each chromium_repositories call   |  none |


<a id="#toolchain_chromium_dependencies"></a>

## toolchain_chromium_dependencies

<pre>
toolchain_chromium_dependencies()
</pre>





