From: Jonathan Roes <jonathan.roes@gmail.com>
Subject: k8-powernow failing targ
Date: Wed, 30 Mar 2005 00:40:55 -0500
Message-ID: <8e1d9f11050329214076144b01@mail.gmail.com>
References: <84EA05E2CA77634C82730353CBE3A843023ADBFE@SAUSEXMB1.amd.com>
Reply-To: Jonathan Roes <jonathan.roes@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <84EA05E2CA77634C82730353CBE3A843023ADBFE@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hi, I recently emailed Paul Devriendt, as some sources I found upon my
initial googling gave me his email address as a support contact.

The transcript of our conversation follows.  Does anyone have any
advice for me?  I'd be glad to produce the "full debug log" as
instructed, but I'm unsure of how to pursue that avenue of attack.

Thanks,
Jonathan Roes

---------- Forwarded message ----------
From: Devriendt, Paul <paul.devriendt@amd.com>
Date: Tue, 29 Mar 2005 09:50:59 -0600
Subject: RE: k8-powernow failing targ
To: Jonathan Roes <jonathan.roes@gmail.com>


The best place to ask is to post on this newsgroup. The official
support person for this driver reads this mailing list.

Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

The normal cause for this problem is a hardware issue with the VRM
(voltage regulator module) that supplies the processor. However, it
would be necessary to look at a full debug log of the failure to be
more certain.

paul.

> -----Original Message-----
> From: Jonathan Roes [mailto:jonathan.roes@gmail.com]
> Sent: Sunday, March 27, 2005 11:47 PM
> To: Devriendt, Paul
> Subject: k8-powernow failing targ
>
> Hi sir,
>
> I'm sorry to bother you, but I have a (probably quick for you)
> question concerning k8-powernow in Linux kernel 2.6.10.  I've enabled
> the CPU Cool 'n' Quiet setting in my BIOS on my Athlon 64 2800
> processor.  I get the message "k8-powernow: failing targ, change
> pending bit set" approximately 4 or 5 times.  In case the timing
> matters - I normally get the message when setting up X using my
> distribution's console-based X setup routines, and also recently I saw
> it when X just died on me for a little while.  I just bought the
> processor, and haven't used it in Windows for more than a couple of
> hours at a time, and I haven't run the box in straight console mode,
> but would be happy to if you want me to assist in further testing.
>
> I'm not sure if this is a bug in the kernel I'm using, or whether my
> processor has issues (good thing I recently bought it and I have that
> good ol' 3-year retail box warranty :)).
>
> Anyways, hopefully you can help me out.  I wouldn't email you and bug
> you about this because I know you're busy, but the only google search
> result was the source code for k8-powernow support, and I spent a
> couple of days hunting around on IRC for help, including a few kernel
> hacking channels.
>
> Thanks,
> Jonathan Roes
>
>
