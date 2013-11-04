####################################
Product Specification and Philosophy
####################################

.. NOTE: following paragraph is indentical in /README.rst
   TODO: find a way to DRY this in way that works on GitHub

Purpose of the project is to provide the Gentoo Community with a useful,
scalable, secure, user friendly and engaging package usage tracking on
users machines and possibly per users too.

Usefull
#######

The core purpose is to make it possible for Gentoo Linux Developers to
make informed decisions [5]_ with regard to package maintenance - update
priority, cve notifications, effect of removing packages and possibly
more can turn out [6]_.

The core purpose will be achieved by gathering statistics on package
(un)installations per machine at the lowest level. Then additional
demography layers can be added by clustering machines per user,
organization, geography or hardware characteristics etc.

Scalable
########

There are estimated 100k [1]_ gentoo machines worldwide, therefore it is
neccessary for this service to be technically well scalable in order to
provide significant benefit.

The chosen strategy is

.. _BDCS:

1. to seperate the Backend Data Collection Service (BDCS) from the rest
   of the application servers.

2. Implement BDCS using asynchronous IO [2]_ [3]_

Secure
######

Since sending information about system state is basicly Information
Leakage the minimal system should provide users with anonymous
submissions that will be available only to the user themselfs and the
`BDCS` operators (Gentoo Linux staff).

The `BDCS` wil use a form of asymetrical cryptography (TLS?) to ensure
it is not trivial to target users by spoofing the official `BDCS`
server.

User Friendly
#############

Participating in the GenTwoo system must be as simple as possible, but
not simpler for the users

Engaging
########

Future versions of GenTwoo should provide social and gamified features
for the users who wish to participate in such which was already
pioneered by `<GenTwoo-0.1.0 <http://gentwoo.elisp.net/>`_ but
disregarded in 0.1.0 for practical purposes.

More Ideas
##########

Could also serve for auditing purposes.

.. [1] bonsaikitten
.. [2] http://en.wikipedia.org/wiki/Asynchronous_I/O
.. [3] http://www.kegel.com/c10k.html
.. [4] http://highscalability.com/blog/2013/5/13/the-secret-to-10-million-concurrent-connections-the-kernel-i.html
.. [5] as opposed to guesstimating by gut feeling
.. [6] TBD: investigate results of other distributions refs #1
