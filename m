From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] CPU frequency display in /proc/cpuinfo
Date: Mon, 5 Dec 2005 12:27:54 -0500
Message-ID: <20051205172754.GD12664@redhat.com>
References: <20051202181927.GD9766@wotan.suse.de>
	<20051202104320.A5234@unix-os.sc.intel.com>
	<20051204164335.GB32492@isilmar.linta.de>
	<20051204183239.GE14247@wotan.suse.de>
	<1133725767.19768.12.camel@mindpipe>
	<20051205011611.GA12664@redhat.com> <43946ACE.9040405@argo.co.il>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <43946ACE.9040405@argo.co.il>
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
To: Avi Kivity <avi@argo.co.il>
Cc: Andrew Morton <akpm@osdl.org>, Andi Kleen <ak@suse.de>, linux-kernel <linux-kernel@vger.kernel.org>, Lee Revell <rlrevell@joe-job.com>, cpufreq <cpufreq@www.linux.org.uk>

On Mon, Dec 05, 2005 at 06:29:02PM +0200, Avi Kivity wrote:
 > Dave Jones wrote:
 > 
 > >I can't think of a single valid reason why a program would want
 > >to know the MHz rating of a CPU. Given that it's a) approximate,
 > >b) subject to change due to power management, c) completely nonsensical
 > >across CPU vendors, and d) only one of many variables regarding CPU
 > >performance, any program that bases any decision on the values found
 > >by parsing that field of /proc/cpuinfo is utterly broken beyond belief.
 > > 
 > >
 > Sometimes you need extremely low overhead time measurements, which need 
 > not be too accurate. One way to do this is to dump rdtsc measurements 
 > into some array, and later scale it using the cpu frequency.
 > 
 > I've done exactly this. The processes were pinned to their processors, 
 > and there was no frequency scaling in effect. It worked very well.

That code will break as soon as it's run on a CPU that uses P-states.
You can't "just scale" the value, there are other factors at work.

		Dave
