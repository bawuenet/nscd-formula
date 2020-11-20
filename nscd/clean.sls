# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import nscd with context %}

nscd-service-running-service-dead:
  service.dead:
    - name: {{ nscd.pkg.service }}

nscd-config-file-file-absent:
  file.absent:
    - name: {{ nscd.pkg.configfile }}

nscd-package-install-pkg-removed:
  pkg.removed:
    - name: {{ nscd.pkg.name }}
