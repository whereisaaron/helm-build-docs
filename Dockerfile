FROM circleci/golang as build
ARG REPO=https://github.com/whereisaaron/helm.git
ARG BRANCH=patch-2
ENV BUILDDIR=$GOPATH/src/k8s.io/helm
RUN go get -u github.com/golang/protobuf/proto
RUN mkdir -p $BUILDDIR && \
  git clone --single-branch --branch $BRANCH $REPO $BUILDDIR
RUN cd $BUILDDIR && make bootstrap
RUN cd $BUILDDIR && make build
RUN cd $BUILDDIR && make docs
RUN tar -C $BUILDDIR/docs -czf /tmp/docs.tar.gz .

FROM scratch
COPY --from=build /tmp/docs.tar.gz /
ENTRYPOINT /
