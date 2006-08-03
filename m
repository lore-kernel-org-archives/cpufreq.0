From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: Re: Pentium D 915 support
Date: Thu, 03 Aug 2006 19:29:42 +0400
Message-ID: <44D21666.5030304@linux.intel.com>
References: <1154265136.21063.10.camel@skylla.slagter.name>	<44CCD154.3080606@linux.intel.com>	<1154275129.21063.31.camel@skylla.slagter.name>	<1154605493.4302.494.camel@queen.suse.de>	<1154605725.14206.22.camel@localhost>
	<1154617009.4302.515.camel@queen.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <1154617009.4302.515.camel@queen.suse.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: trenn@suse.de
Cc: cpufreq@lists.linux.org.uk

Thomas, please stop misinforming...
Thomas Renninger wrote:
> On Thu, 2006-08-03 at 13:48 +0200, Erik Slagter wrote:
>> On do, 2006-08-03 at 13:44 +0200, Thomas Renninger wrote:
>>>> Please note the amount of repeated same frequency.
>>> I already saw something similar.
>>> This is BIOS information, they probably want to take care that no
>>> performance is lost and define 9 high and one low step.
>> What do you mean?
> available frequency steps: 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80
> GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.40 GHz
> 
> They define 9 2.8 GHz frequency steps and one 2.4 GHz.
> That means if OS is going down with speed step by step it will take a
> while until you reach 2.4 GHz.
Algorithm does not care about same P-steps. It will get to 2.4 in one step.
> This could be intended (avoid possible performance losses), but also
> just be a BIOS bug.
This is not BIOS bug, it is just a way to avoid dynamic memory allocation in BIOS.
And it has nothing to do with performance losses due to note above.

>>>> Last but not least: the loading or unloading of the module doesn't have
>>>> any effect on the actual power consumption, even with powersave governor
>>>> and both cores at 2.4 Ghz (both at 140 W).
>>> Strange. 2.4 GHz is still a lot?
>>>
>>> Have you already searched for a new BIOS, if not better do that first.
>> The only difference between my BIOS version and the one available for
>> download is the support for "new cpu's" according to the ASUS website.
> No idea whether it helps, but I would give it a try.

> 
> Maybe you find some specs on the Intel site what speed steps should be
> supported and how many power/temperature gain you can get. 2.4 GHz
> doesn't sound like you save a lot of energy...
Lowest frequency for P4 is 2.8 Ghz (14xFSB), PD is 2.4 (12xFSB), Core is 6x, but FSB is much higher.

Regards,
	Alex.
