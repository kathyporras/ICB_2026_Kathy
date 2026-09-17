```python
#Exercise 6.2 codon to aminoacid 
#Create a dictionary with the Codon column as keys and symbool colum as values
#I had to google this part, but essentialy I first have to insert the file that we are going to based our dictionary on
#I already copied the document on the working directory through the terminal
#I called the package that will help me to open the .tsv

import csv
```


```python
#this is the part that i had to google. I created an empty dictionary first so that everything that I write is saved inside it, 
dictCodon = {}

#this is because the command with ... as is a function that will name my file f, but it's different from a variable!!! not the same.
with open('CodonTable.tsv') as f:
    #this is already a variable, which is going to be the table I just inserted above "f", and I'm telling python that every column 
    #delimitated by tabs (because is a tsv document
    codontable = csv.reader(f, delimiter='\t')
    #this is going to skip the first row that are the titles, because otherwise they will be in the dictionary as well and we don't 
    #want that
    next(codontable)
    #and finally, this is where I extract all the names of the columns. I indicated it that I want column 0 to be the keys (codon) and 
    #column 1 to be the values (aminoacids). Column 2 was symbol. And I added a for ... in because it has to repeat this process along
    #the whole column so that I don't have to do this by hand.
    #in the instructions said that use symbol as the value but I'm actually going to use aminoacid because latter we will use it in 
    #another exercise.
    dictCodon = {column[0]: column[1] for column in codontable}
```


```python
dictCodon
```




    {'AAA': 'Lys',
     'AAC': 'Asn',
     'AAG': 'Lys',
     'AAT': 'Asn',
     'ACA': 'Thr',
     'ACC': 'Thr',
     'ACG': 'Thr',
     'ACT': 'Thr',
     'AGA': 'Arg',
     'AGC': 'Ser',
     'AGG': 'Arg',
     'AGT': 'Ser',
     'ATA': 'Ile',
     'ATC': 'Ile',
     'ATG': 'Met',
     'ATT': 'Ile',
     'CAA': 'Gln',
     'CAC': 'His',
     'CAG': 'Gln',
     'CAT': 'His',
     'CCA': 'Pro',
     'CCC': 'Pro',
     'CCG': 'Pro',
     'CCT': 'Pro',
     'CGA': 'Arg',
     'CGC': 'Arg',
     'CGG': 'Arg',
     'CGT': 'Arg',
     'CTA': 'Leu',
     'CTC': 'Leu',
     'CTG': 'Leu',
     'CTT': 'Leu',
     'GAA': 'Glu',
     'GAC': 'Asp',
     'GAG': 'Glu',
     'GAT': 'Asp',
     'GCA': 'Ala',
     'GCC': 'Ala',
     'GCG': 'Ala',
     'GCT': 'Ala',
     'GGA': 'Gly',
     'GGC': 'Gly',
     'GGG': 'Gly',
     'GGT': 'Gly',
     'GTA': 'Val',
     'GTC': 'Val',
     'GTG': 'Val',
     'GTT': 'Val',
     'TAA': 'Stp',
     'TAC': 'Tyr',
     'TAG': 'Stp',
     'TAT': 'Tyr',
     'TCA': 'Ser',
     'TCC': 'Ser',
     'TCG': 'Ser',
     'TCT': 'Ser',
     'TGA': 'Stp',
     'TGC': 'Cys',
     'TGG': 'Trp',
     'TGT': 'Cys',
     'TTA': 'Leu',
     'TTC': 'Phe',
     'TTG': 'Leu',
     'TTT': 'Phe'}




```python
#Create a string with the following sequence as input (including spaces)
seq = "CTA GGA GTG ATT TCG"
```


```python
#Add code to split the string aove into three-letter strings (i.e. codons)
codons = seq.split()
codons
```




    ['CTA', 'GGA', 'GTG', 'ATT', 'TCG']




```python
#Add code that uses your dictionary to match each codon to its corresponding amino acid, and save the amino acid sequence as a list
#I knew that I needed to use a for loop because otherwise I will have to do one by one (which I tried):
#dictCodon.get("CTA", "Not found")
#dictCodon.get("GGA", "Not found")
#dictCodon.get("GTG", "Not found")
#dictCodon.get("ATT", "Not found")
#dictCodon.get("TCG", "Not found")

#then note the results and make a list by hand. But I wanted to make it more efficient, so I created a loop, but I also googled 
#some of this because it's not on the top of my head.

#first I need a "place" in where to store the results of the loops, and it's going to be the aminoacids
aminoacids = []
#for every codon (my temporary variable) in the list of codons that I created above
for codon in codons:
    #look for the value of the key that I am providing you, if it doesn't exist print "Not found"
    aminoacid = dictCodon.get(codon, "Not found")
    #and add all the aminoacids corresponding to each codon to the list that I already created above
    aminoacids.append(aminoacid) 
```


```python
aminoacids
```




    ['Leu', 'Gly', 'Val', 'Ile', 'Ser']


