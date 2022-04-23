# Build app using Gradle
FROM gradle:7.4.2-jdk18 AS app-build
ARG gpr_user
ARG gpr_key
WORKDIR /app
COPY  settings.gradle build.gradle ./
# Found this was the only way to copy in the src directory for some reason.
RUN mkdir src
COPY src ./src
RUN gradle -Pgpr.user=$gpr_user -Pgpr.key=$gpr_key build


# Copy app in from builder into image for production
FROM eclipse-temurin:18
COPY --from=app-build /app/build/libs/apache-openwhisk-runtime-java-18-1.0.0-all.jar /
ENTRYPOINT [ "java", "-jar", "/apache-openwhisk-runtime-java-18-1.0.0-all.jar" ]
