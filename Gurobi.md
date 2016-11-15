# Installing Gurobi's Python API on Linux (Ubuntu/Mint)

by Pedro Belin Castellucci, 2016.

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/80x15.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.

This is an unofficial guide to installing Gurobi's Python API on Linux. It is based on the official instructions, which can be found  [here](https://www.gurobi.com/documentation/7.0/quickstart_linux/software_installation_guid.html#section:Installation).

For this tutorial, I assume the following:

- You have downloaded and extracted the file containing the version of Gurobi you want to install. The downloads are available at: <http://www.gurobi.com/downloads/gurobi-optimizer>. 
- You have an working Python 2.7 installation.

As an example we will install Gurobi 7.0.1. Change you current directory to the extracted *gurobi701/linux64* folder, which is the install directory <installdir>:

`cd gurobi701/linux64`

If you have root privileges, issue the following:

`sudo python setup.py install`

otherwise use:

`python setup.py install --user`


Now, we need to tell Python where we have installed Gurobi. Add the following lines to your .bashrc file:

`export GUROBI_HOME="/opt/gurobi701/linux64"`

`export PATH="${PATH}:${GUROBI_HOME}/bin"`

`export LD_LIBRARY_PATH="${GUROBI_HOME}/lib"`

`export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib/python2.7/dist-packages/gurobipy"`

Note that, for different versions of Gurobi, GUROBI_HOME variable will have to be modified accordingly. The last step is to tell the system your license number, which can be obtained at www.gurobi.com.

`<installdir>grbgetkey xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`

In this step you will be prompted a place to keep your license file (<licensedir>), then we need to tell the system where to find it. Add the following to your .bashrc file:

`<licensedir>gurobi.lic`

The last step is to reload your .bashrc:

`source .bashrc`


## Troubleshooting

One of the most common error messages is:

`ImportError: libgurobi70.so: cannot open shared object file: No such file or directory`

This usually means Gurobi could not be found in your PATH. This usually mean your .bashrc file is not setup correctly. You can try add the correspondingly lines in the file .profile. Unfortunately, in which file to put those lines is dependent of your Operational System and you should consult its manual.
