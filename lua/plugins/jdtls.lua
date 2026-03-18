return {
    "mfussenegger/nvim-jdtls",
    enabled = false,
    ft = "java",
    dependencies = {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        local jdtls = require("jdtls")
        local home = vim.fn.expand("~")
        local mason = home .. "/.local/share/nvim/mason"
        local jdtls_path = mason .. "/packages/jdtls"

        local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
        local config_dir = jdtls_path .. "/config_linux"

        local workspace_dir = home
            .. "/.local/share/jdtls-workspace/"
            .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

        local java_debug_path = home .. "/.local/share/java-debug"
        local java_debug_bundle = vim.fn.glob(
            java_debug_path
                .. "/com.microsoft.java.debug.plugin/target/"
                .. "com.microsoft.java.debug.plugin-*.jar"
        )

        local bundles = {}
        if java_debug_bundle ~= "" then
            table.insert(bundles, java_debug_bundle)
        end

        local config = {
            cmd = {
                "java",
                "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                "-Dosgi.bundles.defaultStartLevel=4",
                "-Declipse.product=org.eclipse.jdt.ls.core.product",
                "-Dlog.protocol=true",
                "-Dlog.level=ALL",
                "-Xms1g",
                "--add-modules=ALL-SYSTEM",
                "--add-opens",
                "java.base/java.util=ALL-UNNAMED",
                "--add-opens",
                "java.base/java.lang=ALL-UNNAMED",
                "-jar",
                launcher,
                "-configuration",
                config_dir,
                "-data",
                workspace_dir,
            },
            root_dir = require("jdtls.setup").find_root({
                ".git",
                "mvnw",
                "gradlew",
                "pom.xml",
                "build.gradle",
            }),
            settings = {
                java = {},
            },
            init_options = {
                bundles = bundles,
            },
        }

        jdtls.start_or_attach(config)
        jdtls.setup_dap({ hotcodereplace = "auto" })
    end,
}
