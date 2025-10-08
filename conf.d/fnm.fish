if not status is-interactive
    exit
end

if not command -q fnm
    exit
end

fnm env --use-on-cd --shell fish | source
