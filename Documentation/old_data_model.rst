#########################
<GenTwoo-0.1.0 Data Model
#########################
.. parsed-literal::

    User:
        twitter_id
        twitter_attrs
        username
        user_config

    Package:
        category   : string
        name       : string
        version    : string

    Emerge:
        |uid|
        |pid|
        buildtime  : timestamp
        duration   : int
        log        : string
        errorlog   : string

    Comment:
        |uid|
        comment    : string
        subject    : generic_refs(table, id) ; rails thing
        timestamp  : timestamp

.. |uid| replace:: user_id    : refs User(id)
.. |pid| replace:: package_id : refs Package(id)
.. |eid| replace:: emerge_id  : refs Emerge(id)
