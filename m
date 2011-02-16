From: Thomas Renninger <trenn@suse.de>
Subject: Re: desperately trying to enable maximum supported frequency scaling on a core2
Date: Wed, 16 Feb 2011 09:43:06 +0100
Message-ID: <201102160943.07052.trenn@suse.de>
References: <N1B-mrB4sgbovA@Safe-mail.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <N1B-mrB4sgbovA@Safe-mail.net>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: jhopper@safe-mail.net
Cc: cpufreq@vger.kernel.org

This is the highest frequency exported from BIOS through ACPI
tables, that's the max OS can set/request:
# cat /sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_max_freq 
3200000

I expect these lines:
Feb 15 00:32:35 localhost kernel: [  124.000107] cpufreq-core: setting new policy for CPU 0: 2400000 - 3700000 kHz
are coming from your manual requests to set it to 3.7 not sure.

This machine is already some kind of overclocked?:
model name      : Intel(R) Core(TM)2 Duo CPU     E6750  @ 2.66GHz
cpu MHz         : 3200.000

You want to see specific cores boosted into turbo mode?
This will be done by HW behind the OS and cpufreq drivers back.
If requirements are met (other cores are idle and in specific sleep modes)
HW may enter higher frequencies automatically.
Only way to find out about it is by polling.
Use cpufreq-aperf for that.
Doing:
cat /dev/zero >/dev/null &
cpufreq-aperf
should show you the utilized core in turbo mode (if supported).

If you want to do me a favor, download this one:
wget http://gitorious.org/cpupowerutils/cpupowerutils/archive-tarball/playground cpupowertutils_playground.tar.gz
Tell me if you see something suspicious or something not working.
Compile it (needs pciutils-devel package) and run
utils/cpuidle-info_hw
The frequency column of the mperf counter should also show you
higher freqs than cpufreq subsystem knows when boosted.

cpufreq-info -b
with above package tells you whether turbo/boost mode is supported.


 Thomas
