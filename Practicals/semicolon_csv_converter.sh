#script to convert ; separated to , separated

Cat $1 |  tr ";" "," > "$1"_to_convert.csv