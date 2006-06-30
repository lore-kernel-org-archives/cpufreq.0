From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 1/4] minor optimizations to ondemand governor
Date: Fri, 30 Jun 2006 01:08:02 -0400
Message-ID: <20060630050802.GD32729@redhat.com>
References: <20060628134952.B12989@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060628134952.B12989@unix-os.sc.intel.com>
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

On Wed, Jun 28, 2006 at 01:49:52PM -0700, Venkatesh Pallipadi wrote:
 > 
 > ondemand_remove_slowdown_06.patch
 > 
 > Remove slowdown from ondemand sampling path. This reduces the code path length
 > in dbs_check_cpu() by half. slowdown was not used by ondemand by default.
 > If there are any user level tools that were using this tunable, they 
 > may report error now.
 > 
 > Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>
 > Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
 > 
 > Index: linux-2.6.17/drivers/cpufreq/cpufreq_ondemand.c
 > ===================================================================
 > --- linux-2.6.17.orig/drivers/cpufreq/cpufreq_ondemand.c
 > +++ linux-2.6.17/drivers/cpufreq/cpufreq_ondemand.c
 > @@ -5,6 +5,10 @@
 >   *            (C)  2003 Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>.
 >   *                      Jun Nakajima <jun.nakajima@intel.com>
 >   *
 > + *  Jun 2006 - Alexey Starikovskiy <alexey.y.starikovskiy@intel.com>
 > + *             Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
 > + *      - Remove slow down option and reduce the path length dbs_check_cpu
 > + *
 >   * This program is free software; you can redistribute it and/or modify
 >   * it under the terms of the GNU General Public License version 2 as
 >   * published by the Free Software Foundation.

I'll chop out this hunk.  In-file changelogs are deprecated now that we've
got a sensible source control system.

		Dave

-- 
http://www.codemonkey.org.uk
