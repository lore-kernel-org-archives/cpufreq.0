From: "Miles Lane" <miles.lane@gmail.com>
Subject: 2.6.18-mm1 -- CPUFreq not working
Date: Tue, 26 Sep 2006 10:51:21 -0700
Message-ID: <a44ae5cd0609261051i6dc03777l6646899624a62d5a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932206AbWIZRvd@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Morton <akpm@osdl.org>, LKML <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk

This looks like a kernel config logic problem.  I shouldn't be able to
build ondemand support into the kernel, if all the other CPU power
management code is built as modules.  I suspect this problem applies
to the other governers (powersave, performance, conservative).
drivers/built-in.o: In function `ondemand_powersave_bias_init':
cpufreq_ondemand.c:(.text+0x6f78f): undefined reference to
`cpufreq_frequency_get_table'
drivers/built-in.o: In function `powersave_bias_target':
cpufreq_ondemand.c:(.text+0x6f8e7): undefined reference to
`cpufreq_frequency_table_target'
cpufreq_ondemand.c:(.text+0x6f925): undefined reference to
`cpufreq_frequency_table_target'
cpufreq_ondemand.c:(.text+0x6f949): undefined reference to
`cpufreq_frequency_table_target'

I am wondering whether the following warning indicates a problem that
prevents CPUFreq from working, because no matter how I play with the
CPUFreq kernel config options, I always get a message from the power
management applet that CPUFreq isn't working.
WARNING: arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.o - Section
mismatch: reference to .init.data:sw_any_bug_dmi_table from .text
between 'acpi_cpufreq_cpu_init' (at offset 0x360) and
'acpi_cpufreq_target'
WARNING: arch/i386/kernel/cpu/cpufreq/speedstep-centrino.o - Section
mismatch: reference to .init.text: from .data between
'sw_any_bug_dmi_table' (at offset 0x40) and 'models

Here's my current .config settings:
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_TABLE=m
CONFIG_CPU_FREQ_DEBUG=y
CONFIG_CPU_FREQ_STAT=m
CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_PERFORMANCE=m
CONFIG_CPU_FREQ_GOV_POWERSAVE=m
CONFIG_CPU_FREQ_GOV_USERSPACE=y
CONFIG_CPU_FREQ_GOV_ONDEMAND=m
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
CONFIG_X86_SPEEDSTEP_CENTRINO=m
CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI=y
CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=y
CONFIG_X86_SPEEDSTEP_ICH=m
CONFIG_X86_SPEEDSTEP_SMI=m
CONFIG_X86_SPEEDSTEP_LIB=m
CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK=y
