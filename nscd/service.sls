# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import nscd with context %}

include:
  - nscd.config

nscd-service-running-service-running:
  service.running:
    - name: {{ nscd.pkg.service }}
    - enable: True
    - watch:
      - sls: nscd.config
