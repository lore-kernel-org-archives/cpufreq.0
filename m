From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: my dothan didn't work with cpufreq...
Date: Mon, 02 Aug 2004 13:17:53 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1091477873.18905.1.camel@localhost>
References: <40F2FA8B.10307@lifl.fr>
	<20040713094937.GB8124@dominikbrodowski.de>
	<1090461320.13505.3.camel@localhost>
	<20040722060437.GA8888@dominikbrodowski.de>
	<1090479407.4351.6.camel@localhost>
	<20040722093126.GA8418@dominikbrodowski.de>
	<1090517665.5267.9.camel@ixodes.goop.org>
	<20040723193859.GC8441@dominikbrodowski.de>
	<1090632444.2950.1.camel@localhost> <20040802192608.GA17023@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040802192608.GA17023@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: Dominik Brodowski <linux@dominikbrodowski.de>, cpufreq list <cpufreq@www.linux.org.uk>

On Mon, 2004-08-02 at 20:26 +0100, Dave Jones wrote:
> I merged this, but something occurred to me whilst eyeballing
> the diffs.  Rather than duplicating X86_VENDOR_INTEL in every
> entry of the struct, how about we check it in one place?
> 
> I'm unaware of any vendor planning to duplicate speedstep,
> but even if AMD/VIA threw away their current implementations
> in favour of a bit-for-bit compatible implementation, it
> wouldn't be hard to add an extra if()

I had the same thought.  I already added the vendor check at the top of
the init function, so in theory nothing else should need to look at it.

So, we can just drop the vendor entries in those tables without having
to do anything else.

	J
