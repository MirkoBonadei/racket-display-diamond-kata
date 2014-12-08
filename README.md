racket-display-diamond-kata
===========================

Everyone is talking about this kata during the last days, the inspiration seems to come from [here](http://claysnow.co.uk/recycling-tests-in-tdd/).

I have decided to implement it as an excuse to write some racket after some times.

### The solution

Everything comes from the Euclidean plane and this makes the process of thinking at this kata really simple.
In fact, to get the final diamond we can easily generate the second quadrant of the euclidean plane. In case we want to display a diamond from `#\A` to `#\C` it is similar to:
```
  A
 B
C
```
Then we have to imagine that there is the `y-axis` of the plane that cuts exactly in the middle of the letter `A`.

It is then clear that we have to project the second quadrant over the `y-axis` to get:
```
  A
 B B
C   C
```

Which is the top part of the diamond. But if we comtinue to use the euclidean plane it is easy to spot that a projection over the `x-axis` (which cuts the line of the `#\C` in two parts) can give us the complete diamond we are looking for.
```
  A
 B B
C   C
 B B
  A
```

### Examples
```racket
> (display-diamond #\E)
(        A        )
(      B   B      )
(    C       C    )
(  D           D  )
(E               E)
(  D           D  )
(    C       C    )
(      B   B      )
(        A        )
> (display-diamond-without-borders #\E)
    A    
   B B   
  C   C  
 D     D 
E       E
 D     D 
  C   C  
   B B   
    A 
```
