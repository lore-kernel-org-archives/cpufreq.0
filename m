From: Carl Thompson <cet@carlthompson.net>
Subject: CPUSpeed 1.1 released (finally)
Date: Fri,  7 Nov 2003 20:14:17 -0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1068264857.2c5ff476f0b29@carlthompson.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: CPUFreq Mailing List <cpufreq@www.linux.org.uk>
Cc: Gerald Teschl <Gerald.Teschl@univie.ac.at>, Christian Zoz <zoz@suse.de>, Enrico Tassi <tassi@cs.unibo.it>, NERvOus <nervous@nervous.it>

I have finally gotten around to releasing CPUSpeed v1.1 (formerly named
cpufreq but that was too confusing).  CPUSpeed is yet another program
(actually the first, I think?) to control CPU speed based on idle, AC
connection and CPU temperature using the CPUFreq userspace governor.

Some Features:
* Dynamically adjusts CPU speed and voltage based on demand for CPU
  (idle/work ratio threshold is user-configurable)
* Automatically detects available processor speeds
* For normal operation, no configuration or options are necessary.  Just
  run it!
* One binary works on both Linux 2.4 with the 'proc' interface and Linux
  2.6 with the 'sysfs' interface. No need to recompile if you switch
  kernels!
* Can reduce CPU speed and voltage if AC power is disconnected from the
  computer (requires ACPI)
* Can reduce CPU speed and voltage if CPU temperature gets too high
  (Requires ACPI, temperature is user-configurable)
* Can be told to lock CPU at minimum or maximum frequency via signals
* "nice()'d" processes will not increase CPU speed
* Crash-proof frequency switching even if you have a very tempermental CPU
  (some AMD mobile Athlons in particular)
* More that I'm forgetting.

This latest version of CPUSpeed can be found at its new web site:

   http://carlthompson.net/software/cpuspeed

My apologies to all those who have patiently waited for months for me to
release this version!  Future versions will be more timely...

Thank you,
Carl E. Thompson
