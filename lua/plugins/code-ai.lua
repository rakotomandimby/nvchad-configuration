return {
  "natixgroup/code-ai.nvim",
  event = 'VeryLazy',
  lazy = false,
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
      local ejsInstruction = 'Act as a Typescript software developer writing a Web application with Express and EJS as template engine.' .. formatInstruction .. ' EJS template filetype is "html".'
      local bloggerInstruction = " Act as a blog author about software development that writes a blog post about the prompted topic."
      .. " The blog post title will be given in the prompt."
      .. " Thesis will be given in the prompt."
      .. " Subtopics will also be given in the prompt."
      .. " On or more code illustration will be given in the prompt."
      .. " Use the comments in the code as elements for going into details."
      .. " Make sure to include the full provided code in the blog post as an illustration and implementation of the thesis and subtopics."
      .. " Format the output as pure HTML and only HTML. Do not include any CSS or JavaScript, do not format using Markdown."
      local function createPrompt(command, instruction)
        return {command = command, instruction_tpl = instruction .. " " .. formatInstruction, prompt_tpl = '${input}', loading_tpl = '${input}', result_tpl = '${output}', require_input = true}
      end
      return {
        bash                          = createPrompt('AIBash'                    , 'Act as a Bash script developer.'),
        javascript_bare               = createPrompt('AIJavascriptVanilla'       , 'Act as a Vanilla Javascript developer writing a Javascript Web application.'),
        blogger_html                  = createPrompt('AIBlogger'                 , bloggerInstruction),
        html_jquery_bootstrap         = createPrompt('AIHTMLJQueryBootstrap'     , 'Act as a HTML developer writing a Web application using jQuery and Bootstrap.'),
        javascript_firefox            = createPrompt('AIJavascriptFirefox'       , 'Act as a Javascript Firefox extension developer writing a Javascript Firefox extension.'),
        javascript_react              = createPrompt('AIJavascriptReact'         , 'Act as a Javascript software developer writing a React application.'),
        typescript_node_backend       = createPrompt('AITypescriptNodeBackend'   , 'Act as a Typescript software developer writing a Node.js backend application.'),
        typescript_react              = createPrompt('AITypescriptReact'         , 'Act as a Typescript software developer writing a React application.'),
        typescript_nextjs             = createPrompt('AITypescriptNextJS'        , 'Act as a Typescript software developer writing a "React.js" application using the "Next.js" framework.'),
        typescript_ejs                = createPrompt('AITypescriptEJS'           , ejsInstruction),
        php_bare                      = createPrompt('AIPHPBare'                 , 'Act as a bare PHP software developer.'),
        php_symfony                   = createPrompt('AIPHPSymfony'              , 'Act as a PHP software developer using the Symfony framework.'),
        php_symfony_twig_sylius       = createPrompt('AIPHPSymfonyTwigSylius'    , 'Act as a PHP software developer using the Symfony framework, the Twig template engine and the Sylius e-commerce platform.'),
        dockerfile                    = createPrompt('AIDockerfile'              , 'Act as a Dockerfile developer who is writing Dockerfile.'),
        yaml_kubernetes_administrator = createPrompt('AIYAMLKubernetesAdmin'     , 'Act as a Kubernetes system administrator writing either YAML manifests, deployment YAML file or Service YAML file.'),
        yaml_symfony_configuration    = createPrompt('AIYAMLSymfonyConfiguration', 'Act as a Symfony developer writing YAML file in order to configure Symfony.'),
        lua_neovim_plugin             = createPrompt('AILuaNeovimPlugin'         , 'Act as a Lua software developer writing Neovim Plugin.'),
        lua_nvchad_neovim             = createPrompt('AILuaNvChadNeovimConfiguration'  , 'Act as a Lua software developer writing NvChad Neovim configuration.'),
        asterisk20                    = createPrompt('AIAsterisk20'              , 'Act as an Asterisk version 20 administrator writing Asterisk version 20 configuration for Asterisk version 20, using chan_pjsip but not chan_sip.'),
        asterisk18                    = createPrompt('AIAsterisk18'              , 'Act as an Asterisk version 18 administrator writing Asterisk version 18 configuration for Asterisk version 18, using chan_sip but not chan_pjsip.')
      }
    end)(),
  }
}
