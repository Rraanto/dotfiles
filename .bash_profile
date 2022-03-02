# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH

##
# Your previous /Users/rantonyainarakotondrajoa/.bash_profile file was backed up as /Users/rantonyainarakotondrajoa/.bash_profile.macports-saved_2022-01-19_at_09:54:45
##

# MacPorts Installer addition on 2022-01-19_at_09:54:45: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# opam configuration
test -r /Users/rantonyainarakotondrajoa/.opam/opam-init/init.sh && . /Users/rantonyainarakotondrajoa/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

alias jupyter="python3 -m jupyter notebook"
export SCILAB_EXECUTABLE="/Applications/scilab-6.1.1.app"
source ~/.bash_prompt
source ~/.aliases
