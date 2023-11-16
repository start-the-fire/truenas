{{- define "public.repo.moovit24.de" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.registryCredentials.registry (printf "%s:%s" .Values.registryCredentials.username .Values.registryCredentials.password | b64enc) | b64enc }}
{{- end }}

{{- define "helmut.env"}}
{{printf "--spring.data.mongodb.uri=mongodb://%s:%s@%s-mongodb:%s/admin" .Values.mongodbSettings.username .Values.mongodbSettings.password .Values.appname (.Values.mongodbSettings.port | toString) }}
{{printf "--spring.rabbitmq.host=%s-rabbitmq" .Values.appname}}
{{printf "--mcc.fx.url=http://%s-fx:8100/v1/fx" .Values.appname}}
{{printf "--mcc.co.url=http://%s-co:8101/v1/co" .Values.appname}}
{{printf "--mcc.io.url=http://%s-io:8102/v1/io" .Values.appname}}
{{printf "--mcc.hk.url=http://%s-hk:8103/v1/hk" .Values.appname}}
{{printf "--mcc.users.url=http://%s-users:8000/v1/members" .Values.appname}}
{{printf "--mcc.stream.url=http://%s-streams:8001/v1/streams" .Values.appname}}
{{printf "--mcc.preference.url=http://%s-preferences:8002/v1/preferences" .Values.appname}}
{{printf "--mcc.metadata.url=http://%s-metadata:8003/v1/metadata" .Values.appname}}
{{printf "--mcc.logging.url=http://%s-logging:8004/v1/logging/helmut" .Values.appname}}
{{printf "--mcc.amqp.url=http://%s-amqp:8005/v1/amqp/send" .Values.appname}}
{{printf "--mcc.license.url=http://%s-license:8006/v1/license" .Values.appname}}
{{printf "--mcc.language.url=http://%s-language:8007/v1/language" .Values.appname}}
{{printf "--mcc.cronjob.url=http://%s-cronjob:8008/v1/cronjob" .Values.appname}}
{{- end }}

{{- define "containerResources"}}
# requests:
#     memory: {{.Values.containerResources.resources.requests.memory}}
#     cpu: {{.Values.containerResources.resources.requests.cpu}}
# limits:
#     memory: {{.Values.containerResources.resources.limits.memory}}
#     cpu: {{.Values.containerResources.resources.limits.memory}}
{{- end}}

{{- define "helmut.args" }}
command: ["/bin/sh", "-c"]
args: ["java -XX:+UseSerialGC -Djava.security.egd=file:/dev/./urandom -jar /app/app.jar ${parameters}"]
{{- end }}
