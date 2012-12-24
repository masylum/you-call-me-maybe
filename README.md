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
is_fake = Maybe.new(le_girl.telephone).number.length.get > 9
```

# API

You call me maybe is slightly based on Data.Maybe from haskell.

## Static methods

### new (a -> Maybe[a])

Creates a new `Maybe` instance witha  given value

```
Maybe.new(le_girl.number) # => Just '666888999'
```

### from_a (Array[a] -> Maybe[a])

Creates a new `Maybe` instance from an array

```
Maybe.from_a([])            # => Nothing
Maybe.from_a(['999666555']) # => Just '999666555'
```

### cat (Array[Maybe[a]] -> Array[a])

Extracts the values from an array of `Maybe` instances

```
Maybe.cat(le_club.girls.map(&:maybe_number)) # => ['999666555', '666888999']
```

### map_maybe (Array[a] -> (a -> Maybe[b]) -> Array[b])

Maps a given block that returns `Maybe` instances and returns their values

```
Maybe.map_maybe(le_club.girls) {|girl| Maybe.new(girl.number)} # => ['999666555', '666888999']
```

## Instance  methods

### method_missing (Maybe[a])

Returns a `Maybe` instance with the result of the method call

```
Maybe.new(le_girl.telephone).number.length # => Just 3
```

### get (b -> (a -> b) -> b)

Returns the value

```
Maybe.new(le_girl.number).get              # => nil
Maybe.new(le_girl.number).get('666333888') # => '666333888'
Maybe.new(le_girl.number).get(0, &:length) # => 3
```

### just? (Boolean)

Returns wether the monad is an instance of `Just`
```
Maybe.new(le_girl.number).just? # => true
```

### nothing? (Boolean)

Returns wether the monad is an instance of `Nothing`

```
Maybe.new(le_girl.number).nothing? # => false
```

### to_a (Array[a])

Converts the `Maybe` instance into an array

```
Maybe.new(le_girl.number).to_a # => ['666888999']
```

### == (Maybe[a])

Compares to `Maybe` instances

```
Maybe.new(le_girl.number) == Maybe.new(le_girl.number) # => true
Maybe.new(le_girl.number) == Nothing.new               # => false
```
