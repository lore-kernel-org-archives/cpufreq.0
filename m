From: Dave Jones <davej@redhat.com>
Subject: Re: oops on resume
Date: Thu, 5 Aug 2004 21:29:41 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040805202941.GB28775@redhat.com>
References: <pan.2004.08.05.19.00.33.11957@interlinx.bc.ca>
	<20040805192613.GA9008@dominikbrodowski.de>
	<1091734482.10552.20.camel@pc> <20040805195248.GA32045@redhat.com>
	<1091736171.10552.26.camel@pc> <20040805200857.GA28775@redhat.com>
	<1091737170.10552.32.camel@pc>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1091737170.10552.32.camel@pc>
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
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Cc: Dominik Brodowski <linux@dominikbrodowski.de>, cpufreq@www.linux.org.uk

On Thu, Aug 05, 2004 at 04:19:30PM -0400, Brian J. Murrell wrote:

 > Yeah, me too.  Any (one have any) idea how to calculate fsb for that
 > sucker?

Hunting for docs on developer.intel.com right now. So far I've turned
up nothing useful. Can you edit pentium4_get_frequency() in arch/i386/kernel/cpu/cpufreq/speedstep-lib.c
so that before the switch (fsb_code) {   add a
		printk ("FSB code = %d\n", fsb_code);

Hopefully, Intel are predictable and this is going to be '4'.

 > I may as well throw that code in there too to see if it
 > alleviates the problem.

reminds me, moving speedstep's dprintk over to the same style
as longhaul/powernow-k7 should happen sometime, then it's just a
module parameter away instead of a recompile.

		Dave
