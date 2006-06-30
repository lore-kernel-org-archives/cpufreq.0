From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 0/4] minor optimizations to ondemand governor
Date: Fri, 30 Jun 2006 01:06:33 -0400
Message-ID: <20060630050633.GC32729@redhat.com>
References: <20060628134827.A12989@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060628134827.A12989@unix-os.sc.intel.com>
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

On Wed, Jun 28, 2006 at 01:48:27PM -0700, Venkatesh Pallipadi wrote:
 > 
 > Patch series with optimizations to ondemand governor and some coding-style
 > cleanups.
 > 
 > [PATCH 1/4] minor optimizations to ondemand governor
 > ondemand_remove_slowdown_06.patch
 > Removes the slowdown option from ondemand governor. This simplifies code in
 > periodic sampling a lot and reduces the path length in dbs_check_cpu 
 > by half.
 > 
 > [PATCH 2/4] minor optimizations to ondemand governor
 > queue_delayed_work_on_02.patch
 > Add a new interface to workqueue to enable scheduling work on a particular CPU.
 > 
 > [PATCH 3/4] minor optimizations to ondemand governor
 > ondemand_percpu_06.patch
 > Use queue_delayed_work_on interface to make ondemand sampling percpu. This also
 > removes the mutex in sampling path.
 > 
 > [PATCH 4/4] minor optimizations to ondemand governor
 > ondemand_misc_cleanups_06.patch
 > Misc. cleanups to ondemand from coding-style perspective.

Minor annoyance: Give the Subject: lines some more context,
as git uses them for short-log generation, and

[CPUFREQ] Remove the slowdown option from ondemand governor
[CPUFREQ] Add a new interface to workqueue to enable scheduling work on a particular CPU.

looks a bit more informative than

[CPUFREQ] [1/4] minor optimizations to ondemand governor
[CPUFREQ] [2/4] minor optimizations to ondemand governor
etc...

(I'll fix these up this time around, as they don't look like
 they'll need much more work, and I need to make some minor edits anyway)

Other minor review comments follow:

		Dave

-- 
http://www.codemonkey.org.uk
