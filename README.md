# Hangman

## Getting started

```sh
git clone https://github.com/phuwanart/hangman.git
cd hangman
```

## How to play

- Run hangman with:

```sh
ruby main.rb
```

- Select the category:

```sh
Select Category:
1. Animal Name
2. English Premier League 2018/2019 Team

> 1
```

- Guess the word by input one letter:

```sh
Hint: Hen
_______ score   0, remaining incorrect guess 10
> C
C__c___ score   2, remaining incorrect guess 10
> h
Ch_c___ score   3, remaining incorrect guess 10
> i
Chic___ score   4, remaining incorrect guess 10
> i
Chic___ score   5, remaining incorrect guess 10
> k
Chick__ score   6, remaining incorrect guess 10
> q
Chick__ score   6, remaining incorrect guess 9, incorrect guessed: q
> q
already guessed
Chick__ score   6, remaining incorrect guess 9, incorrect guessed: q
> e
Chicke_ score   7, remaining incorrect guess 9, incorrect guessed: q
> n
Chicken score   8, remaining incorrect guess 9, incorrect guessed: q
You won!
```
