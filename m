From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: speedstep-centrino fails to load
Date: Sat, 07 Apr 2007 17:09:00 -0700
Message-ID: <4618329C.8060603@goop.org>
References: <200703212241.33408.giacof@tiscali.it>
	<200704072344.40043.giacof@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200704072344.40043.giacof@tiscali.it>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Federico Giacomini <giacof@tiscali.it>
Cc: cpufreq@lists.linux.org.uk

Federico Giacomini wrote:
> hello again,
>
> the error message indicates your address, if you have no time to deal with that right now, please give me any other name to contact about the bug.
>   

Hi,

The cpufreq list is the right for bugs in this driver.  It's actually
obsolete now, replaced by the acpi driver, but if you're seeing a
message telling you to mail me, you must be using a fairly old version.

    J
> Regards,
>
> Federico
>
> On Wednesday 21 March 2007 22:41, F. G. wrote:
>   
>> Hello,
>>
>> I'm addressing you because I got the following error lines in my kernel's log:
>>
>> Mar 20 22:22:13 R3d-574r kernel: [4294692.623000] CLASS: registering class device: ID = 'acpi'
>> Mar 20 22:22:13 R3d-574r kernel: [4294692.623000] class_uevent - name = acpi
>> Mar 20 22:22:13 R3d-574r kernel: [4294692.623000] class_device_create_uevent called for acpi
>> Mar 20 22:22:13 R3d-574r kernel: [4294692.705000] bus type 'i2c' registered
>> Mar 20 22:22:13 R3d-574r kernel: [4294692.705000] bus i2c: add driver i2c_adapter
>> Mar 20 22:22:13 R3d-574r kernel: [4294692.705000] device class 'i2c-adapter': registering
>> Mar 20 22:22:13 R3d-574r kernel: [4294692.774000] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
>> Mar 20 22:22:13 R3d-574r kernel: [4294692.973000] cpufreq-core: trying to register driver centrino
>> Mar 20 22:22:13 R3d-574r kernel: [4294692.973000] cpufreq-core: adding CPU 0
>> Mar 20 22:22:13 R3d-574r kernel: [4294692.974000] speedstep-centrino: Invalid control/status registers (1 - 1)
>> Mar 20 22:22:13 R3d-574r kernel: [4294692.974000] speedstep-centrino: <6>speedstep-centrino: invalid ACPI data
>> Mar 20 22:22:13 R3d-574r kernel: [4294692.974000] speedstep-centrino: <6>speedstep-centrino: found unsupported CPU with Enhanced SpeedStep: send /proc/cpuinfo to Jeremy Fitzhardinge <jeremy@goop.org>
>> Mar 20 22:22:13 R3d-574r kernel: [4294692.974000] cpufreq-core: initialization failed
>> Mar 20 22:22:13 R3d-574r kernel: [4294692.974000] cpufreq-core: no CPU initialized for driver centrino
>> Mar 20 22:22:13 R3d-574r kernel: [4294692.974000] cpufreq-core: unregistering CPU 0
>>
>> I installed Kubuntu Edgy (originally kernel 2.6.17.11) on my Centrino laptop (Compal DL76). The problem occurred after downloading kernel source 2.6.17.14 and compiling it with the speedstep_centrino_acpi option enabled and the default acpi_cpufreq one disabled.
>> Here is my /proc/cpuinfo output:
>>
>> $ cat /proc/cpuinfo
>> processor       : 0
>> vendor_id       : GenuineIntel
>> cpu family      : 6
>> model           : 13
>> model name      : Intel(R) Pentium(R) M processor 1.86GHz
>> stepping        : 8
>> cpu MHz         : 1862.355
>> cache size      : 2048 KB
>> fdiv_bug        : no
>> hlt_bug         : no
>> f00f_bug        : no
>> coma_bug        : no
>> fpu             : yes
>> fpu_exception   : yes
>> cpuid level     : 2
>> wp              : yes
>> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe nx up est tm2
>> bogomips        : 3727.79
>>
>> Thank you for your time and consideration.
>> Regards,
>>
>> Federico Giacomini
>>
>>     
