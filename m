From: Andi Kleen <ak@suse.de>
Subject: Re: [PATCH] CPU frequency display in /proc/cpuinfo
Date: Sun, 4 Dec 2005 19:32:39 +0100
Message-ID: <20051204183239.GE14247@wotan.suse.de>
References: <20051202181927.GD9766@wotan.suse.de>
	<20051202104320.A5234@unix-os.sc.intel.com>
	<20051204164335.GB32492@isilmar.linta.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20051204164335.GB32492@isilmar.linta.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, Andi Kleen <ak@suse.de>, Andrew Morton <akpm@osdl.org>, Dave Jones <davej@redhat.com>, cpufreq <cpufreq@www.linux.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>

On Sun, Dec 04, 2005 at 05:43:35PM +0100, Dominik Brodowski wrote:
> On Fri, Dec 02, 2005 at 10:43:20AM -0800, Venkatesh Pallipadi wrote:
> > The patch below changes this to:
> > Show the last known frequency of the particular CPU, when cpufreq is present. If
> > cpu doesnot support changing of frequency through cpufreq, then boot frequency 
> > will be shown. The patch affects i386, x86_64 and ia64 architectures.
> 
> Looks good to me -- however, might this affect userspace cpufreq tools? I'd

They normally use /sys anyways.

> vote for quite some time in -mm for this patch (i.e. only merge for 2.6.17)

Actually it just changes behaviour back to older kernels (~2.6.10 or earlier) 
which always behaved like this.  So it should be safe.

-Andi
