# bfx-containers

Various docker containers for bioinformatics



# `ghcr.io/kdm9/acanthophis-diamond`

Diamond2 (Buckfink et al 2022) with some extra utilities: `blindschleiche`, `pixz`,  and `zstd`
# `ghcr.io/kdm9/glnexus-bcftools`

Adds `bcftools` into the upstream `glnexus` docker container, allowing easier post processing of merged BCFs.

# `ghcr.io/kdm9/minimap2-samtools`

A joint samtools + minimap2 + paftools all-in-one container.
# `ghcr.io/kdm9/shovill:latest`

A containerisation of Torsten Seemann's excellent [`shovill`](https://github.com/tseemann/shovill), but with [PR #147](https://github.com/tseemann/shovill/pull/147) merged so you can specify a path to alternative adapter sequences.
