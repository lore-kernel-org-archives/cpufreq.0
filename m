From: "Ariel Norberto Bellino" <Ariel@bellino.com.ar>
Subject: Re: Possible bug
Date: Wed, 25 Jul 2012 01:23:15 -0300
Message-ID: <WC20120725042315.880035@bellino.com.ar>
References: <WC20120721070908.150028@bellino.com.ar> <201207241401.54084.trenn@suse.de> <20120724120742.GA3293@marx.bitnet>
Reply-To: Ariel@bellino.com.ar
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20120724120742.GA3293@marx.bitnet>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

-----Original Message-----
From: Jukka Ruohonen <jruohonen@iki.fi>
> On Tue, Jul 24, 2012 at 02:01:53PM +0200, Thomas Renninger wrote:
> > For some reason some BIOSes export the highest frequency twice (or
> with
> > one HZ difference or similar).
> 
> I think this is because of the so-called Turbo Boost. I recall at least
> couple of Intel specifications or white papers in which it was adviced
> that
> BIOS vendors should report the "turbo state" as the maximum + 1 MHz.
> 
> - Jukka.

I found that, effectively, the speeds are reported with a difference of 1 MHz:
$ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies 
2534000 2533000 1600000 800000 

But Turbo Boost technology is not present in my new processor:
http://ark.intel.com/products/35562/Intel-Core2-Duo-Processor-T9400-%286M-Cache-2_53-GHz-1066-MHz-FSB

In fact, as far as I know, no processor supported by this motherboard has it:
http://www.intel.com/es_la/assets/PDF/datasheet/320122.pdf

BIOS issue? The laptop is a Sony Vaio VGN-SR210J, BIOS R1130Y1 (latest to
this day).


