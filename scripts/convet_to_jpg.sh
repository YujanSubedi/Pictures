#!/bin/bash

# for file in *.{jpg,jpeg,png,webp};do ffmpeg -i $file -y "${file%.*}.jpg" ; done

for file in *.jpg; do
	[ -f "${file}" ] && mv -i "${file}" "img_${file}"
done

# curr_value=0
# for file in *.jpg; do
# 	if [ -f "${file}" ]; then
# 		curr_value=$((curr_value + 1))
# 		new_filename=$(printf "%05d.jpg" "${curr_value}")
# 		[ -f "${file}" ] && mv -i "${file}" "${new_filename}"
# 	fi
# done
#
# for file in *.{jpeg,png,webp,JPG,JPEG,PNG,WEBP}; do
# 	if [ -f "${file}" ]; then
# 		curr_value=$((curr_value + 1))
# 		new_filename=$(printf "%05d.jpg" "${curr_value}")
# 		ffmpeg -i "${file}" "${new_filename}" && rm "${file}"
# 	fi
# done

curr_value=0
for file in *.{jpg,jpeg,png,webp,JPG,JPEG,PNG,WEBP}; do
	if [ -f "${file}" ]; then
		curr_value=$((curr_value + 1))
		new_filename=$(printf "%05d.jpg" "${curr_value}")
		ffmpeg -i "${file}" "${new_filename}" && rm "${file}"
	fi
done
