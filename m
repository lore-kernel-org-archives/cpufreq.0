From: "shin, jacob" <jacob.shin@amd.com>
Subject: RE: [PATCH] [1/2] cpufreq: Fix handling for CPU hotplug
Date: Tue, 28 Feb 2006 09:33:45 -0600
Message-ID: <B3870AD84389624BAF87A3C7B831499302935659@SAUSEXMB2.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
To: Andi Kleen <ak@suse.de>
Cc: cpufreq@lists.linux.org.uk, davej@redhat.com, "Langsdorf,
	Mark" <mark.langsdorf@amd.com>

On Tuesday, February 28, 2006 6:16 AM Andi Kleen wrote:

> How much regression testing did you do? Is it well tested enough for =
2.6.16?

I tested on machine running 2 Dual-Core AMD Opteron processors.
I tried 1P, SMP, SMP + Hotplug configurations on x86_64 side.
i386 should be fine too, since we share the powernow code.

These changes to should really be transparent, since it simply
does away with keeping track of data that we never use.

I am confidant enough to push for 2.6.16.

Thanks!

-Jacob Shin
AMD, Inc.
