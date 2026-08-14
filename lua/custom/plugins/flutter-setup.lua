return {
  {
    -- 1. El Plugin Principal: "flutter-tools"
    -- Es el equivalente a la extensión oficial de Flutter en VS Code
    'nvim-flutter/flutter-tools.nvim',
    lazy = false, -- Le decimos que cargue siempre al iniciar

    -- 2. Dependencias: Cosas que este plugin necesita para funcionar
    dependencies = {
      'nvim-lua/plenary.nvim', -- Librería de funciones comunes
      'stevearc/dressing.nvim', -- Hace que los menús se vean bonitos
      'mfussenegger/nvim-dap', -- El Depurador (para poner breakpoints)
    },
    -- === AQUÍ ESTÁN TUS ATAJOS ===
    keys = {
      -- Atajos de Flutter que ya tenías
      {
        '<leader>fs',
        function()
          require('telescope').extensions.flutter.commands()
        end,
        desc = 'Flutter Start / Commands',
      },
      { '<leader>fr', ':FlutterReload<cr>', desc = 'Flutter Hot Reload' },
      { '<leader>fR', ':FlutterRestart<cr>', desc = 'Flutter Hot Restart' },
      { '<leader>fq', ':FlutterQuit<cr>', desc = 'Flutter Quit' },
      { '<leader>fo', ':FlutterOutline<cr>', desc = 'Flutter Outline' },

      -- === 👇 AGREGA ESTAS DOS LÍNEAS NUEVAS (Cópialas) 👇 ===
      {
        '<leader>ca',
        function()
          vim.lsp.buf.code_action()
        end,
        desc = 'Code Action (Bombilla)',
      },
      {
        '<leader>rn',
        function()
          vim.lsp.buf.rename()
        end,
        desc = 'Rename Variable',
      },
      -- =======================================================
    },
    -- 3. La Configuración (La parte importante)
    config = function()
      -- Aquí le decimos al plugin cómo comportarse
      require('flutter-tools').setup {
        ui = {
          border = 'rounded', -- Bordes redondeados en las ventanitas
        },

        -- Configuración de las ayudas visuales
        widget_guides = {
          enabled = true, -- Muestra líneas verticales para ver dónde empieza y termina un widget
        },

        lsp = {
          color = {
            enabled = true, -- Muestra cuadraditos de color real en el código (ej: Colors.red)
          },
          -- ESTO ES CRUCIAL: Conectamos Flutter con tu autocompletado (Blink)
          capabilities = require('blink.cmp').get_lsp_capabilities(),

          settings = {
            showTodos = true,
            completeFunctionCalls = true, -- Autocompletar paréntesis ()
          },
        },

        -- Configuración del Depurador (Debugger)
        debugger = {
          enabled = true,
          run_via_dap = true, -- Usar el protocolo estándar de debug
          register_configurations = function(_)
            local dap = require 'dap'
            -- Configuración para lanzar la app
            dap.configurations.dart = {
              {
                type = 'dart',
                request = 'launch',
                name = 'Iniciar Flutter',
                dartSdkPath = 'flutter',
                flutterSdkPath = 'flutter',
                program = '${workspaceFolder}/lib/main.dart', -- Asume que tu main está aquí
                cwd = '${workspaceFolder}',
              },
            }
          end,
        },
      } -- Fin del setup de flutter-tools
    end,
  },
}
