From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Core2Duo locked at 800MHz
Date: Tue, 27 Nov 2007 07:27:39 -0800
Message-ID: <924EFEDD5F540B4284297C4DC59F3DEE2B355B@orsmsx423.amr.corp.intel.com>
References: <474A6C62.3070103@reinelt.co.at><20071126190929.GE15764@redhat.com>
	<474BB4F2.9040604@reinelt.co.at><1196160448.23251.21.camel@queen.suse.de><474C2B60.5000501@reinelt.co.at>
	<1196175224.23251.39.camel@queen.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <1196175224.23251.39.camel@queen.suse.de>
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
To: trenn@suse.de, Michael Reinelt <michael@reinelt.co.at>
Cc: Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk

 

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk 
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of 
>Thomas Renninger
>Sent: Tuesday, November 27, 2007 6:54 AM
>To: Michael Reinelt
>Cc: Dave Jones; cpufreq@lists.linux.org.uk
>Subject: Re: Core2Duo locked at 800MHz
>
>On Tue, 2007-11-27 at 14:36 +0000, Michael Reinelt wrote:
>> Hi THomas,
>> 
>> > It is probably limited through _PPC again.
>> > Dave, Len: Can you please add the patch that _PPC changes 
>are printed
>> > with cpufreq.debug, pls.
>> > I posted this a while ago on the cpufreq list:
>> > Subject: [PATCH] Print _PPC changes via cpufreq debug layer
>> > http://article.gmane.org/gmane.linux.kernel.cpufreq/5642
>> 
>> Looks like it is :-(
>> 
>> I applied your patch and did the debugging again, and found 
>the following:
>> 
>> merlin.merlin.local:/home/michi # grep PPC Lifebook.syslog*
>> cpufreq-core: CPU 0: _PPC is 0 - frequency not limited
>> cpufreq-core: CPU 1: _PPC is 0 - frequency not limited
>> cpufreq-core: CPU 0: _PPC is 1 - frequency  limited
>> cpufreq-core: CPU 1: _PPC is 1 - frequency  limited
>> cpufreq-core: CPU 0: _PPC is 2 - frequency  limited
>> cpufreq-core: CPU 1: _PPC is 2 - frequency  limited
>> cpufreq-core: CPU 0: _PPC is 3 - frequency  limited
>> cpufreq-core: CPU 1: _PPC is 3 - frequency  limited
>> cpufreq-core: CPU 0: _PPC is 4 - frequency  limited
>> cpufreq-core: CPU 1: _PPC is 4 - frequency  limited
>> cpufreq-core: CPU 0: _PPC is 5 - frequency  limited
>> 
>> the first PPC message appears where acpi_cpufreq isn't even 
>loaded. As I 
>> found these tables in the debug output:
>> 
>> freq-table: table entry 0: 2401000 kHz, 0 index
>> freq-table: table entry 1: 2400000 kHz, 1 index
>> freq-table: table entry 2: 2000000 kHz, 2 index
>> freq-table: table entry 3: 1600000 kHz, 3 index
>> freq-table: table entry 4: 1200000 kHz, 4 index
>> freq-table: table entry 5: 800000 kHz, 5 index
>> 
>> acpi-cpufreq:      *P0: 2401 MHz, 35000 mW, 10 uS
>> acpi-cpufreq:       P1: 2400 MHz, 35000 mW, 10 uS
>> acpi-cpufreq:       P2: 2000 MHz, 28000 mW, 10 uS
>> acpi-cpufreq:       P3: 1600 MHz, 22000 mW, 10 uS
>> acpi-cpufreq:       P4: 1200 MHz, 16000 mW, 10 uS
>> acpi-cpufreq:       P5: 800 MHz, 14000 mW, 10 uS
>> 
>> as the reported _PPC value shows up after the corresponding 
>P state has 
>> been entered, I guess thats the reason for my problem: Looks like my 
>> notebook can enter a certain P-state, but can never leave it 
>towards a 
>> higher frequency.
>> 
>> so...
>> 
>> - wtf is _PPC?
>An interface that your BIOS uses to tell the OS that not all freqs are
>allowed to be used (1 means do not allow highest freq, 2 do not allow
>the two highest, and so on).
>> 
>> - does this look like a BIOS bug?
>Possibly...
>Searching for the latest BIOS should be your first step...
>Also have a look at your BIOS configs, there might be something to
>adjust with SpeedStep, CPU Freq, GV1/GV3 (is this only happening on
>battery, then you may have some "battery optimized freq" setting set).
>
>If this does not help you should open a bug on bugzilla.kernel.org,
>assign it to the ACPI component and attach acpidump output.
>You may want to CC me then, maybe we see the reason why _PPC is
>increased by having a look at the ACPI tables...
>

Also, Are you running on battery or AC power when you see this problem.
Typically BIOSes reduce freq when in battery mode.

Thanks,
Venki
