From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] cpufreq support for 7447A on 2004 iBooks
Date: Thu, 10 Jun 2004 11:12:07 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1086883926.2977.145.camel@gaston>
References: <200406051846.50718.toojays@toojays.net>
	<1086452473.12664.36.camel@gaston>
	<200406102105.27654.toojays@toojays.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <200406102105.27654.toojays@toojays.net>
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
To: John Steele Scott <toojays@toojays.net>
Cc: linuxppc-dev list <linuxppc-dev@lists.linuxppc.org>, Christiaan Welvaart <cjw@daneel.dyndns.org>, cpufreq@www.linux.org.uk


> I have made a new patch for this, available from:
> http://www.toojays.net/~toojays/misc/7447a_cpufreq_20040610.patch

Looks good except for some coding style issues ;)

Use spaces between } and else for example, there's also an if without a 
space before the ( and please, name the low level asm function low_* like
the other ones, for consistency.

Ben.
