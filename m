From: Greg KH <greg@kroah.com>
Subject: Re: [stable] [PATCH] Make acpi-cpufreq more robust against BIOS
	freq changes behind our back
Date: Wed, 21 May 2008 08:00:41 -0700
Message-ID: <20080521150041.GA15975@kroah.com>
References: <482DCF52.6030307@awtrey.com>
	<20080519000810.GA11313@codemonkey.org.uk>
	<1211279939.21269.403.camel@queen.suse.de>
	<48341AB8.3090401@awtrey.com>
	<1211375286.29901.7.camel@queen.suse.de>
	<1211375701.29901.11.camel@queen.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1211375701.29901.11.camel@queen.suse.de>
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
To: Thomas Renninger <trenn@suse.de>
Cc: Dave Jones <davej@codemonkey.org.uk>, Greg KH <gregkh@suse.de>, Stable <Stable@kernel.org>, cpufreq@lists.linux.org.uk

On Wed, May 21, 2008 at 03:15:01PM +0200, Thomas Renninger wrote:
> On Wed, 2008-05-21 at 15:08 +0200, Thomas Renninger wrote:
> > Hi,
> > 
> > Please consider this one for stable integration.
> ...
> > If this one patches for you for 2.6.24.4 also, maybe it even gets in
> > there.
> Hmm, I added this to OpenSUSE 10.3, means 2.6.22.
> I only had to adjust the arch/i386 vs arch/x86 patch.
> If this gets into the stable kernel, I wonder how far back this makes
> sense. Shall I send a 2.6.22 based version?

The stable team is only tracking 2.6.25 kernels right now, anything
older than that is not something we currently care about.

thanks,

greg k-h
