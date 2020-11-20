# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package' %}
{%- from tplroot ~ "/map.jinja" import nscd with context %}

include:
  - nscd.package

nscd-config-file-file-managed:
  file.managed:
    - name: {{ nscd.pkg.configfile }}
    - source: salt://nscd/files/nscd.conf.jinja2
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - require:
      - sls: nscd.package
    - context:
        nscd: {{ nscd | json }}
