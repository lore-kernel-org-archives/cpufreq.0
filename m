From: Adam Belay <abelay@novell.com>
Subject: Re: 2.6.11: USB broken on nforce4, ipv6 still broken, centrino
	speedstep even more broken than in 2.6.10
Date: Mon, 21 Mar 2005 20:20:55 -0500
Message-ID: <1111454454.6633.5.camel@linux.site>
References: <20050311202122.GA13205@fefe.de>
	<20050311173517.7fe95918.akpm@osdl.org>
	<1110599659.12485.279.camel@localhost.localdomain>
	<20050321163225.4af1c169.akpm@osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050321163225.4af1c169.akpm@osdl.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: felix-linuxkernel@fefe.de
Cc: Andrew Morton <akpm@osdl.org>, cpufreq@ZenII.linux.org.uk, linux-kernel@vger.kernel.org

On Mon, 2005-03-21 at 19:32, Andrew Morton wrote:
> Adam Belay <abelay@novell.com> wrote:
> >
> > On Fri, 2005-03-11 at 17:35 -0800, Andrew Morton wrote:
> > > Felix von Leitner <felix-linuxkernel@fefe.de> wrote:
> > > >
> > > > Finally Centrino SpeedStep.
> > > > I have a "Intel(R) Pentium(R) M processor 1.80GHz" in my notebook.
> > > > Linux does not support it.  This architecture has been out there for
> > > > months now, and there even was a patch to support it posted here a in
> > > > October last year or so.  Linux still does not include it.  Until
> > > > 2.6.11-rc4-bk8 or so, the old patched file from back then still worked.
> > > > Now it doesn't.  Because some interface changed.  Now what?  Using a
> > > > Centrino notebook without CPU throttling is completely out of the
> > > > question.  Linux might as well not boot on it at all.
> > > 
> > > Could you please dig out the old patch, send it?
> > 
> > Why not use ACPI for CPU scaling?
> > 
> 
> Felix, did you try this?
> 

ACPI is the preferred (and only standardized) method of controlling cpu
throttling on x86 systems.

Also, as I said earlier, I wanted to see an lspci for the usb issues.

Thanks,
Adam
