From: Arjan van de Ven <arjanv@redhat.com>
Subject: Re: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPIP-state
	driver
Date: Wed, 22 Oct 2003 09:18:57 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031022091857.A25963@devserv.devel.redhat.com>
References: <7F740D512C7C1046AB53446D3720017304B031@scsmsx402.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <7F740D512C7C1046AB53446D3720017304B031@scsmsx402.sc.intel.com>;
	from jun.nakajima@intel.com on Tue, Oct 21, 2003 at 08:47:51AM
	-0700
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
To: "Nakajima, Jun" <jun.nakajima@intel.com>
Cc: cpufreq@www.linux.org.uk, linux-acpi <linux-acpi@intel.com>, "Mallick,
	Asit K" <asit.k.mallick@intel.com>, arjanv@redhat.com, "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@brodo.de>

On Tue, Oct 21, 2003 at 08:47:51AM -0700, Nakajima, Jun wrote:
> > 
> > it's all nice code and such, but I still wonder why this can't be done
> > by a userland policy daemon. The 2.6 kernel has the infrastructure to
> > give very detailed information to userspace (eg top etc) about idle
> > percentages...... I didn't see anything in this driver that couldn't
> be
> > done from userspace.
> > 
> 
> It's about the frequency of the feedback loop. As we have much lower
> latency with P-state transitions, the sampling time can be order of
> millisecond (or shorter if meaningful). A userland daemon can have a
> high-level policy (preferences, or set of parameters), but it cannot be
> part of the real feedback loop. If we combine P-state transitions and
> deeper C-state transitions, the situation is worse with a userland
> daemon.


As I said the CURRENT code doesn't seem to do that. I can see the use of
in kernel hooks in to thigs; for example the scheduler could do an upcall
to the cpufreq core if a task uses it's timeslice completely (which would
be a sign that things need to go to a higher speed). I'd be very
interested to see things like that.
