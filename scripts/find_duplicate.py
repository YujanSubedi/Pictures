import os
from PIL import Image
import imagehash

# Folder containing images
folder_path = "./"

# Dictionary to store image hashes
hashes = {}

# List to store duplicate files
duplicates = []

for filename in os.listdir(folder_path):
    file_path = os.path.join(folder_path, filename)

    try:
        with Image.open(file_path) as img:
            img_hash = imagehash.average_hash(img)

            if img_hash in hashes:
                # Duplicate found
                print(
                    f"Duplicate found: {file_path} is a duplicate of {hashes[img_hash]}"
                )
                duplicates.append(file_path)
            else:
                hashes[img_hash] = file_path
    except Exception as e:
        print(f"Error processing {file_path}: {e}")

# Optional: Delete duplicates
# for dup_path in duplicates:
#     os.remove(dup_path)
#     print(f"Deleted: {dup_path}")
