### Exercise 6.1
#### Using a shebang in the first line

```python
#!/usr/bin/env phyton3
```

#### Naming the variables with my information

```python
name = "Kathy"
color = "purple"
hobbie = "karaoke"
animal = "whale"
```

Here I print all the info but to include "enter" \n is added to each of the lines, so that we can read it as a list and not everything together.

```python
print("My name:", name, 
	  "\nMy favorite color:", color,
	  "\nMy favorite activity:", hobbie,
	  "\nMy favorite animal:", animal)
```

### Exercise 6.2: Codon to aminoacid
1. Create a dictionary with the Codon column as keys and symbool colum as values

I had to google this part, but essentialy I first have to insert the file that we are going to based our dictionary on.
I already copied the document on the working directory through the terminal. I called the package that will help me to open the .tsv

```python
import csv
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
dictCodon
```
2. Create a string with the following sequence as input (including spaces)

```python
seq = "CTA GGA GTG ATT TCG"
```

3. Add code to split the string aove into three-letter strings (i.e. codons)

```python
codons = seq.split()
codons
['CTA', 'GGA', 'GTG', 'ATT', 'TCG']
```
4. Add code that uses your dictionary to match each codon to its corresponding amino acid, and save the amino acid sequence as a list

I knew that I needed to use a for loop because otherwise I will have to do one by one (which I tried):

```python
#dictCodon.get("CTA", "Not found")
#dictCodon.get("GGA", "Not found")
#dictCodon.get("GTG", "Not found")
#dictCodon.get("ATT", "Not found")
#dictCodon.get("TCG", "Not found")
```

However, I would have to take results, note them and built the list manually. But I wanted to make it more efficient, so I created a loop, but I also googled some of this because it's not on the top of my head.

```python
#first I need a "place" in where to store the results of the loops, and it's going to be the aminoacids
aminoacids = []
#for every codon (my temporary variable) in the list of codons that I created above
for codon in codons:
    #look for the value of the key that I am providing you, if it doesn't exist print "Not found"
    aminoacid = dictCodon.get(codon, "Not found")
    #and add all the aminoacids corresponding to each codon to the list that I already created above
    aminoacids.append(aminoacid) 
aminoacids
['Leu', 'Gly', 'Val', 'Ile', 'Ser']
```
