# PHP 7.1 S2I MongoDB extensions

Custom S2I builder providing dependencies not availabale in the official
images.

## Why?

Well, because I needed to use MongoDB and did not see any sensible way
how to get the driver into the official image.

## Production ready?

No! Made simply to be able to run my workshops and demos.

## How to use

Import the `ImageStream` into your OpenShift project

```
oc create -f https://raw.githubusercontent.com/openshift-roadshow/php-s2i-71-mongodb/master/is.json
```

or make it global (in case correct privileges are available)


```
oc create -f https://raw.githubusercontent.com/openshift-roadshow/php-s2i-71-mongodb/master/is.json -n openshift
```

## How to build

Tweak the `Makefile` to fit your environment

## License

Provided under the terms of the MIT license.