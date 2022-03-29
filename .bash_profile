# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH

# MacPorts Installer addition on 2022-01-19_at_09:54:45: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

export BASH_SILENCE_DEPRECATION_WARNING=1

# opam configuration
test -r $HOME/.opam/opam-init/init.sh && . $HOME/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# scilab exec path for jupyter usage
SCILAB_EXECUTABLE="/Applications/scilab-6.1.1.app/Contents/bin/scilab-adv-cli"
export SCILAB_EXECUTABLE

source ~/.bash_prompt
source ~/.aliases
source ~/.bashrc
