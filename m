From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH][DOCUMENTATION BUGFIX] latency in micro-, not nanoseconds
Date: Mon, 10 Nov 2003 16:32:09 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031110163209.GP10144@redhat.com>
References: <20031104160816.GA9187@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031104160816.GA9187@brodo.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@www.linux.org.uk

On Tue, Nov 04, 2003 at 05:08:16PM +0100, Dominik Brodowski wrote:
 > All drivers [davej, can you please verify for powernow-k7?] set the 
 > transition_latency time in microseconds, even though the core demanded
 > nanoseconds. Instead of fixing up the drivers, fix up the core...

Hmm, I think you've unearthed a bug.

The 'latency' we read from the BIOS is in microseconds, but the hardware
wants it in units of 10ns. We do the necessary maths, and everything is fine.
But we're also storing that result in ..

	policy->cpuinfo.transition_latency = latency;

Which is possibly not the right thing to be doing.
I think we want to be storing the 'pre 10ns munging' value here correct?

		Dave
