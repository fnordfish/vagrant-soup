Description
===========

Installs FontForge from source. By default without X (GUI) so it's useful for batch-creating or -transforming fonts.

Requirements
============

Platform
--------

* Debian, Ubuntu

Cookbooks
---------

* build-essential
* git

Attributes
==========

* `default['fontforge']['with_python']` = Include a python interpreter? default: `false`
* `default['fontforge']['with_iconv']` = Don't use the fontforge's iconv(3) routines, use system's instead: default: `false`

Usage
=====


License and Author
==================

Author:: Robert Schulze (robert@dotless.de)

Copyright 2011, Robert Schulze

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
