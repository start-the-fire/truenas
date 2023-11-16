{{- define "public.repo.moovit24.de" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.registryCredentials.registry (printf "%s:%s" .Values.registryCredentials.username .Values.registryCredentials.password | b64enc) | b64enc }}
{{- end }}

{{- define "containerResources"}}
# requests:
#     memory: {{.Values.containerResources.resources.requests.memory}}
#     cpu: {{.Values.containerResources.resources.requests.cpu}}
# limits:
#     memory: {{.Values.containerResources.resources.limits.memory}}
#     cpu: {{.Values.containerResources.resources.limits.memory}}
{{- end}}

