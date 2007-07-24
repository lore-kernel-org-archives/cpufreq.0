From: Thomas Renninger <trenn@suse.de>
Subject: Re: Cannot set max cpu frequency
Date: Tue, 24 Jul 2007 15:23:37 +0200
Message-ID: <1185283417.4023.21.camel@noname>
References: <490dd6310707230943n753b8955q3f20fd24ce6f5314@mail.gmail.com>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <490dd6310707230943n753b8955q3f20fd24ce6f5314@mail.gmail.com>
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
To: Andy Spencer <andy753421@gmail.com>
Cc: cpufreq@lists.linux.org.uk

On Mon, 2007-07-23 at 16:43 +0000, Andy Spencer wrote:
> For the last few days I have been unable set the maximum frequency for my
> processor (Intel Pentium M). A few days ago it worked correctly so I am
> assuming it is a hardware problem, but I have not been able to confirm that
> whatsoever. Does anyone have any suggestions for debugging this?
> 
> Here's what actually happens. I boot up my laptop and the ondemand governor
> is set to range between 800MHz and 2.00GHz. At first this works correctly,
> but after a few minutes the range will be reset to 800MHz-800Mhz and I am
> unable to change it without rebooting. I've tried changing it using '$
> cpufreq-set -u 2.00GHz' as well as 'echo -n 2000000 >
> /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq' (I'm not even sure if
> the 2nd one 'should' work). Changing to the 'userspace' governor has no
> effect.

It could be that cpufreq gets limited, because of temperature limits.
But this is unlikely (49 C and so much freq steps, making sure the fan
slots are clean is still a good idea).
I more looks like a BIOS issue. You may want to search your BIOS and
disable anything that could point to BIOS controlled frequency
switching.
Does "dmesg |grep -i acpi" show any warnings/errors?
Which kernel version is this about?
Do you run the latest BIOS, if not better update to the latest first.
Maybe it works if you do not load a specific ACPI module (only
processor, do not load fan, button, battery, ac, thermal modules)?
If it still happens with without ACPI modules, I'd compile a kernel with
ACPI_DEBUG enalbed (still only load the processor module), then increase
ACPI debug level: "echo 0x1F >/proc/acpi/debug_level". With some luck
you can catch the ACPI code processed, causing this.
Hmm, before doing that, maybe you should just open a bug at
kernel.bugzilla.org, attach acpidump output (based on latest BIOS) and
whatever you find out... Not sure whether to file the bug against
cpufreq or an ACPI component I have the strong feeling this is an ACPI
or BIOS bug (pls CC me there).

   Thomas
