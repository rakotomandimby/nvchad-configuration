return {
  "natixgroup/code-ai.nvim",
  event = 'VeryLazy',
  lazy = false,
  keys = {
    { "<leader>b", ":'<,'>AIBash<CR>", desc = "Bash", mode='v' },
    { "<leader>d", ":'<,'>AIDockerfile<CR>", desc = "Docker build file", mode='v' },
    { "<leader>p", ":'<,'>AILuaNeovimPlugin<CR>", desc = "Lua Neovim Plugin", mode='v' },
    { "<leader>n", ":'<,'>AILuaNvChadNeovimConfiguration<CR>", desc = "Lua NvChad Neovim Configuration", mode='v' }
  },
  dependencies = 'nvim-lua/plenary.nvim',
  opts = {
    gemini_agent_host='http://172.16.76.1:5000',
    chatgpt_agent_host='http://172.16.76.1:4000',
    result_popup_gets_focus = true,
    chatgpt_api_key = os.getenv('OPENAI_API_KEY'),
    gemini_api_key = os.getenv('GEMINI_API_KEY'),
    locale = 'en',
    prompts = (function()
      local formatInstruction = "Format the answer using Markdown."
      local ejsInstruction = 'Help a Typescript software developer writing a Web application with Express and Embedded JavaScript (EJS) templating as template engine. EJS template filetype is "html".'
      local bloggerInstruction = " Help a blog author about software development that writes a blog post about the prompted thesis."
      .. " The blog post title will be given in the prompt."
      .. " Thesis will be given in the prompt."
      .. " Subtopics will also be given in the prompt."
      .. " One or more code illustration will be given in the prompt."
      .. " Use the comments in the code as elements for going into details."
      .. " Generate a blog post based on the precedent informations."
      .. " Your answer will be the full HTML code of the blog post."
      .. " Format the output as pure HTML and only HTML. Do not include any CSS or JavaScript, do not format using Markdown."
      local function createPrompt(command, instruction)
        return {command = command, instruction_tpl = instruction .. " " .. formatInstruction, prompt_tpl = '${input}', loading_tpl = '${input}', result_tpl = '${output}', require_input = true}
      end
      return {
        bash                          = createPrompt('AIBash'                    , 'Help a Bash script developer.'),
        javascript_bare               = createPrompt('AIJavascriptVanilla'       , 'Help a Vanilla Javascript developer writing a Javascript Web application.'),
        blogger_html                  = createPrompt('AIBlogger'                 , bloggerInstruction),
        html_jquery_bootstrap         = createPrompt('AIHTMLJQueryBootstrap'     , 'Help a HTML developer writing a Web application using jQuery and Bootstrap.'),
        javascript_firefox            = createPrompt('AIJavascriptFirefox'       , 'Help a Javascript Firefox extension developer writing a Javascript Firefox extension.'),
        javascript_react              = createPrompt('AIJavascriptReact'         , 'Help a Javascript software developer writing a React application.'),
        typescript_node_backend       = createPrompt('AITypescriptNodeBackend'   , 'Help a Typescript software developer writing a Node.js backend application.'),
        typescript_react              = createPrompt('AITypescriptReact'         , 'Help a Typescript software developer writing a React application.'),
        typescript_nextjs             = createPrompt('AITypescriptNextJS'        , 'Help a Typescript software developer writing a "React.js" application using the "Next.js" framework.'),
        typescript_ejs                = createPrompt('AITypescriptEJS'           , ejsInstruction),
        php_bare                      = createPrompt('AIPHPBare'                 , 'Help a bare PHP software developer.'),
        php_symfony                   = createPrompt('AIPHPSymfony'              , 'Help a PHP software developer using the Symfony framework.'),
        php_symfony_twig_sylius       = createPrompt('AIPHPSymfonyTwigSylius'    , 'Help a PHP software developer using the Symfony framework, the Twig template engine and the Sylius e-commerce platform.'),
        dockerfile                    = createPrompt('AIDockerfile'              , 'Help a Dockerfile developer who is writing Dockerfile.'),
        yaml_kubernetes_administrator = createPrompt('AIYAMLKubernetesAdmin'     , 'Help a Kubernetes system administrator writing either YAML manifests, deployment YAML file or Service YAML file.'),
        yaml_symfony_configuration    = createPrompt('AIYAMLSymfonyConfiguration', 'Help a Symfony developer writing YAML file in order to configure Symfony.'),
        lua_neovim_plugin             = createPrompt('AILuaNeovimPlugin'         , 'Help a Lua software developer writing Neovim Plugin.'),
        lua_nvchad_neovim             = createPrompt('AILuaNvChadNeovimConfiguration'  , 'Help a Lua software developer writing NvChad Neovim configuration.'),
        asterisk20                    = createPrompt('AIAsterisk20'              , 'Help an Asterisk version 20 administrator writing Asterisk version 20 configuration for Asterisk version 20, using chan_pjsip but not chan_sip.'),
        asterisk18                    = createPrompt('AIAsterisk18'              , 'Help an Asterisk version 18 administrator writing Asterisk version 18 configuration for Asterisk version 18, using chan_sip but not chan_pjsip.')
      }
    end)(),
  }
}
