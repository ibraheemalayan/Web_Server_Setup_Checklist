import sys, os

sys.path.insert(0, '{{{PathToApp}}}')

os.chdir('{{{PathToApp}}}')

from {{{AppFactoryScriptName}}} import create_app

application = create_app()
