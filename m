From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 2/2] Add cpufreq driver for Momentum Maple boards
Date: Wed, 29 Jun 2011 12:40:59 +0400
Message-ID: <BANLkTimJD3U1kRkDKVomGVriykwqLBQasA@mail.gmail.com>
References: <1308316207-9075-1-git-send-email-dbaryshkov@gmail.com>
	<1308316207-9075-2-git-send-email-dbaryshkov@gmail.com>
	<1309318110.32158.520.camel@pasglop>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=k6936LE1asWa1DCZWU+3591zuKYVt0Yp3nhUQTsrY/M=;
        b=q0syJQvvsN7EWGbhlyl69pWU3dIFWAyJBA5JtXYIqliCMxlvcfXy+I4aiXnMIymSk3
         mgn16COFl56ticS7edzbJbDmt5jc+c+lF8UiT3YoHGAuU0YTgb865Yu3MFRZNKJCzE9D
         bo+M1HBHVbpnUOc/4fOiD4u9UDEgXxwzpA28w=
In-Reply-To: <1309318110.32158.520.camel@pasglop>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Dave Jones <davej@redhat.com>, linuxppc-dev@lists.ozlabs.org, cpufreq@vger.kernel.org, Paul Mackerras <paulus@samba.org>

On 6/29/11, Benjamin Herrenschmidt <benh@kernel.crashing.org> wrote:
> Before I comment on this last one, a quick Q. for Dave: Do you want to
> handle this or should I merge it via powerpc.git ? (It depends on
> another change to the arch code to expose the SCOM functions that it
> uses, and that patch is going to be in my -next branch).
>
> Now some remaining small nits:
>
> On Fri, 2011-06-17 at 17:10 +0400, Dmitry Eremin-Solenikov wrote:
>> Add simple cpufreq driver for Maple-based boards (ppc970fx evaluation
>> kit and others). Driver is based on a cpufreq driver for 64-bit powermac
>> boxes with all pmac-dependant features removed and simple cleanup
>> applied.
>>
>> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>> ---
>>  drivers/cpufreq/Kconfig         |    5 +
>>  drivers/cpufreq/Kconfig.powerpc |    7 +
>>  drivers/cpufreq/Makefile        |    5 +
>>  drivers/cpufreq/maple-cpufreq.c |  314
>> +++++++++++++++++++++++++++++++++++++++
>
> If we're going to have a Kconfig.powerpc, should we maybe just have a
> powerpc subdirectory instead with the driver in it ?
>
> I'm happy at some later point to try moving some of my other ones there.

As Dave also isn't sure about subdirs, should I create cpufreq/powerpc
directory,
or not?

>
>  .../...
>
>> +	/* Look for the powertune data in the device-tree */
>> +	maple_pmode_data = of_get_property(cpunode, "power-mode-data", &psize);
>> +	if (!maple_pmode_data) {
>> +		DBG("No power-mode-data !\n");
>> +		goto bail_noprops;
>> +	}
>> +	maple_pmode_max = psize / sizeof(u32) - 1;
>
> Do you get that property in your device-tree ? Or have you modified your
> firmware ? If that requires a modified firmware, you should probably put
> at least a link indicating where to get it somewhere and display a nicer
> error code.

PIBS firmware (used on PPC970FX devkit/original Maple-D board) generates
this property, if the board is started with dual CPUs (it can also be started
with only one CPU selected). On the other hand SLOF firmware (used
on JS2x blade servers) doesn't generate this property. It can be adapted
however to generate it.

> Also this driver is specific to the Maple HW, you don't want it to kick
> in and mess around on ... an Apple G5 for example. So stick somewhere a
>
> 	if (!machine_is(maple))
> 		return 0;
>
>> +	printk(KERN_INFO "Registering G5 CPU frequency driver\n");
>
> s/G5/Maple

Hmmm. I'm actually thinking about doing it the other way: as this driver
is mostly c&p of PowerMac G5 driver, as we are moving those from
arch/powerpc to drivers/cpufreq, maybe I should merge two drivers (this
one with cpufreq_64 from powermac)?

>> +	printk(KERN_INFO "Frequency method: SCOM, Voltage method: none\n");
>
> This is useless.

Leftover from powermac thing.

-- 
With best wishes
Dmitry
