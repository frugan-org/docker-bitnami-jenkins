FROM bitnami/jenkins:2

#https://forums.docker.com/t/unable-to-find-user-root-no-matching-entries-in-passwd-file/26545/2
# Required to perform privileged actions
USER 0


#https://vsupalov.com/docker-arg-vs-env/
ARG NSS_WRAPPER_GROUP

RUN if [ ! -z "${NSS_WRAPPER_GROUP:-}" ]; then \
        echo "ssh:x:1:" >> ${NSS_WRAPPER_GROUP}; \
        \
        install_packages \
            git-ftp \
            openssh-client \
        ; \
    fi


####

COPY entrypoint.sh /

#https://github.com/docker-library/postgres/issues/296#issuecomment-308735942
RUN chmod +x /entrypoint.sh

# Revert to the original non-root user
USER 1001

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/opt/bitnami/scripts/jenkins/run.sh" ]
