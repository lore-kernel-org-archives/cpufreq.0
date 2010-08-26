From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 17001] ondemand governor non-functional / ACPI P-states driver
Date: Thu, 26 Aug 2010 15:14:41 GMT
Message-ID: <201008261514.o7QFEfZ6031628@demeter1.kernel.org>
References: <bug-17001-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-17001-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=17001





--- Comment #5 from Thomas Renninger <trenn@suse.de>  2010-08-26 15:13:54 ---
Can you also post the ondemand settings, that would be:
for x in /sys/devices/system/cpu/cpu0/cpufreq/ondemand/*;do echo $x;cat $x;done

Does it help if you increase the sampling_rate value, e.g. to 100000 or lower
the up_threshold or set ignore_nice_load to 0?

You could use two times:
cat /dev/zero >/dev/null &
to fully utilize the cpus, this should ramp the freq up.

If you have CONFIG_CPU_FREQ_DEBUG set in your config, check with:
zcat /proc/config.gz |grep CONFIG_CPU_FREQ_DEBUG
you could boot with cpufreq.debug=7, quickly (so that the output is not too
much and the boot process is still included in dmesg) try above and fully
utilize the CPUs and attach the full dmesg output, hopefully there is a hint
what goes wrong...

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
