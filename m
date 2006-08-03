From: "Hiroshi Miura" <miura@da-cha.org>
Subject: Re: Why supports the speedstep-ich only 2 processor states
Date: Thu, 3 Aug 2006 23:47:12 +0900
Message-ID: <a11ccc30608030747v16bf4f2bs3ca2ff1b09bd5d36@mail.gmail.com>
References: <16060.84.57.16.17.1154612140.squirrel@www.fh-augsburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <16060.84.57.16.17.1154612140.squirrel@www.fh-augsburg.de>
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
To: kay@rz.fh-augsburg.de
Cc: cpufreq@lists.linux.org.uk

Hi,

In early generation of speedstep, only two processor speeds are supported.
And speedstep-ich is based on reverse engineering basis.
It try to find proper register location and value by watching
difference of chipset registers  between AC powered and battery
powered state.
It might tell us -two- states of speedstep.

You may ask why BIOS can set to another frequency. Answer is that
you can set such a low frequency using speedstep _and_ acpi processor
throtlling feature.

The latter is configurable by setting  /proc/acpi/processor/CPU0/throttling

For example, if your acpi bios support 4 throttling state and set LOW
with  speedstep, then freq = 733 x 25% => 184Mhz.

I don't know how BIOS set chips to run such a state but it may help
you to understand what is happened.

Hiroshi

2006/8/3, Thomas Kisler <kay@rz.fh-augsburg.de>:
> Hello everybody,
>
> i'm wondering why the speedstep-ich cpufreq driver only supports two
> processor states in general.
>
> I own an IBM Thinkpad X24 with a 1.13 GHz Mobile Pentium 3m (Tualatin)
> which runs on 1130 MHz and 733 MHz with cpufreq.
>
> But if I select in BIOS the 'fixed slow' option at the customized Power
> Mode _and_ boot a kernel without cpufreq support at all, /proc/cpuinfo
> reports me the cpu running at 191 MHz. Also the acpi reports a lower
> discharging rate of the battery, as if i run at 733 MHz.
>
> So I had a look at the source code of the speedstep-ich driver and noticed
> that there are only a SPEEDSTEP_HIGH and a SPEEDSTEP_LOW frequency in the
> speedstep_freqs struct. Can anybody tell me why?
>
> If there is no specific reason, has anybody information about how the
> available frequencies are calculated. So i can adapt the source code that
> this 3rd power state is available.
>
> Thanks in advance.
>
> Greetings
>
> Thomas Kisler
>
>


-- 
HIroshi Miura
