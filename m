From: =?iso-8859-2?q?Micha=B3_Pytasz?= <pytasz@lodz.home.pl>
Subject: Re: Centrino duo - frequency not switching with cpufrqd nor
	ondemand govenor
Date: Tue, 6 Feb 2007 18:20:55 +0100
Message-ID: <200702061820.56209.pytasz@lodz.home.pl>
References: <20061118110642.GA10713@feivel.credativ.de>
	<200702061445.22913.pytasz@lodz.home.pl>
	<3d7cf86d0702060914l46b56546w28d54790c4ea8111@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <3d7cf86d0702060914l46b56546w28d54790c4ea8111@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@lists.linux.org.uk

Tuesday 06 of February 2007 18:14:09 napisa=B3e=B6(-=B3a=B6):
> Hi Michal,
>
> On 2/6/07, Micha=B3 Pytasz <pytasz@lodz.home.pl> wrote:
> > Hi,
> >
> > I have a centrino-duo based tablet (Siemens Lifebook T4210).
> > /proc/cpuinfo says:
>
> [...]
>
> > The root of a problem (at least at least in my opinion) might be
> > thecontent of scaling_min_freq reported as 1667000, the same as scaling
> > max_freq, although scaling_available_frequencies has 3 levels:
> > 1667000 1333000 1000000
> >
> > How do I make it work (scale frequency), I have no experience with inte=
l,
> > previously I used amd (and powernow).
>
> Can you manually change the value of scaling_min_freq to 1000000?
> (echo 1000000 > scaling_min_freq)
>
> I have the exact same processor as you (on a Thinkpad T60, in my case)
> and the scaling works fine.
>
> Cheers,
> Guilherme


Yes I can, thanks, interesting part is that after restart it somehow=20
remembered the value and now does work well :)

Thanks and best regards,
Micha=B3
