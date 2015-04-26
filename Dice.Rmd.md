Final Project  
========================================================
  
Deveoping Data Projects - Final Project  
Data Science Specialization  
Coursera - John Hopkins Bloomberg School of Public Health  
Non Transitive Dice by Roger Oglesby on 24th April 2015

Non Transitive Dice
========================================================

"If a game looks too good to be true, it probably is."  

In this simulation of a simple dice game, the odds looks stacked in your favour...  
- There are only three dice to select from.  
- You get first pick of the dice.  
- The simulation lasts 100 rolls to reduce luck 
  
What is the catch?
========================================================
The dice are not standard cubes with 1, 2, 3, 4, 5, 6 spots  

- Die A:  3, 3, 3, 3, 3, 6 (mostly 3s)  
- Die B:  2, 2, 2, 5, 5, 5 (2s and 5s)  
- Die C:  1, 4, 4, 4, 4, 4 (mostly 4s)  
  
Which cube do you select? How confident are you of winning the best of 100 rolls?  
On each roll, highest score wins.  
You can't get a tie with these dice.

Theory
========================================================
These non transitive dice illustrate the counter intuitive principle
that  
Die A is better than Die B  
and  
Die B is better than Die C  
but strangely  
Die A is not better than Die C. In fact Die C is better than Die A.  

```r
summary(cars)
```

```
     speed           dist       
 Min.   : 4.0   Min.   :  2.00  
 1st Qu.:12.0   1st Qu.: 26.00  
 Median :15.0   Median : 36.00  
 Mean   :15.4   Mean   : 42.98  
 3rd Qu.:19.0   3rd Qu.: 56.00  
 Max.   :25.0   Max.   :120.00  
```

Slide With Plot
========================================================

![plot of chunk unnamed-chunk-2](Dice.Rmd-figure/unnamed-chunk-2-1.png) 
