From: Dave Jones <davej@redhat.com>
Subject: Re: oops on resume
Date: Fri, 6 Aug 2004 22:44:03 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040806214403.GC30427@redhat.com>
References: <1091734482.10552.20.camel@pc> <20040805195248.GA32045@redhat.com>
	<1091736171.10552.26.camel@pc> <20040805200857.GA28775@redhat.com>
	<1091737170.10552.32.camel@pc>
	<20040805210916.GB23087@dominikbrodowski.de>
	<1091814215.10552.133.camel@pc>
	<20040806175530.GA16167@dominikbrodowski.de>
	<20040806211347.GB30427@redhat.com> <1091827110.10552.168.camel@pc>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1091827110.10552.168.camel@pc>
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

On Fri, Aug 06, 2004 at 05:18:29PM -0400, Brian J. Murrell wrote:
 > On Fri, 2004-08-06 at 22:13 +0100, Dave Jones wrote:
 > > Why on _earth_ would that divide by zero ?!
 > 
 > You got me.  :-)
 > 
 > > I'd like to see an objdump -D output of that function.
 > 
 > How do I do that?

no worries because..

 > > What compiler was used?
 > Whatever is on rawhide at the moment... 

I have that locally.

Can you add some debug printk's just before the cpufreq_scale() calls
in time_cpufreq_notifier ?  I'd like to know what's being passed there.
Might be worth a printk actually _in_ cpufreq_scale() too, to make
sure the args are getting through ok.

		Dave
