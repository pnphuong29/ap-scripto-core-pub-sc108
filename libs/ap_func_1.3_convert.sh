# Convert a string to kebab-case
alias convertstring2kebabcase="ap_func_convert_string_to_kebab_case"
ap_func_convert_string_to_kebab_case() {
    echo "$1" | sed 's/\([A-Z]\)/-\L\1/g' | sed 's/[_\ ]\+/-/g' | sed 's/--/-/g' | sed 's/^-//' | sed 's/-$//' | tr '[:upper:]' '[:lower:]'
}

# Convert a string to Train-Case
alias convertstring2traincase="ap_func_convert_string_to_train_case"
ap_func_convert_string_to_train_case() {
    local str="$1"
    # Replace camelCase with Train-Case (add hyphens before uppercase letters)
    str=$(echo "$str" | sed 's/\([a-z0-9]\)\([A-Z]\)/\1-\2/g')
    # Replace spaces and underscores with hyphens
    str=$(echo "$str" | sed 's/[\s_]\+/-/g')
    # Replace multiple hyphens with a single hyphen
    str=$(echo "$str" | sed 's/-\+/-/g')
    # Convert to lowercase first, then capitalize the first letter of each word
    str=$(echo "$str" | tr '[:upper:]' '[:lower:]')
    # Capitalize first letter of each segment
    str=$(echo "$str" | sed 's/-\([a-z]\)/\-\u\1/g; s/^\([a-z]\)/\u\1/g')
    echo "$str"
}

# Convert a filename to Train-Case
alias convertfilename2traincase="ap_func_convert_filename_to_train_case"
ap_func_convert_filename_to_train_case() {
    local filename="$1"
    local basename="${filename%%.*}"  # Remove extensions
    local extensions="${filename#*.}" # Get extensions

    # Convert to lowercase first
    local lowercase=$(echo "$basename" | tr '[:upper:]' '[:lower:]')

    # Replace special characters and spaces with hyphens
    local hyphenated=$(echo "$lowercase" | sed 's/[^a-zA-Z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//')

    # Capitalize first letter of each word
    local train_case=$(echo "$hyphenated" | sed -E 's/(^|-)([a-z])/\1\u\2/g')

    echo "${train_case}.${extensions}"
}

# Convert a filename to kebab-case
ap_func_convert_filename_to_kebab_case() {
    local filename="$1"
    local basename="${filename%%.*}"  # Remove extensions
    local extensions="${filename#*.}" # Get extensions

    # Convert to lowercase first
    local lowercase=$(echo "$basename" | tr '[:upper:]' '[:lower:]')

    # Replace special characters and spaces with hyphens
    local hyphenated=$(echo "$lowercase" | sed 's/[^a-zA-Z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//')

    echo "${hyphenated}.${extensions}"
}

# Convert all folder names in the current directory to kebab-case
alias convertfoldernames2kebabcase="ap_func_convert_folder_name_to_kebab_case"
ap_func_convert_folder_name_to_kebab_case() {
    local ap_path="$1"

    # Get all directories in the current path
    gfind "${ap_path}" -type d -depth 1 | while read ap_dir; do
        # Skip the current directory and parent directory
        if [[ "${ap_dir}" == "." || "${ap_dir}" == ".." ]]; then
            continue
        fi

        # Get the base name of the directory
        ap_base_name=$(basename "${ap_dir}")

        # Convert to kebab-case
        ap_kebab_name=$(ap_func_convert_string_to_kebab_case "${ap_base_name}")

        # Skip if the name is already in kebab-case
        if [[ "${ap_base_name}" == "${ap_kebab_name}" ]]; then
            echo "Skipping ${ap_dir} (already in kebab-case)"
            # Process subdirectories
            ap_func_convert_folder_name_to_kebab_case "${ap_dir}"
            continue
        fi

        # Create the new path
        ap_parent_dir=$(dirname "${ap_dir}")
        ap_new_path="${ap_parent_dir}/${ap_kebab_name}"

        # Rename the directory
        apshowmsginfo "Renaming: [${ap_dir}] -> ${ap_new_path}\n"
        mv "${ap_dir}" "${ap_new_path}"

        # Process subdirectories
        ap_func_convert_folder_name_to_kebab_case "${ap_new_path}"
    done
}

# Find all files in the current directory and subdirectories and convert their names to specified input case type
alias convertfilenames2kebabcase="ap_func_convert_file_case 'kebab-case'"
alias convertfilenames2traincase="ap_func_convert_file_case 'Train-Case'"
ap_func_convert_file_case() {
    # Get input extension if any
    local ap_ext="$2"
    local ap_case_type="$1"
    local ap_case_func

    if [ -z "${ap_ext}" ]; then
        ap_ext="*.*"
    fi

    gfind . -type f -name "${ap_ext}" | while read -r ap_file; do
        ap_dir=$(dirname "${ap_file}")
        ap_old_name=$(basename "${ap_file}")

        case "${ap_case_type}" in
            "kebab-case")
                ap_case_func="ap_func_convert_filename_to_kebab_case"
                ;;
            "Train-Case")
                ap_case_func="ap_func_convert_filename_to_train_case"
                ;;
            ?)
                echo "Invalid option [${OPTARG}]"
                aprtn_err_opt_invalid_option
                ;;
        esac

        ap_new_name=$("${ap_case_func}" "${ap_old_name}")

        if [ "${ap_old_name}" != "${ap_new_name}" ]; then
            apshowmsginfo "Renaming: ${ap_dir}/${ap_old_name} → ${ap_dir}/${ap_new_name}\n"
            mv "${ap_dir}/${ap_old_name}" "${ap_dir}/${ap_new_name}"
        fi
    done
}

# Convert all folder names in the current directory to Train-Case
alias convertfoldernames2traincase="ap_func_convert_folder_name_to_train_case"
ap_func_convert_folder_name_to_train_case() {
    # Find all directories, sort them in reverse depth order
    # so we process deepest directories first to avoid path changes
    gfind . -type d | sort -r | while read -r ap_dir; do
        # Skip the current directory (.)
        if [ "${ap_dir}" = "." ]; then
            continue
        fi

        # Extract the parent directory and base name
        local ap_parent_dir
        ap_parent_dir=$(dirname "${ap_dir}")
        local ap_old_name
        ap_old_name=$(basename "${ap_dir}")

        # Convert to Train-Case
        local ap_new_name
        ap_new_name=$(ap_func_convert_string_to_train_case "${ap_old_name}")

        # Skip if no change is needed
        if [ "${ap_old_name}" = "${ap_new_name}" ]; then
            continue
        fi

        # Create the new path
        local ap_new_path
        ap_new_path="${ap_parent_dir}/${ap_new_name}"

        # Rename the directory
        apshowmsginfo "Renaming: ${ap_dir} -> ${ap_new_path}\n"
        mv "${ap_dir}" "${ap_new_path}" 2>/dev/null

        # Check if renaming was successful
        if [ $? -ne 0 ]; then
            apshowmsginfo "Error renaming ${ap_dir}\n"
        fi
    done

    apshowmsginfo "Folder renaming complete!\n"
}

# Batch resize images to multiple sizes
alias batchresizeimages="ap_func_batch_resize_images"
ap_func_batch_resize_images() {
    local input_file="$1"

    if [ -z "${input_file}" ]; then
        echo "Usage: batchresizeimages <input_file> <...custom_size>"
        return 1
    fi

    local output_prefix
    output_prefix="$(basename "${input_file%.*}")"

    # Get custom sizes from arguments or use default values
    shift # Skip the input file argument
    local sizes=("$@")

    # If no custom sizes were provided, use defaults
    if [ ${#sizes[@]} -eq 0 ]; then
        sizes=(16 32 48 64 80 96 112 128 192 256)
    fi

    for size in "${sizes[@]}"; do
        magick "${input_file}" -resize "${size}x${size}" "${output_prefix}-${size}x${size}.png"
        # Not sure if sharp has better performance, need to test
        # sharp input.png resize 64 64 --output icon-64x64.png
    done
}
