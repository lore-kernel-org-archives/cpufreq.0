From: Dave Jones <davej@redhat.com>
Subject: Re: ondemand excessive wakeups.
Date: Mon, 12 Mar 2007 15:12:27 -0400
Message-ID: <20070312191227.GA21835@redhat.com>
References: <20070312190240.GA19796@redhat.com>
	<653FFBB4508B9042B5D43DC9E18836F5170C6A@scsmsx415.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <653FFBB4508B9042B5D43DC9E18836F5170C6A@scsmsx415.amr.corp.intel.com>
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
Cc: cpufreq@lists.linux.org.uk

On Mon, Mar 12, 2007 at 12:09:29PM -0700, Pallipadi, Venkatesh wrote:

 > Yes. I had previously sent a patch to eliminate this needless ondemand
 > polling
 > when system is idle.
 > http://lkml.org/lkml/2006/11/21/300

Ahh, I had completely forgotten about that thread.

 > But, bunch of other changes in workqueue infrastructure made this patch
 > invalid.
 > I will rework this one over latest base soon.

Cool, looking forward to it :)

	Dave

-- 
http://www.codemonkey.org.uk
