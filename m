From: Francesco Poli <frx@firenze.linux.it>
Subject: Re: Weird behaviour (cpufreq-2.4.21-2)
Date: Tue, 22 Jul 2003 01:12:20 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030722011220.2905e9e0.frx@firenze.linux.it>
References: <20030719003302.1664a98f.frx@firenze.linux.it>
	<20030719064528.GA1658@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030719064528.GA1658@brodo.de>
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

On Sat, 19 Jul 2003 08:45:28 +0200 Dominik Brodowski wrote:

> > The question is: what's wrong? What did I messed up with?
> 
> Hmmm... might it be that the BIOS meddles with the CPU frequency, too?
> You could compare the output of the "bogomips" tool to detect
> frequency changes, for example.

Here's a session log (I used bogomips v1.2 from the Debian Woody
sysutils package)


# alias ETEMP='cat /proc/acpi/thermal_zone/THRM/temperature'
# ETEMP
temperature:             62 C
# ETEMP
temperature:             62 C
# cat /proc/cpufreq
          minimum CPU frequency  -  maximum CPU frequency  -  policy
CPU  0       500000 kHz ( 35 %)  -    1400000 kHz (100 %)  - 
performance# ETEMP
temperature:             62 C
# on_ac_power
# echo $?
0
# on_ac_power
# echo $?
1
# ETEMP
temperature:             62 C
# bogomips
Calibrating delay loop.. ok - 1394.00 BogoMips
# on_ac_power
# echo $?
0
# ETEMP
temperature:             78 C
# ETEMP
temperature:             79 C
# bogomips
Calibrating delay loop.. ok - 1394.00 BogoMips
# ETEMP
temperature:             76 C
# bogomips
Calibrating delay loop.. ok - 1394.00 BogoMips
# ETEMP
temperature:             75 C
# ETEMP
temperature:             74 C
# ETEMP
temperature:             74 C
# bogomips
Calibrating delay loop.. ok - 1394.00 BogoMips
# ETEMP
temperature:             73 C
# ETEMP
temperature:             73 C
# ETEMP
temperature:             73 C
# ETEMP
temperature:             72 C
# bogomips 
Calibrating delay loop.. ok - 1384.00 BogoMips
# ETEMP
temperature:             73 C
# ETEMP
temperature:             72 C
# ETEMP
temperature:             72 C
# ETEMP
temperature:             72 C


It seems that the CPU clock frequency stays pretty fixed, doesn't it?

Any ideas?

-- 
    Francesco Poli       <frx AT firenze.linux.it>
======================================================
You're compiling a program and, all of a sudden, boom!
  -- from APT HOWTO, version 1.8.0
