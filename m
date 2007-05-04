From: "Wander Winkelhorst" <w.winkelhorst@gmail.com>
Subject: Re: cpufreq longhaul locks up
Date: Fri, 4 May 2007 13:36:00 +0200
Message-ID: <5699f8f00705040436u63c5ab38g1054001eccc596e7@mail.gmail.com>
References: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:references;
	b=b9sbdaGDfKyvzSNyn65wnNSIkgdT1SJgN1NBASiE65i5OAiHqg3wMM987hDRXTy4wN9lpiKO1rGj0F1P5hQN7d416y4wO5u5RVyr4nrZQcz8TNOKy9Yq4Jwun0BkYnrpG/85qCt7QYygby1I/oEpv72KmtVvCCKh1kBQv36lp3Y=
In-Reply-To: <Pine.LNX.4.61.0705041200370.18504@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: davej@codemonkey.org.uk, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, cpufreq@lists.linux.org.uk

On 5/4/07, Jan Engelhardt <jengelh@linux01.gwdg.de> wrote:
>
> Hi,
>
>
> I found that setting the cpufreq governor to ondemand making the box
> lock up solid in 2.6.20.2 and 2.6.21 after a few seconds. Sysrq
> does not work anymore, and the last messages are:
>
> May  3 19:16:58 cn kernel: longhaul: VIA C3 'Nehemiah C' [C5P] CPU
> detected.  Powersaver supported.
> May  3 19:16:58 cn kernel: longhaul: Using northbridge support.
> May  3 19:17:22 cn kernel: Time: acpi_pm clocksource has been installed.
> May  3 19:17:22 cn kernel: Clocksource tsc unstable (delta = -136422685
> ns)
>
> I have also tried 2.6.20.2 in single-user mode (so that I can have
> the disk readonly), and it take a little longer (magnitude: minutes)
> to lock up; not sure if it's 20.2 or the single-user mode but I suspect
> the latter since nothing is running then that could potentially
> contribute to quickly changing workloads/frequencies.
>
> If you need more info, please let me know.


Hi,

I also have the same problem. Except in my case the box is stable for a
couple of hours before it locks up hard.
I did some digging around, and from what I found on the internet, it seems
that having busmaster DMA devices causes this problem.

And indeed, if I stop the ondemand governor and use the performance governor
if I record anything with my Hauppauge PVR150 (which is a busmaster DMA
device) and afterwards use the ondemand governor again, the box is more
stable (stable for a couple of days)

I have a VIA SP1300 motherboard, which has a VIA C3 Nehemiah processor @
1333 Mhz
This box has never been stable with any kernel in combination with the
ondemand governor (I've had this box since 2.6.12 or so)
If I use the performance governor, the box is stable (for weeks, months...)

I hope this helps, I'd love to use the ondemand governor and if anyone wants
me to test related patches, please send them.

Wander.
(I'm not subscribed to LKML BTW)
