FROM ckan/ckan-base:2.11

# Install any extensions needed by your CKAN instance
# See Dockerfile.dev for more details and examples

USER root

RUN apt-get update && \
    apt-get install -y python-dev-is-python3 libxml2-dev libxslt1-dev libgeos-c1v5

RUN pip3 install -e 'git+https://github.com/ckan/ckanext-harvest.git@master#egg=ckanext-harvest' && \
    pip3 install -r ${APP_DIR}/src/ckanext-harvest/pip-requirements.txt
RUN pip install -e 'git+https://github.com/qld-gov-au/ckanext-s3filestore.git#egg=ckanext-s3filestore'
RUN pip install -r ${APP_DIR}/src/ckanext-s3filestore/requirements.txt
RUN pip install -e "git+https://github.com/davidread/ckanext-hierarchy.git#egg=ckanext-hierarchy" && \
    pip install -r ${APP_DIR}/src/ckanext-hierarchy/requirements.txt
RUN pip install -e "git+https://github.com/ckan/ckanext-spatial.git#egg=ckanext-spatial" && \
    pip install -r ${APP_DIR}/src/ckanext-spatial/pip-requirements.txt && \
    pip install ckanext-geoview 

# Copy custom initialization scripts
COPY --chown=ckan-sys:ckan-sys docker-entrypoint.d/* /docker-entrypoint.d/

# Apply any patches needed to CKAN core or any of the built extensions (not the
# runtime mounted ones)
COPY --chown=ckan-sys:ckan-sys patches ${APP_DIR}/patches

USER ckan

RUN for d in $APP_DIR/patches/*; do \
        if [ -d $d ]; then \
            for f in `ls $d/*.patch | sort -g`; do \
                cd $SRC_DIR/`basename "$d"` && echo "$0: Applying patch $f to $SRC_DIR/`basename $d`"; patch -p1 < "$f" ; \
            done ; \
        fi ; \
    done
