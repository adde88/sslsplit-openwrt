# SSLSplit - Transparent SSL/TLS interception  
## Source-code and Makefile for OpenWRT SDK

~~This is my package of SSLSplit for the OpenWRT SDK, allowing compilation of sslsplit for wifi pineapples.~~

This is *my* package of SSLSplit for the LEDE SDK allowing compilation of SSLSplit for wifi routers on LEDE. The only difference is that LEDE is using musl-libc that doesn't have the non-spec FTS lib built in, so we pull in musl-fts and add the lib in the makefile. The one other requirement is that you copy the musl-fts package from the head of the LEDE repo if you try to build against `17.01.4`.
