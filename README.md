# Purpose
Given three strings, write a method to test if shuffledString is a valid "shuffle" of string0 and string1.

# References
Backtracking  
<https://en.wikipedia.org/wiki/Backtracking>

# Results

## Original problem statement
We are given 3 strings: str1, str2, and str3.  

str3 is said to be a shuffle of str1 and str2 if it can be formed by interleaving 
the characters of str1 and str2 in a way that maintains the left to right ordering 
of the characters from each string.
For example, given  

    str1 == "abc"
    str2 == "def"

str3 == "dabecf" is a valid shuffle since it preserves the character ordering of the two strings.

So, given these 3 strings write a function that detects whether str3 is a valid shuffle of str1 and str2.

## Background
Can write algorithm recursively or iteratively.  
Recursive algorithm may be simpler to write, but has risk of call stack overflow.  
Iterative algorithm may have less risk of data structure stack overflow.  
Algorithmically traversing a solution tree and then backing up is called "backtracking".  

In general case, str1 and str2 may have repeated letters and duplicate letters.
For example

    str1 == "aba"
    str2 == "abza"
    str3 == "abaabza"

## Nomenclature

    Let string0 length == m
    Let string1 length == n
    Let shuffledString length == m + n

## Possible approach
The possible solutions can be viewed as a binary tree.
At each index in shuffledString can choose one of two-

    pop next letter from string0
    pop next letter from string1


See BSShuffler.m

## Possible alternative approach - Iterate through shuffledString
At each letter, have two choices- can put it into string0 or string1.  
There are 2 ^ (m + n) possible deals.  
Big O complexity is exponential.  
Generate all possible candidates for string0, of any length 1 to (m + n).  
Then search candidates for one that equals the actual string0.  
This approach is very "brute force" and likely impractical.  
