From: Carl Thompson <cet@carlthompson.net>
Subject: [ANNOUNCE] CPUSpeed 1.2.1 released!
Date: Sun, 09 Jan 2005 18:54:12 -0800
Message-ID: <41E1EE54.2050200@carlthompson.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

CPUSpeed 1.2.1 has, at long last, been released. There are many, many 
new features in this release including even greater efficiency and full 
multi-processor support. You can grab it at 
http://carlthompson.net/software/cpuspeed .

Some of the current features include:

    * Dynamically adjusts CPU speed and voltage based on demand for CPU
      (idle/work ratio threshold is user-configurable)
    * Automatically detects available processor speeds
    * For normal operation, no configuration or options are necessary.
      Just run it!
    * Full multiprocessor support (each CPU separately run-time
      configurable)
    * One binary works on both Linux 2.4 with the 'proc' interface and
      Linux 2.6 with the 'sysfs' interface. No need to recompile if you
      switch kernels! (proc interface deprecated)
    * Configurable minimum and maximum allowed speeds
    * Can reduce CPU speed and voltage if AC power is disconnected from
      the computer (requires ACPI)
    * Can maximize CPU speed if AC power is connected to the computer
      (requires ACPI)
    * Can reduce CPU speed and voltage if CPU temperature gets too high
      (Requires ACPI, temperature is user-configurable)
    * Can be told to lock CPU at minimum or maximum frequency via signals
    * "nice()'d" processes and those waiting for I/O will not increase
      CPU speed
    * Polling interval for CPUs, temperature and AC adapter configurable
      separately
    * Crash-proof frequency switching even if you have an outdated
      version of CPUFreq and a very temperamental CPU (some AMD mobile
      Athlons in particular)
    * Handles strange processors with lots of little speed steps
    * More that I am forgetting...

CHANGELOG:

    Version 1.2.1

        * Can now better handle processors with a large number of speed
          steps (>20)
        * Configurable maximum and minimum CPU speeds
        * Option to maximize speed when AC adapter connected
        * Option to NOT minimize speed when AC adapter disconnected
        * Consider I/O wait time as idle time
        * Option to restore previous speed on program exit
        * Can set polling interval for CPU idle, AC adapter and
          temperature separately
        * Better Red Hat / Fedora Core / SuSE script integration
        * More efficient startup sequence (fewer speed changes necessary)
        * Full multi-processor support
        * Try to load default list of drivers if none specified

    Version 1.1

        * One binary works on both 2.4 and 2.5+ kernels
        * Updated to work with latest sysfs directory structure (tested
          with 2.5.75)
        * Now the program is even better at making sure temperamental
          Athlons don't
        * crash no matter what state the CPU is in on startup
        * Simplified things by having just one threshold level instead
          of two
        * Replaced floating point math with integer

Remember, you can grab it at http://carlthompson.net/software/cpuspeed .

As always, feedback is welcome.

Carl Thompson
