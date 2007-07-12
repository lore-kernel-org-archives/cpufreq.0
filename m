From: "Lei Yang" <leiyang@google.com>
Subject: Re: Problem with acpi-cpufreq on 8-core machines
Date: Thu, 12 Jul 2007 15:17:12 -0700
Message-ID: <c583a31b0707121517x509ab63cl2d8a834c153dae02@mail.gmail.com>
References: <c583a31b0707111737s237dcde8m211ac2c192668300@mail.gmail.com>
	<1184220147.2720.1.camel@laptopd505.fenrus.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1184220147.2720.1.camel@laptopd505.fenrus.org>
Content-Disposition: inline
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
To: Arjan van de Ven <arjan@infradead.org>
Cc: cpufreq@lists.linux.org.uk

Thanks Arjan!

Like you suggested, I ran the Linux-read firmware developer kit on my
machine and below are cpufreq related results.

* Result: FAIL
================================================

[INFO]-2 CPU frequency steps supported

 Frequency | Speed
-----------+---------
  2.38 Ghz | 100.0 %
  2.05 Ghz | 100.0 %

[FAIL]-Supposedly higher frequency is slower on CPU 7!

 Frequency | Speed
-----------+---------
  2.38 Ghz | 100.0 %
  2.05 Ghz | 100.0 %

[PASS]-P-state coordination done by Harware

[FAIL]-Firmware not implementing hardware coordination cleanly. Firmware
using SW_ANY instead?

So the results mean that the hardware coordination isn't implemented
properly and that's why I got this weird behavior when playing with the
acpi-cpufreq module and the userspace governor. However, I actually do not
quite understand the last failure. As explained in the LDFK  documentation,
this failure means "BIOS wrongly doing Sw_ANY P-State coordination across
cpus.  We change frequency on all CPUs to the lowest value, then change
frequency on one particular CPU to the highest. Next, we change the
frequency of all the cpus back to the lowset.  If BIOS is doing Sw_ANY the
core in question will also have a low frequency value instead of staying
high, and you will get this failure.". I thought the one particular CPU
whose frequence is set to the highest should also have a low frequency value
when 'all' cpus are scaled back to the lowest. Or am I missing something?

Thank you!!
Lei

On 7/11/07, Arjan van de Ven <arjan@infradead.org> wrote:
>
> On Wed, 2007-07-11 at 17:37 -0700, Lei Yang wrote:
> > Hi list,
> >
> > I found that on my 8 cpu server, the acpi-cpufreq module doesn't work
> > properly. The CPU is Intel(R) Xeon(R) CPU (E5345  @ 2.33GHz). First of
> all,
> > except for /sys/devices/system/cpu/cpu0/cpufreq, for all other 7 cpus
> the
> > cpufreq dir is just a link to cpu0/cpufreq. When I use the userspace
> > governor and scale down the frequency by editing the scaling_setspeed
> file
> > in cpu0/cpufreq, only cpu0 and cpu4 have their frequencies changed. I
> > verified this with a simple loop test that would report different timing
> > number at different frequencies. Even though the /proc/cpuinfo shows
> that
> > all cpus are running at a lower frequency. Has anyone had the same
> problem
> > before? Is there a fix for this?
>
> note that this can be a bios issue; have you run the linux-ready
> firmware developer kit? (see http://www.linuxfirmwarekit.org)
> the bios is supposed to tell linux which cores share frequency etc etc
> (and in theory the setting is supposed to be per core, and the hardware
> then takes the maximum of these values on whatever granularity the
> hardware has to group things)
>
> if your bios doesn't do this correctly then yes you get funky results...
>
>
> --
> if you want to mail me at work (you don't), use arjan (at) linux.intel.com
> Test the interaction between Linux and your BIOS via
> http://www.linuxfirmwarekit.org
>
>
