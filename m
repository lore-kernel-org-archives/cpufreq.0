From: Andi Kleen <ak@suse.de>
Subject: Re: [PATCH] CPU frequency display in /proc/cpuinfo
Date: Sun, 4 Dec 2005 21:13:42 +0100
Message-ID: <20051204201342.GF14247@wotan.suse.de>
References: <20051202181927.GD9766@wotan.suse.de>
	<20051202104320.A5234@unix-os.sc.intel.com>
	<20051204164335.GB32492@isilmar.linta.de>
	<20051204183239.GE14247@wotan.suse.de>
	<1133725767.19768.12.camel@mindpipe>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1133725767.19768.12.camel@mindpipe>
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
To: Lee Revell <rlrevell@joe-job.com>
Cc: Andrew Morton <akpm@osdl.org>, Andi Kleen <ak@suse.de>, linux-kernel <linux-kernel@vger.kernel.org>, cpufreq <cpufreq@www.linux.org.uk>, Dave Jones <davej@redhat.com>

On Sun, Dec 04, 2005 at 02:49:26PM -0500, Lee Revell wrote:
> On Sun, 2005-12-04 at 19:32 +0100, Andi Kleen wrote:
> > On Sun, Dec 04, 2005 at 05:43:35PM +0100, Dominik Brodowski wrote:
> > > On Fri, Dec 02, 2005 at 10:43:20AM -0800, Venkatesh Pallipadi wrote:
> > > > The patch below changes this to:
> > > > Show the last known frequency of the particular CPU, when cpufreq is present. If
> > > > cpu doesnot support changing of frequency through cpufreq, then boot frequency 
> > > > will be shown. The patch affects i386, x86_64 and ia64 architectures.
> > > 
> > > Looks good to me -- however, might this affect userspace cpufreq tools? I'd
> > 
> > They normally use /sys anyways.
> 
> Wrong, lots of userspace programs that need to know the CPU speed get it
> from /proc/cpuinfo.  It would be nice if there were a better API.

Talking about user space governours - I presume that is what 
Dominik ment with "userspace cpufreq tools"

> As long as you don't change the file format it should be OK.

Great that we have your approval.

-Andi
