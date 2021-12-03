# Rayden

Rayden includes utilities to aid in the writing of Common Lisp code.
In particular, there are convenience functions and macros (and 
re-exports) for writing functional code.

The package depends on the public domain 
[`:alexandria`](https://common-lisp.net/project/alexandria/) 
and MIT License 
[`:arrow-macros`](https://github.com/hipeta/arrow-macros/) packages.

## Usage

Install Rayden by saving the repository into your local lisp
directory, such as `~/.roswell/local-projects/`, and loading it from
there. For example, once saved in the local lisp directory, you may
load it using `(ql:quickload :rayden)`.

## Test

After installing rove (`ros install rove`), execute the following command:

```
rove rayden.asd
```

Tested on SBCL, CCL, and ABCL on GNU/Linux x86_64.

## License

Released under the MIT License, (c) Jin-Ho King 2021.
