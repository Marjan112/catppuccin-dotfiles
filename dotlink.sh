#!/bin/sh

EXCLUDED=".git .gitignore"

for file in .[!.]*; do
    [ -e "$file" ] || continue

    case " $EXCLUDED " in
        *" $file "*)
            echo "SKIP: $(pwd)/$file"
            continue
            ;;
    esac

    echo "LINK: $(pwd)/$file -> $HOME/$file"
    ln -sf $(pwd)/$file $HOME/$file
done

for dir in */; do
    [ -d "$dir" ] || continue

    dir="${dir%/}"

    echo "LINK: $(pwd)/$dir -> $HOME/.config/$dir"
    ln -sf $(pwd)/$dir $HOME/.config/$dir
done
