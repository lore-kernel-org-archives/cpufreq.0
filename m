From: Francesco Poli <frx@firenze.linux.it>
Subject: Weird behaviour (cpufreq-2.4.21-2)
Date: Sat, 19 Jul 2003 00:33:02 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030719003302.1664a98f.frx@firenze.linux.it>
Reply-To: CpuFreq <cpufreq@www.linux.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: CpuFreq <cpufreq@www.linux.org.uk>

Hello everybody!  :)
I installed a 2.4.21 kernel + cpufreq-2.4.21-2 (downloaded
from http://www.codemonkey.org.uk/cpufreq/) + acpi-20030619-2.4.21
(downloaded from http://acpi.sourceforge.net/) on an Acer Aspire 1302XV
(AMD Mobile Athlon XP 1600+). I manually fixed the vid-fid bug in
powernow-k7.c (as reminded by Carl Thompson in a recent post), activated
the ACPI-related configuration options, compiled and installed.

Here comes the weird!

When I boot all seems right. The CPU is almost 100% idle and
$ cat /proc/cpufreq
          minimum CPU frequency  -  maximum CPU frequency  -  policy
CPU  0       500000 kHz ( 35 %)  -    1400000 kHz (100 %)  - 
performance$ cat /proc/acpi/thermal_zone/THRM/temperature
temperature:              60 C
And this seems to be able to go on (with temperature slowly
decreasing!).

Then I disconnect the laptop from the electrical network: so I run on
battery.
When I go back on AC power, the battery starts charging (as reported by
the LED and by ACPI). And the temperature goes up towards 80 degrees
Celsius; the back fan wakes up thus pushing the temperature down again
to 69 degrees Celsius; then the fan rests and the temperature goes up
again. This thermal cycle goes on and on, even if the CPU is almost
totally idle.

A simple reboot stops this behaviour and, after a while, I get
$ cat /proc/acpi/thermal_zone/THRM/temperature
temperature:              57 C

The question is: what's wrong? What did I messed up with?

-- 
    Francesco Poli       <frx AT firenze.linux.it>
======================================================
You're compiling a program and, all of a sudden, boom!
  -- from APT HOWTO, version 1.8.0
