From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 4/4] minor optimizations to ondemand governor
Date: Fri, 30 Jun 2006 01:47:01 -0400
Message-ID: <20060630054701.GG32729@redhat.com>
References: <20060628135217.E12989@unix-os.sc.intel.com>
	<20060630053753.GE32729@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060630053753.GE32729@redhat.com>
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
To: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Cc: alexey.y.starikovskiy@intel.com, cpufreq <cpufreq@www.linux.org.uk>, Len Brown <lenb@unix-os.sc.intel.com>

On Fri, Jun 30, 2006 at 01:37:53AM -0400, Dave Jones wrote:

 > This gave me rejects against Linus tree for some reason.
 > It's wrong anyway, as this file uses mutex's, and I'd rather
 > not have to rely on us pulling in mutex.h indirectly through
 > some other include file chain.
 > 
 > I fixed it up by hand.

One downside of this patch btw, is that it now increases the
delta between ondemand and conservative a little, which makes
applying the same patch to both a bit more painful.

Care to do a resync sometime ?

Longer term, I'd really like to see conservative & ondemand
sharing more code as a separate helper .o file. They're similar
in so many ways, it seems silly to duplicate so much code.

		Dave

-- 
http://www.codemonkey.org.uk
