import sys

sys.path.insert(0, '{{{PathToApp}}}')

from {{{AppFactoryScriptName}}} import create_app

application = create_app()
