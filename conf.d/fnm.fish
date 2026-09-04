if not status is-interactive
    exit
end

if not command -q fnm
    exit
end

fnm env --shell fish | source

function _fnm_autoload_hook --on-variable PWD --description 'Change Node version on directory change'
    status --is-command-substitution; and return

    if test -f bun.lock -o -f bun.lockb
        return
    end

    if test -f .node-version -o -f .nvmrc -o -f package.json
        fnm use --silent-if-unchanged
    end
end
