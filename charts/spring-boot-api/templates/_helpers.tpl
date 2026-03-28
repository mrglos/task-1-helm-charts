{{/*
Chart name extension.
*/}}
{{- define "spring-boot-api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Resource names main generator (fullname).
Limits names to 63 znaków (k8s DNS requirement).
*/}}
{{- define "spring-boot-api.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Standard Selector Labels used to connecting services with pods
*/}}
{{- define "spring-boot-api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "spring-boot-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
