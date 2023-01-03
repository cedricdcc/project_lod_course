#python script that will cleanup a given ttl file

import sys
import os

#get the file name from the command line
ttl_file = sys.argv[1]
ttl_split = sys.argv[2]

#split the file name by / and store the last element in a variable and all but the last element in a variable
directory = os.path.dirname(ttl_file)
filename = os.path.basename(ttl_file)

#open the ttl file and read it into a string
with open(ttl_file, 'r') as f:
    ttl_string = f.read()

#split the ttl_string by "<https://data.emobon.embrc.eu/IDs/>" and store it in a list
split_ttl = ttl_string.split(ttl_split)

#get unique values from list
unique_split_ttl = list(set(split_ttl))

#combine the list back into a string by adding "<https://data.emobon.embrc.eu/IDs/>" back in
#make ttl_split have a blank line in it
ttl_split = ttl_split + "\n"
unique_combined_ttl = ttl_split.join(unique_split_ttl)
#append the ttl_split one more time 
unique_combined_ttl = unique_combined_ttl + ttl_split

#writes the unique_combined_ttl string to a new file
newname = os.path.join(directory, "cleaned_" + filename)
with open(newname, 'w') as f:
    f.write(unique_combined_ttl)
