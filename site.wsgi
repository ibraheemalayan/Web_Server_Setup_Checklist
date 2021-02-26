import sys

sys.path.insert(0, '{{{PathToApp}}}')

from {{{app_factory_name}}} import create_app

application = create_app()
