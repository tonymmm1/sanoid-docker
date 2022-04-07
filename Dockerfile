FROM alpine:latest as builder
RUN apk add --update git
RUN git clone -b v2.1.0 https://github.com/jimsalterjrs/sanoid

FROM alpine:latest
RUN apk add --update procps
COPY --from=builder ./sanoid/sanoid ./sanoid/syncoid ./sanoid/findoid ./sanoid/sleepymutex /usr/local/sbin/
RUN mkdir /etc/sanoid && touch /etc/sanoid.conf
COPY --from=builder ./sanoid/sanoid.defaults.conf /etc/sanoid
RUN rm -r /etc/periodic && rm /var/spool/cron/crontabs/root
RUN printf '*/15 * * * * flock -n /var/run/sanoid/cron-take.lock -c "TZ=UTC sanoid --take-snapshots\n*/15 * * * * flock -n /var/run/sanoid/cron-prune.lock -c "sanoid --prune-snapshots"' >> /var/spool/cron/crontabs/root
CMD crontab -l && echo && crond -f -l 8
