function IgnoreRootPathsExcept() {
    # Ignore all paths in root that do not match the given whitelist
    local search_dir='/'
    local white_list=("$@")
    local find_args=()
    local ignore_path

    for ignore_path in "${white_list[@]}"; do
        local base="${ignore_path#/}"
        # Add all base paths to the argument list as well, otherwise
        # -prune will prevent us from reaching the whitelisted files.
        while [ "$base" != '.' ]; do
            find_args+=(-path "$search_dir$base" -o)
            base="$(dirname "$base")"
        done
    done

    # Find everything except the given whitelist and the directory
    # being searched from
    find "$search_dir" -not \( "${find_args[@]}" -path "$search_dir" \) -prune | \
    while read -r file; do
        if [[ -d "$file" ]]; then
            IgnorePath "$file/*"
        fi
        IgnorePath "$file"
    done
}
