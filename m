From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] CPU frequency display in /proc/cpuinfo
Date: Mon, 5 Dec 2005 12:26:51 -0500
Message-ID: <20051205172651.GC12664@redhat.com>
References: <20051202181927.GD9766@wotan.suse.de>
	<20051202104320.A5234@unix-os.sc.intel.com>
	<20051204164335.GB32492@isilmar.linta.de>
	<20051204183239.GE14247@wotan.suse.de>
	<1133725767.19768.12.camel@mindpipe>
	<20051205011611.GA12664@redhat.com> <439463C4.7040905@rtr.ca>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <439463C4.7040905@rtr.ca>
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
To: Mark Lord <lkml@rtr.ca>
Cc: Andrew Morton <akpm@osdl.org>, Andi Kleen <ak@suse.de>, linux-kernel <linux-kernel@vger.kernel.org>, Lee Revell <rlrevell@joe-job.com>, cpufreq <cpufreq@www.linux.org.uk>

On Mon, Dec 05, 2005 at 10:59:00AM -0500, Mark Lord wrote:
 > >I can't think of a single valid reason why a program would want
                                                 ^^^^^^^
 > >to know the MHz rating of a CPU.
 > 
 > Humans like to know what their machines are doing.

humans != programs

 > Simple as that:  it's for the end-users, and the place they look
 > for it is always /proc/cpuinfo (since that works on every platform
 > and on kernels prior to the 2.[56].* series.

Sure, 'cat' is the only reason its there at all.

 > Not useful as an accurate number for any programming algorithms,
 > but it is used to satisfy human curiosity.  A lot.

I think we're in agreement, aren't we? :)

		Dave
