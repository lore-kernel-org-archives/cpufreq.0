From: "shin, jacob" <jacob.shin@amd.com>
Subject: RE: [PATCH] [2/2] cpufreq: Fix handling for CPU hotplug
Date: Tue, 28 Feb 2006 21:17:28 -0600
Message-ID: <B3870AD84389624BAF87A3C7B831499302935679@SAUSEXMB2.amd.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>, Andi Kleen <ak@suse.de>, cpufreq@lists.linux.org.uk
Cc: "Langsdorf, Mark" <mark.langsdorf@amd.com>

On Tuesday, February 28, 2006 7:23 PM Pallipadi, Venkatesh wrote:

> Questions:

Thanks for your questions/comments.  Getting cpufreq driver to
play nicely with CPU Hotplug is not a trivial matter, especially
when affected cpus data is concerned.  If you have another
simple/elegant/"un-intrusive" solution, I would be glad to discuss
it further.

> I see multiple cpufreq_cpu_get() without cpmplementing
> cpufreq_cpu_put(). Is it intentional?

There are complementing cpufreq_cpu_put calls in the remove
function.

This is the code path in which the main cpufreq directory is created
for the first time, and symlinks all of the affected cpus. This is
in order to deal with CPU Hotplug.  Consider the case where the main
CPU that owns the actual sys directory goes off line.  All of its
affected cpus' symlinks will be unlinked, then the data destroyed.
When that main CPU comes online again, it needs to symlink all of
its affected cpus that were already online before him.

> Why is this going through the error path here. Is the call to exit()
> required?

Note that the return code is 0.  This is the case where cpufreq
driver registers a new driver through driver->init, however finds
that the CPU is already managed by someone that was online before
him.  The existing policy cannot predict what other CPUs that
will come after, due to CPU Hotplug.  Therefore, whenever a new
policy is registered through driver->init, we must check if it is
already managed, otherwise a few CPU on/offlines will confuse
the cpufreq driver's data.  When we find that the CPU is already
managed, we do not need to keep its data around, and we also
need to call driver->exit.

Thanks,

-Jacob Shin
AMD, Inc.
