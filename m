From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] cpufreq_ondemand
Date: Mon, 18 Oct 2004 09:27:59 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041018072759.GB17164@dominikbrodowski.de>
References: <20041017222916.GA30841@inskipp.digriz.org.uk>
	<4172F625.9080709@inbox.ru>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <4172F625.9080709@inbox.ru>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nebojsa Trpkovic <trx@inbox.ru>
Cc: cpufreq@www.linux.org.uk

On Mon, Oct 18, 2004 at 12:45:57AM +0200, Nebojsa Trpkovic wrote:
> Alexander Clouter wrote:
> 
> >Hi all,
> >
> >After playing with the cpufreq_ondemand governor (many thanks to those 
> >whom made it) I made a number of alterations which suit me at least.  
> >Really looking for feedback and of course once people have fixed any bugs 
> >they find and made the code look neater, possible inclusion?
> >
> I'm newby here:
> Will this replace cpudyn, powernowd and other userspace company?

That's a tough question:

there are various methods which can be used for dynamic frequency scaling.
One approach is to do this in kernel-space (which Linus preferres), or to do
it in user-space (which some academics involved in cpufreq prefer). So, the
current Linux cpufreq implementation offers both:

In-kernel "governors" can do dynamic frequency scaling. The ondemand
governor is the first such dynamic governor merged into the Linux kernel;
others have been suggested on the cpufreq mailing list but did have some
severe issues and haven't been merged yet because of these problems.

The "userspace" governor offers a way for userspace programs (or users) to
set the CPU frequency more or less directly. This means userspace tools can
do dynamic frequency scaling as well, and so do the tools you mentioned in
your mail.

So, cpudyn/powernowd on the one side and ondemand/other dynamic governors on
the other side can continue to fulfil their tasks, you can use whatever
_you_ prefer, but you can't/shouldn't use both at once, though. 

	Dominik
