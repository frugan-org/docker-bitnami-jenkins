FROM bitnami/jenkins:2

#https://forums.docker.com/t/unable-to-find-user-root-no-matching-entries-in-passwd-file/26545/2
# Required to perform privileged actions
USER 0


RUN install_packages \
        git-ftp \
        openssh-client \
    ;


####

# Revert to the original non-root user
USER 1001
