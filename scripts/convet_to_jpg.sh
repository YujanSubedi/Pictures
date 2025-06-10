#!/bin/bash

# for file in *.{jpg,jpeg,png,webp};do ffmpeg -i $file -y "${file%.*}.jpg" ; done

for file in *.jpg; do
	[ -f "${file}" ] && ffmpeg -i "${file}" -y "${file}"
done

for file in *.{jpeg,png,webp,JPG,JPEG,PNG,WEBP}; do
	[ -f "${file}" ] && ffmpeg -i "${file}" "${file%.*}.jpg"
	[ -f "${file}" ] && rm "${file}"
done

curr_value=0
for file in *.jpg; do
	curr_value=$((curr_value + 1))
	new_filename=$(printf "%05d.jpg" "${curr_value}")
	mv -i "${file}" "${new_filename}"
done
