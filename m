From: Manfred Langthaller <manfred.langthaller@aon.at>
Subject: Re: Can't lower vcore => "vid trans failed"
Date: Mon, 18 Jun 2007 17:31:49 +0200
Message-ID: <4676A565.1060305@aon.at>
References: <4676671D.30307@aon.at>
	<1449F58C868D8D4E9C72945771150BDF02076EAF@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1449F58C868D8D4E9C72945771150BDF02076EAF@SAUSEXMB1.amd.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: cpufreq@www.linux.org.uk

Langsdorf, Mark schrieb:
>> Mainboard: MSI K8MM3-V H (MSI-7181 Ver: 2.0) BIOS v3.1 (latest)
>> CPU: AMD mobile Sempron 3000+ (SMS3000BQX2LF, TDP 25W)
>> Debian 4.0
>> Kernel: 2.6.21.5
>>
>> If I insert module powernow-k8 3 P-States are recognized, but the 
>> voltages are too high.
>>
>> powernow-k8: Found 1 Mobile AMD Sempron(tm) Processor 3000+ 
>> processors 
>> (version 2.00.00)
>> powernow-k8:    0 : fid 0xa (1800 MHz), vid 0xa
>> powernow-k8:    1 : fid 0x8 (1600 MHz), vid 0xc
>> powernow-k8:    2 : fid 0x0 (800 MHz), vid 0x13
>> powernow-k8: ph2 null fid transition 0xa
>>
>> 0: VID = 0xa = 01010 = 1.3V
>> 1: VID = 0xc = 01100 = 1.250V
>> 2: VID = 0x13 = 10011 = 1.075V
> 
> These voltages are consistently 0.1V above minimum specification,
> but your laptop motherboard may have needed some margin.  If you
> mess with them, you may have problems while transitioning.  As
> you've noticed.
> 
>> Now after inserting module powernow-k8 dmesg says:
>>
>> powernow-k8: Found 1 Mobile AMD Sempron(tm) Processor 3000+ 
>> processors 
>> (version 2.00.00)
>> powernow-k8:    0 : fid 0xa (1800 MHz), vid 0x13 => 1.075V
>> powernow-k8:    1 : fid 0x8 (1600 MHz), vid 0x16 => 1.000V
>> powernow-k8:    2 : fid 0x0 (800 MHz), vid 0x1d => 0.825V
>> powernow-k8: ph2 null fid transition 0xa
> 
> vid at 1800 MHz should be 1.2V (0xe)
> vid at 1600 MHz should be 1.15V (0x10)
> vid at 800 MHz shoul dbe 0.975V (0x17)
> 
> I don't know why you think you can operate at 0.825V but it's 
> not a supported frequency on the data sheet.
> 
>> powernow-k8: vid trans failed, vid 0x1d, curr 0x13
>> powernow-k8: transition frequency failed
>> Time: acpi_pm clocksource has been installed.
>> Clocksource tsc unstable (delta = -277822049 ns)
>> (appending nohz=off highres=off to the kernel should fix the 
>> clocksource 
>> error)
>>
>> All in all the vcore cannot be set lower than 0x13, even 0x13 
>> at 1800MHz works perfectly.
>>
>> Where is the problem?
>> Is it the board, the kernel, or me?
> 
> Your revised ACPI table is more than a little strange.
> 
> -Mark Langsdorf
> Operating System Research Center
> AMD
> 
> 
> 
Hi Mark & Thanks a lot!

First of all, it's a desktop board and I'm just playing around ;-)
Second I searched for a datasheet but did'n find one.

Thank you for clarification!

Have a nice day,

Manfred
