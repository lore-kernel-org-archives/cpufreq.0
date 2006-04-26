From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Few questions
Date: Wed, 26 Apr 2006 10:32:56 +0200
Message-ID: <20060426083256.GB29984@isilmar.linta.de>
References: <b6cb966c0604260104o3ff71374o6e676668b9956fc8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <b6cb966c0604260104o3ff71374o6e676668b9956fc8@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: Miroslav Vasic <miroslav.vasic@gmail.com>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Wed, Apr 26, 2006 at 10:04:57AM +0200, Miroslav Vasic wrote:
>  1. In the document user-guide.txt, the second paragraph
> "Policy"/"Governor"?, is discussed about solutions about frequency changing.
> Later, in other txt files (Governors.txt, core.txt...) I saw that there
> is relation between the Governor for my board and the Policy. Furthermore,
>  cpufreq_driver is mentioned. I do not understand hierarchy of
> these components. As much as I understand now, cpufreq_driver is some kind
> of  interface to change CPU clock, Governor is the part which makes decison
> when to change clock, and Policy is part where I need to define min and
> max frequency, right?

Almost... the cpufreq_driver is the hardware driver which follows up on a
request to "set this CPU to somewhere near this frequency". It "talks to the
hardware".

	cpufreq_driver ----> HARDWARE

The governor decides which speed to request. It may do so based upon
userspace feedback, it may always select the highest available frequency, the
lowest one, or it may do so based on "system load" (kstat) as the "ondemand"
or "conservative" governors do.

	governor ----> cpufreq_driver -----> HARDWARE

A "policy" consists of three values: the minimum frequency which is allowed
at the moment, the maximum frequency which is allowed at the moment, and
what governor shall make the decision on what frequency to select.

	policy ----> governor ----> cpufreq_driver -----> HARDWARE

>  2. I was trying to understand what was done in the cpufreq.c but I
> couldn't. I have lot of doubts how to make a Governor for my system. Do you
> have any example where I can see that?

cpufreq.c is sort of the "glue" between all these parts of the cpufreq
subsystem. Regarding a "governor": what do you want to do specifically?
Might one of the existing ones (esp. ondemand or conservative) be good
enough for these purposes? Also, might you want to prefer an userspace-based
approach.

>  3. I have tried to control clock with a present interface, from the
> userspace, changing the values in some files
> (scaling_setspeed, scaling_min/max_frequency). With command cpufreq-info I
> saw that it was possible to do this, but I am afraid that this command only
> reads values from these files, and that values were not change. Can you
> confirm me this?

Yes, exactly. cpufreq-info is for determining information, cpufreq-set is
for setting it. For userspace-based switching of frequency, you should use
the "userspace" governor and "scaling_setspeed". Preferrably, you should use
the libcpufreq library provided for by the cpufrequtils package.

>  4. If I can change clock values through the file scaling_setspeed, then
> I need to make a periodic task which will make decision when and how to
> change clock values, right? There is no need to write new cpufreq_driver,
> Governer or whatever else, isn't it?

If this is what you want to do, you need to
- assert that there is a working cpufreq_driver for your platform (I'm no
  expert in this field on the ARM platform, but if cpufreq-info gives you
  sensible output, it is likely that this driver is provided for.)
- set the policy to some min and max value and the "userspace" governor
- use an userspace daemon:
	- either one which is already implemented (there are tons of them
	  available, some of them broken, some of them not)
	- or write your custom one
  depending on your specific requirements.

>  5. If the clock changes are possible through scaling_setspeed file, how
> long does it take to change it? I mean, does it change immediately or it
> takes time that some periodic process first read new value, and then to
> change clock speed?

Once the write into scaling_setspeed is finalized, the kernel immediately
starts to initiate a clock change. However, due to notifiers which may sleep
(IIRC) or hardware constraints the actual clock change might take some time.
If you need really fast decision-making with regard to CPU frequency scaling,
you should not cross the userspace<->kernel space but make this decision in
kernelspace.

I hope this helped, if not, or if you need more information, just ask :)

	Dominik
