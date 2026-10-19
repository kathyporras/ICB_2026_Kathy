#script to extract the number of times one individual was sampled from the doc 

#!/bin/bash

cut -f1 "$1" | tail -n +2 | grep -c "^$2$"