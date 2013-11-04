##############################################
Minimal Viable Product Specification and Goals
##############################################

Purpose: minimal deployable system capable of package state tracking.

Note: This documented is slight overlap between product and technical
view intentionaly, because practical reasons.

Client & BDCS
#############

Registration
============

In order to prevent accidental re-registrations manual registration will
be required. That should be as simple as executing `emerge --config
gentwoo`

For scalability and security [3]_ reasons clients will be identified by
client-generated UUID which will be the only information sent when
performing client registration.

.. TBD: choose UUID version.

Authentication
==============

Authentication will be performed only by looking up the Machine UUID in
registered machines list.

This may be improved by adding asymetric cryptography keys which would
protect from spoofing, uuid collisions and also should not require
manual intervention by users.

Usefulness
==========

In order to provide usefull data, following data model is required.

.. TBD

Client
######

Implemented in python as 1. Gentoo Linux is using mostly python for
core system packages. 2. <GenTwoo-0.1.0 already implements it in python.

Architecture
============

There are two main architectures to choose from:

1. Daemon.

2. Periodicaly executing script.

We should implement both [1]_ so users can choose. However, for MVP only
of those should be chosen [2]_.

Security
========

For increased security, after `emerge gentwoo-client` the gentwoo
processes should run under gentwoo user with access restricted to files
neccesarily required for collecting the minimal data set.

That is `/var/log/emerge.log` file, which is by default installed with
portage:portage owner, so gentwoo will need to run in portage group.

This can be later improved by adding syslog rules to duplicate required
information to different file which will allow to no grant portage group
privileges to the gentwoo processes.

.. [1] It should be pretty simple but I'm not sure what the technical
   challenges are in detail.
.. [2] Probably the one which is existing, which is 1. Daemon.
.. [3] `Product Specification <./product_specification.rst>`_
