From: lucke <lucke@o2.pl>
Subject: Re: cpufreq and suspend
Date: Wed, 20 Sep 2006 23:09:13 +0200
Message-ID: <200609202309.13897.lucke@o2.pl>
References: <1449F58C868D8D4E9C72945771150BDF15364F@SAUSEXMB1.amd.com>
Reply-To: lucke@o2.pl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <1449F58C868D8D4E9C72945771150BDF15364F@SAUSEXMB1.amd.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

On Wednesday 20 September 2006 20:53, you wrote:
> > >>http://lists.suspend2.net/lurker/message/20060827.234345.486
> >
> > 617dc.en.html
> >
> > >> Forgive me if this issue has been already mentioned, I can't
> > >> seem to find a way to search through archives.
> > >
> > >I'll go take a look at this.
> >
> > Is there any hope for a solution to this problem, Mark et al?
>
> It's been a busy week, and I just secured the system necessary to
> do the testing.
>
> Currently, I cannot reproduce with OpenSUSE 10.1 and the powersave
> tool.  The system goes into S3 and comes out fine.  Both cores are
> available and seem to be switching.
>
> I'll set up suspend2 this afternoon and try again.

Well, S3 doesn't work for me (doesn't want to wake up), thus I can't check how 
cpufreq behaves with it. The problem occurs with suspend to disk (just 
checked, not only with suspend2, but also with swsusp/powersave) - quite 
logically it's where the problem could occur, as it has to go through BIOS 
and kernel initialization phases again (I suppose suspend to RAM doesn't go 
through that). I should've mentioned it earlier.

For completeness, MB is Asus A8N-E with latest BIOS.

I wish you a fruitful hunting,

Luke
