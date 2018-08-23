# tensorflow.cr

Crystal binding for [TensorFlow](https://github.com/tensorflow/tensorflow).

This is an early-stage open-source project. You can call functions from bindings directly, but wrappers are not ready yet.

## Requiments

You need to compile and install `libtensorflow.so` from [this repo](https://github.com/tensorflow/tensorflow/).

Quick instructions:

```
$ ./configure
$ cd tensorflow
$ bazel build :libtensorflow.so
$ cp ../bazel-bin/tensorflow/libtensorflow.so /usr/local/lib/
```

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  tensorflow:
    github: fazibear/tensorflow.cr
```

## Usage

```crystal
require "tensorflow"
```

See [examples](https://github.com/fazibear/tensorflow.cr_examples) repository.

## Contributing

1. Fork it ( https://github.com/fazibear/tensorflow/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [fazibear](https://github.com/fazibear) Michał Kalbarczyk - creator, maintainer

## Thank you!

[![Become Patreon](https://c5.patreon.com/external/logo/become_a_patron_button.png)](https://www.patreon.com/bePatron?u=6912974)
