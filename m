From: Dominik Brodowski <linux@brodo.de>
Subject: Re: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Tue, 21 Oct 2003 22:44:10 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031021204410.GH26971@brodo.de>
References: <88056F38E9E48644A0F562A38C64FB60077914@scsmsx403.sc.intel.com>
	<1066725533.5237.3.camel@laptop.fenrus.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1066725533.5237.3.camel@laptop.fenrus.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arjan van de Ven <arjanv@redhat.com>
Cc: "Mallick, Asit K" <asit.k.mallick@intel.com>, linux-acpi <linux-acpi@intel.com>, cpufreq@www.linux.org.uk, "Nakajima, Jun" <jun.nakajima@intel.com>, "Pallipadi,
	Venkatesh" <venkatesh.pallipadi@intel.com>

On Tue, Oct 21, 2003 at 10:38:53AM +0200, Arjan van de Ven wrote:
> Note that I'm not totally against doing some of this in the kernel; I
> can well see the point of say, detecting an IRQ overload and based on
> that, go to max speed in the kernel because it's a situation where
> userspace doesn't even run; but the patch as is doesn't do any such
> advanced things...

Indeed, this driver doesn't do anything like that. However,  I want to point
out two [of more] reasons why this is the right thing to do:

1.) I'm aware of one embedded system running linux which only has two 
userspace programs - busybox and cardmgr. All other stuff is handled 
in the kernel. An effort to remove the dependency on cardmgr is going on
[ <linux-pcmcia@lists.infradead.org> ]. If this embedded system was
supporting cpufreq, would you want to do dynamic scaling in the kernel, or
in userspace?

2.) It's a starting point for more advanced governors which really cannot be
done in userspace as this would be much too expensive. Having to choose
between different kernel and different userspace governors seems a bit
complicated for me. The _cost_ of doing this specific governor in the kernel
is near zero.

	Dominik
