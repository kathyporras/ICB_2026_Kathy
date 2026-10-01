## Week 1 Answers
### First Part

1. Navigate to your home directory

I was in the DataFiles directory so I just wrote this to come back:

```bash
cd ../../
ls
cd kathy
ls
```

2. Navigate to another path of my computer

```bash
cd VT/Research/CommitteeMeetings
```

3. To go to DataFiles directory

 ```bash
cd ../../IntroCompBio/IntroBiolComp-2026/Python/DataFiles
```

4. To go to sandbox

```bash
cd ../../Unix/sandbox
```

### Second Part

1. To navigate to Data Files directory, I used:

 ```bash
cd /Users/kathy/Documents/VT/IntroCompBio/IntroBiolComp-2026/Unix/DataFiles
```
2. How many lines are in the file BeeSpecies.txt?

**My answer:** 19509

```bash
wc -l BeeSpecies.txt
```
3. Without leaving the current directory count the number of words in the CodonTable.tsv file in the Data Files directory.

**My answer:** I was already in the DataFiles directory from the previous question. They were 195 words in the document, and I used this code:

```bash
wc CodonTable.tsv
```
4. What is the last codon reported in this file?

**My answer:** TTT
 
```bash
tail CodonTable.tsv
```
### Important
I used this code to synchronize my local and remote repositories:

```bash
git pull
```
