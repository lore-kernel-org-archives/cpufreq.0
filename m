From: Erik Mouw <erik@harddisk-recovery.com>
Subject: Re: [PATCH] CPU frequency display in /proc/cpuinfo
Date: Tue, 6 Dec 2005 12:13:49 +0100
Message-ID: <20051206111349.GB32737@harddisk-recovery.com>
References: <20051202181927.GD9766@wotan.suse.de>
	<20051202104320.A5234@unix-os.sc.intel.com>
	<20051204164335.GB32492@isilmar.linta.de>
	<20051204183239.GE14247@wotan.suse.de>
	<1133725767.19768.12.camel@mindpipe>
	<20051205011611.GA12664@redhat.com>
	<20051205130224.GC17993@harddisk-recovery.com>
	<20051205172513.GB12664@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20051205172513.GB12664@redhat.com>
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
To: Dave Jones <davej@redhat.com>, Lee Revell <rlrevell@joe-job.com>, Andi Kleen <ak@suse.de>, Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>, Andrew Morton <akpm@osdl.org>, cpufreq <cpufreq@www.linux.org.uk>, linux-kernel <linux-kernel@vger.kernel.org>

On Mon, Dec 05, 2005 at 12:25:13PM -0500, Dave Jones wrote:
> On Mon, Dec 05, 2005 at 02:02:24PM +0100, Erik Mouw wrote:
>  > If you want a userspace governor to change the CPU speed, you need to
>  > export the value to userland. 
> 
> We have sysfs files for that.

Earlier in this thread you said (I should have quoted that, my fault):

  Adding any other interface to obtain this value is equally as broken.

So I'm confused, sysfs one of the "any other interfaces"...


Erik

-- 
+-- Erik Mouw -- www.harddisk-recovery.com -- +31 70 370 12 90 --
| Lab address: Delftechpark 26, 2628 XH, Delft, The Netherlands
