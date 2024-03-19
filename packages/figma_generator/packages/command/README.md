# core

Generated properties figma file

## Install

```sh
dart pub global activate figma_gen_hd
```

## Uninstall

```sh
dart pub global deactivate figma_gen_hd
```

## Getting Started

```yaml
figma_gen:
  figma_key: ...
  figma_token: abcdef...
  dir_output: gen
  langs:
    - en
    - vi
    - ja
```

## Use

```sh
# read all text to arb file
figmagen -w
#or :token = abcdef...
figmagen -t :token
# down load all image
figmagen -i :token
# down load all icon
figmagen -n :token
```
