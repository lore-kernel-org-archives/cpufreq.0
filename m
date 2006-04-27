From: "Miroslav Vasic" <miroslav.vasic@gmail.com>
Subject: Re: Few questions
Date: Thu, 27 Apr 2006 11:16:03 +0200
Message-ID: <b6cb966c0604270216v119ba7e7jce526d2aefe472a3@mail.gmail.com>
References: <b6cb966c0604260104o3ff71374o6e676668b9956fc8@mail.gmail.com>
	<20060426083256.GB29984@isilmar.linta.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060426083256.GB29984@isilmar.linta.de>
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
Content-Type: text/plain; charset="us-ascii"
To: Miroslav Vasic <miroslav.vasic@gmail.com>, cpufreq@lists.linux.org.uk

Thanks for the reply, but I have just one more question (I believe :)) )

>  2. I was trying to understand what was done in the cpufreq.c but I
> > couldn't. I have lot of doubts how to make a Governor for my system. Do
> you
> > have any example where I can see that?
>
> cpufreq.c is sort of the "glue" between all these parts of the cpufreq
> subsystem. Regarding a "governor": what do you want to do specifically?
> Might one of the existing ones (esp. ondemand or conservative) be good
> enough for these purposes? Also, might you want to prefer an
> userspace-based
> approach.


 I would like to see one of those existing governors in order to use them a=
s
my starting point. As I said before, my main concern is a power supply for
this CPU, but still, I need to make something to change the frequency, too.
So, if anyone can send me one of those governors, with corresponding policy
and driver or whatever else, it would be great. As I understood from
previous mail, "ondemand" governor changes frequency depending on the
statistics of the system load. Does it mean that it uses Performance
Monitoring registers of XScale?

Once the write into scaling_setspeed is finalized, the kernel immediately
> starts to initiate a clock change. However, due to notifiers which may
> sleep
> (IIRC) or hardware constraints the actual clock change might take some
> time.
> If you need really fast decision-making with regard to CPU frequency
> scaling,
> you should not cross the userspace<->kernel space but make this decision
> in
> kernelspace.


I plan to make first tests with application which will change frequency
through the scaling_setspeed file, but later I would like to make that
decision in kernelspace, if I manage to understand how to make governor I
need :))

I hope this helped, if not, or if you need more information, just ask :)
>

As you can see I don't hesitate to ask, don't worry :)

Thank you very much, once again.

Miroslav
