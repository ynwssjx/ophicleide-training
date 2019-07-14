FROM radanalyticsio/openshift-spark:2.3-latest

USER root

ADD . /opt/ophicleide

WORKDIR /opt/ophicleide

RUN easy_install pip \
 && pip install setuptools==41.0.1 \
 && pip install -r requirements.txt \
 && pip wheel -r wheel-requirements.txt -w . \
 && mv pymongo*.whl pymongo.zip

USER 185

CMD /opt/ophicleide/run.sh
