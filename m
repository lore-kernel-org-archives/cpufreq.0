From: Dave Jones <davej@redhat.com>
Subject: Re: oops on resume
Date: Fri, 6 Aug 2004 23:51:21 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040806225121.GA3136@redhat.com>
References: <1091736171.10552.26.camel@pc> <20040805200857.GA28775@redhat.com>
	<1091737170.10552.32.camel@pc>
	<20040805210916.GB23087@dominikbrodowski.de>
	<1091814215.10552.133.camel@pc>
	<20040806175530.GA16167@dominikbrodowski.de>
	<20040806211347.GB30427@redhat.com> <1091827110.10552.168.camel@pc>
	<20040806214403.GC30427@redhat.com> <1091830228.10552.170.camel@pc>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1091830228.10552.170.camel@pc>
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
Cc: cpufreq@www.linux.org.uk

On Fri, Aug 06, 2004 at 06:10:28PM -0400, Brian J. Murrell wrote:

 > here we are in time_cpufreq_notifier 1
 > calling cpufreq_scale(2162688, 2200000, 2200000)
 > here we are in cpufreq_scale 0, old = 2162688, div = 2200000, mult = 2200000
 > calling do_div(4757913600000, 2200000)
 > here we are in cpufreq_scale 1, returning 2162688
 > calling cpufreq_scale(2193684, 2200000, 2200000)
 > here we are in cpufreq_scale 0, old = 2193684, div = 2200000, mult = 2200000
 > calling do_div(4826104800000, 2200000)
 > here we are in cpufreq_scale 1, returning 2193684
 > here we are in time_cpufreq_notifier 2, cpu_khz = 2193684
 > calling cpufreq_scale(1957878, 2200000, 2200000)
 > here we are in cpufreq_scale 0, old = 1957878, div = 2200000, mult = 2200000
 > calling do_div(4307331600000, 2200000)
 > here we are in cpufreq_scale 1, returning 1957878
 > here we are in time_cpufreq_notifier 3, fast_gettimeoffset_quotient = 1957878
 > here we are in set_cyc2ns_scale 0, cpu_mhz = 2193

Did you get the 3rd cpufreq_scale() call too ? I think that might be
the one thats going awry.

(The one in the fast_gettimeoffset_quotient = .. line)

		Dave
