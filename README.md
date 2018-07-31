# jmoo-fp

## vscode & hie
ghc version running in stack needs to be same version that was used to compile hie (language server). otherwise, the haskell ide extension won't work


## adding third party dependencies
edit your <project-name>.cabal file and any third party libraries under 'build-dependencies'
there are multiple sections containing 'build-dependencies', so ensure you add it to the appropriate one.

then run `stack build`


## run code

Load code into GHCi
```
$> stack repl --main-is jmoo-fp-exe
```



## questions

### q1
```
:t getIdentityToken
IO
       (http-client-0.5.13.1:Network.HTTP.Client.Types.Response
          Data.ByteString.Lazy.Internal.ByteString)
```

yet, i get it to compile with
```
import qualified Data.ByteString.Lazy.Char8 as BS
getIdentityToken :: IO (Response BS.ByteString)
```

### q2
what does `{-# LANGUAGE OverloadedStrings #-}` do?

