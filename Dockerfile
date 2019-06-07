FROM scratch
COPY dispatch /
ENTRYPOINT ["/dispatch"]
