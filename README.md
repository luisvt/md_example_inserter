# md_example_inserter

Inserts the code from the example in the file specified in the `{@example paht/to/file}` tag.

## Installation

To install this package globally you only need to run:

```
pub global activate md_example_inserter
```

this will download and install ng2gen executable into ~/.pub-cache/bin, then add ~/.pub-cache/bin to your path to directly use the executable like this

```
md_example_inserter
```

or you can use

```
pub global run md_example_inserter
```

## Usage

Create a file with extension `.mdtmpl` then on it you can create references to other files in the same project in next way:

```md
...
{@example path/to/file}
...
```

finally just run:

```
md_example_inserter
```