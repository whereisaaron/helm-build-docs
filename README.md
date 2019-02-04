# Regenerate the `docs` folder for a helm PR

This `bash` script and `Dockerfile` provides an easy, zero-footprint way to regenerate the `helm` `docs` folder,
which you may need to update in order to submit a PR to `helm`.

The `helm` build process generates documentation. However these artifacts are also commited back to git in the 'docs' folder.
So a documentation PR could require the person making to PR to build all of `helm` in order to regenerate the documentation
themselves and commit that too. The `helm` PR process won't do this for you.

To use this yourself, you should first either:
1. Update the `REPO` and `BRANCH` in `Dockerfile` to your PR branch
2. Update `BuildDocs.sh` to pass `REPO` and `BRANCH` as `--build-arg`s

Then just run `BuildArgs.sh`. When it finishes you'll have a `docs.tar.gz` file
you can use to up the `docs` folder in your PR branch.
