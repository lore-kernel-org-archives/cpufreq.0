From: Thomas Renninger <trenn@suse.de>
Subject: Re: Core 2 Duo E6600 (2.4GHz) reporting max frequency of 900MHz
Date: Wed, 30 Mar 2011 12:48:23 +0200
Message-ID: <201103301248.23763.trenn@suse.de>
References: <4D91F866.20503@cim.mcgill.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <4D91F866.20503@cim.mcgill.ca>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Patrick McLean <patrick@cim.mcgill.ca>
Cc: cpufreq@vger.kernel.org

On Tuesday, March 29, 2011 05:19:02 PM Patrick McLean wrote:
...
> > flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca
> > cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall
> > nx lm constant_tsc arch_perfmon pebs bts rep_good aperfmperf pni
> > dtes64 monitor ds_cpl vmx est tm2 ssse3 cx16 xtpr pdcm lahf_lm
> > tpr_shadow
This cpu already supports aperfmperf registers.
You could try cpufreq-aperf with a recent cpufrequtils package
to double check. Oh no, this is also based on maxfreq exported by cpufreq
subsystem... Hm, I'd still be interested about the outcome.
Best try with idle cores and one core utilized:
cpufreq-aperf
-> send output
cat /dev/zero >/dev/null &
cpufreq-aperf
-> send output

> >   hardware limits: 600 MHz - 900 MHz
Even HW (MSRs) report wrong frequencies?!?
(if CPU is using MSR based switching, what I expect).

Looks like the HW/firmware is broken.
Best is you try with latest BIOS (also search for some related BIOS 
settings and fiddle with them), maybe also make sure that Intel's latest
CPU microcode patch is loaded if BIOS observations do not help...

    Thomas
