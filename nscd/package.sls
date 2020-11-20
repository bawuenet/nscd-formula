# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import nscd with context %}

nscd-package-install-pkg-installed:
  pkg.installed:
    - name: {{ nscd.pkg.name }}
