# =========================================================================
# STAGE 1: The Hardened Base Runtime Environment
# =========================================================================
FROM tomcat:10.1-jdk17-alpine AS production-runtime

WORKDIR /usr/local/tomcat/webapps/

# Security Hardening: Completely strip out default vulnerability apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Security Hardening: Enforce explicit ownership rules on the deployment layer
COPY --chown=tomcat:tomcat target/core-banking.war ./ROOT.war

# =========================================================================
# STAGE 2: Absolute Defense-in-Depth Execution Layer
# =========================================================================
# We switch away from root access entirely before launching the port mapping
USER tomcat

EXPOSE 8080

# Boot the Apache Tomcat Engine securely
CMD ["catalina.sh", "run"]
