From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] If a CPU gets onlined set the governor to the one
	thatis run on other CPUs
Date: Mon, 27 Nov 2006 17:10:35 -0500
Message-ID: <20061127221035.GI25763@redhat.com>
References: <EB12A50964762B4D8111D55B764A8454EBD5D7@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <EB12A50964762B4D8111D55B764A8454EBD5D7@scsmsx413.amr.corp.intel.com>
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
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk, Stefan Seyfried <seife@suse.de>, "Nakajima,
	Jun" <jun.nakajima@intel.com>

On Mon, Nov 27, 2006 at 01:49:20PM -0800, Pallipadi, Venkatesh wrote:

 > Only usage model I can think of, where having per cpu governor is
 > helpful
 > is with virtualization.
 > Say Xen DOM 0 kernel does all the cpufreq enabling and each of the other
 > guests
 > asks for different governor, then DOM 0 can use per CPU governor and run
 > the guests with different governor requests.
 > 
 > Jun, who is looking at Power Management in Xen context, may have more
 > some
 > more thoughts on that.

I put a little thought into this (but not too much) a while ago.
The proposal I came up with involved the guests not having governors at all.
For all intents, from the guests POV, they're running 'performance'
all the time.

Meanwhile, something like ondemand in DOM 0 would do the actual decision
making, based on the activity (or lack of) in each guest.  Basically instead
of ondemand looking at per-processor loadavg's, it'd need to take the loadavg
of the (potentially multiple) guests running on that CPU.

Having the guests able to control the governors could get messy when you
take multi-core CPUs into consideration and two guests running on pair of siblings
request different governors.   Put the decision making into DOM0, and this problem
just goes away.

Comments?

		Dave

-- 
http://www.codemonkey.org.uk
