# HelloLed

A minimal VHDL project designed to prove that you have **Vivado 2018.2** installed successfully.

Targeted toward Digilent Basys3. Make sure to install the [board files](https://github.com/Xilinx/XilinxBoardStore/tree/2018.2/boards/Digilent/basys3).

Tested on Windows 10.

## Build this project

Clone and cd into the directory.

Build the project using the handy `.bat` file.

You should see a new `helloLed.xpr` file. Open it with Vivado!

### Manually, without BAT

1. Clone the repo
2. Open Vivado 2018.2
3. From the weclome screen, select Window->Tcl Console
4. In the tcl console at the bottom of the screen `cd` to the this directory
5. In the consoled enter `source helloLed.tcl`
6. Proceed with normal simulation, synthesis, implementation, bitstream process.
7. On the board `SW0` should now control `LD0`!

Thanks to [fpgadeveloper post](https://www.fpgadeveloper.com/2014/08/version-control-for-vivado-projects.html/)!

## Use this template

You can use this template to create other version controlled Vivado projects.

In order to do this, you need to replace the source files with the ones you want and then regenerate the `build.tcl` file.

1. Clone a clean copy of helloLed, where you *have not* run the `build.bat` script.
2. Change the name of the helloLed folder to what you want your project to be called
3. Delete the files in `src/hdl` that you don't want.
4. Open Vivado and select **Create New Project**
5. Create the proect, selecting this directory. Uncheck the option to create a new directory.
6. Add the files you do want to `src/hdl`

In Vivado, **File > Project > Write Tcl...**
- **Output File** select `build.tcl`
- **Uncheck** "Copy sources to new project"!
- OK

Then, open the `build.tcl` in a program that shows `git diff`, such as vs code or git GUI.
Look at the differences and change some stuff back to the original... specifically:

Make sure you use `$origin_dir` rather than you specific path.
This is important for keeping files where Git knows about them.

```tcl
# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/"]"

# Create project - modified to have root and source match
create_project ${_xil_proj_name_} ${origin_dir}
```

Also, change the absolute path to relative in the comments starting at line 26

## GitHub Actions Testbench

The workflow uses the [setup-ghdl-ci](https://github.com/ghdl/setup-ghdl-ci) GitHub action
to run a *nightly* build of [GHDL](https://ghdl.github.io/ghdl/).

First, the workflow uses GHDL to **analyze** all `.vhd` files in `src/hdl/`.

Then it **elaborates** the *any* entity with the name `*_tb`. In this case, that is `helloled_tb`.

Finally, the workflow **runs** the simulation. If successful then it will quietly exit with a `0` code.
If any of the `assert` statements fail **with** `severity failure` then GHDL will cease the simulation and exit with non-zero code; this will also cause the workflow to fail.
Assert statements of other severity levels will be reported, but not fail the workflow.
