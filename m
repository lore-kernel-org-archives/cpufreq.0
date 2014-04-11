From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 73781] acpi-cpufreq cannot be loaded.
Date: Fri, 11 Apr 2014 08:05:08 +0000
Message-ID: <bug-73781-12968-CrAtPE6MWH@https.bugzilla.kernel.org/>
References: <bug-73781-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-73781-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=73781

Lukasz Majewski <l.majewski@samsung.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |l.majewski@samsung.com

--- Comment #4 from Lukasz Majewski <l.majewski@samsung.com> ---
(In reply to KATO Hiroshi from comment #0)
> After I upgraded kernel to 3.14, acpi-cpufreq module cannot be loaded.
> Accordingly my laptop's cpufreq doesn't run anymore.
> Until kernel 3.13.8, acpi-cpufreq has been loaded automatically as expected.
> 
> If I try to load acpi-cpufreq manually on 3.14, 
> 
> # modprobe acpi-cpufreq
> modprobe: ERROR: could not insert 'acpi_cpufreq': No such device

Why the "No such device" error show up? This is strange.

I suppose, that the acpi_cpufreq.ko module was built correctly.

Could you share the list of modules to be installed/inserted?

Also, I've noticed, that the p4-clockmod is also inserted. Could you
compile it in and left the acpi-cpufreq to be inserted as a standalone module?

Thanks in advance.


> 
> Strangely if p4_clockmod was loaded initially, acpi-cpufreq can be
> loaded sucessfully too. My laptop's cpu is PentiumM though.
> 
> # modprobe p4-clockmod
> # modprobe acpi-cpufreq
> 
> In this case, available frequencies are messed up.
> 
> # cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
> 212500 425000 637500 850000 1062500 1275000 1487500 1700000
> 
> On 3.13.8 (This is correct.)
> # cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
> 1700000 1400000 1200000 1000000 800000 600000 
> 
> 
> /proc/cpuinfo on Linux version 3.13.8
> processor       : 0
> vendor_id       : GenuineIntel
> cpu family      : 6
> model           : 9
> model name      : Intel(R) Pentium(R) M processor 1700MHz
> stepping        : 5
> microcode       : 0x7
> cpu MHz         : 600.000
> cache size      : 1024 KB
> physical id     : 0
> siblings        : 1
> core id         : 0
> cpu cores       : 1
> apicid          : 0
> initial apicid  : 0
> fdiv_bug        : no
> f00f_bug        : no
> coma_bug        : no
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 2
> wp              : yes
> flags           : fpu vme de pse tsc msr mce cx8 sep mtrr pge mca cmov
> clflush dts acpi mmx fxsr sse sse2 tm pbe bts est tm2
> bogomips        : 1199.92
> clflush size    : 64
> cache_alignment : 64
> address sizes   : 32 bits physical, 32 bits virtual
> power management:

-- 
You are receiving this mail because:
You are the assignee for the bug.
