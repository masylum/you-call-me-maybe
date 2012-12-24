# This is crazy! I just met you! Here is my number! => Exception

```
get(le_girl.telephone.number)
```

What happens if `le_girl` does not have a telephone? Your application crashes!

`nil` exceptions are probably among the most common ones, and they appear
because we don't handle properly uncertainity.

You probably are throwing defensive code to your `nil` exceptions but to be honest
this is patching the problem instead of preventing it

```
# this is lame, and you call yourself an engineer?
is_fake = le_girl.telephone &&
          le_girl.telephone.number &&
          le_girl.telephone.number.length < 9

# better but not so clever
is_fake = le_girl.try(:telephone).try(:number).try(:length) < 9
```

## Monads to the rescue

A monad is like a box that holds a value. We are all using them without knowing it.
Arrays are beautiful Monads that hold 0 or more results of a computation.

```
real_numbers = le_club.girls.map(&:telephone)
                            .map(&:number)
                            .filter {|number| number.length > 9}
```

This example is really similar to the one we showed before but you have to notice that no
defensive coding is needed at all. Each function received an array and returns an array
which may contain 0 or more values.

## The Maybe monad

Whenever you have a computation that returns 0 or 1 result you can use the `maybe` monad.

```
is_fake = Maybe.new(le_girl.telephone).number?.length? > 9
```

# API

You call me maybe is slightly based on Data.Maybe from haskell.

## Static methods

```
# new
#
# @param [a]
# @return [Maybe a]
Maybe.new(le_girl.number)

# from_a
#
# @param [Array a]
# @return [Maybe a]
Maybe.from_a([])
Maybe.from_a(['999666555'])

# cat
#
# @param [Array (Maybe a)]
# @return [Array a]
Maybe.cat(le_club.girls.map(&:number))

# map_maybe
#
# @param [Array a]
# @block [a -> Maybe b]
# @return [Array b]
Maybe.map_maybe(le_club.girls, &:number)
```

## Instance  methods

```
# []
#
# @return [Maybe a]
Maybe.new(le_girl.telephone)[:number][:length]

# get
#
# @param [b] - optional
# @block [a -> b] - optional
# @return [b]
Maybe.new(le_girl.number).get(0, &:length)

# just?
#
# @return [Boolean]
Maybe.new(le_girl.number).just?

# nothing?
#
# @return [Boolean]
Maybe.new(le_girl.number).nothing?

# to_a
#
# @return [Array a]
Maybe.new(le_girl.number).to_a
```
