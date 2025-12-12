FROM rust:1.92.0 AS build-env
WORKDIR /app
RUN git clone https://github.com/atlassian-labs/FSRT.git && \
    cd FSRT && \
    cargo build --release

FROM rust:1.92.0
COPY --from=build-env /app/FSRT/target/release/fsrt /
COPY common.sh /
COPY pipe.sh /

ENTRYPOINT ["/pipe.sh"]