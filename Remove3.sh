#!/bin/bash
# get the file list
echo "enter the 1st file name"
read file
cd $file
for i in *; do
    ! [[ -d "$i" ]] && keep_list+=("$i")
done
cd - >/dev/null
echo "enter the 2nd file name"
read file2
cd $file2
for i in *; do
    [[ -d "$i" ]] && continue
    keep=
    for j in "${keep_list[@]}"; do
        if [[ "$i" == "$j" ]]; then
            keep=true
            break
        fi
    done
    if ! [[ "$keep" ]]; then
        do_rm=true
        rm_list+=("$i")
    fi
done
# print the list, and ask interactively for confirmation
if [[ "$do_rm" ]]; then
    printf '%s\n' "${rm_list[@]}"
    echo
    echo "these file names are not in $1, and will be REMOVED from $2"
    read -rp 'type yes to proceed: ' reply
    if [[ "$reply" == [Yy][Ee][Ss] ]]; then
        rm "${rm_list[@]}"
    else
        echo no files touched
    fi
else
    echo "nothing to remove: all file names in $2 are present in $1"
fi
