From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [discuss] Re: [PATCH] Allow all Opteron processors to
 change pstate at same time
Date: Fri, 7 Jul 2006 13:26:09 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84303218E9A@SAUSEXMB1.amd.com>
References: <44AEA4A1.3050601@lampert.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <44AEA4A1.3050601@lampert.org>
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
To: Scott Lampert <scott@lampert.org>
Cc: discuss@x86-64.org, cpufreq@lists.linux.org.uk

=20
> As an aside, is this what the "AMD Dual-Core Optimizer"=20
> driver located at:
>=20
> http://www.amd.com/us-en/Processors/TechnicalResources/0,,30_1
> 82_871_13118,00.html
>=20
> does for that other OS?  Does this solution work there?

No, that tool forces the TSCs on a single dual-core processor
into sync by rewriting them once per second.  There's no
attempt to handle multiprocessor systems.

My initial attempt at solving the TSC/PN problem was to
synchronize all TSCs to the TSC of the first processor
after a PN! transition.  It didn't work because I couldn't
guarantee the timing closely enough, and it was an ugly
hack into the guts of arch/x86_64/kernel/time.c that would
also need changes to the userland tools.  This patch is
better because it's a userland transparent change to the
powernow-k8 code.

The ideal solution is to go to a per-core TSC counter,
but that's some complex code I haven't figured out yet.

-Mark Langsdorf
AMD, Inc.
