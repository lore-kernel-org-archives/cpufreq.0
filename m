From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH][2/2] ondemand governor store the idle ticks for all cpus
Date: Sun, 6 Mar 2005 16:19:42 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB600426C6D3@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: davej@redhat.com, cpufreq@zenii.linux.org.uk


>-----Original Message-----
>From: Eric Piel [mailto:Eric.Piel@tremplin-utc.net]=20
>Sent: Sunday, March 06, 2005 10:52 AM
>To: Pallipadi, Venkatesh
>
>This patch fixes this by adding a small loop. As the previous patch,=20
>it's against 2.6.11 and only tested on a monoprocessor PC.
>

Good catch.=20
Dave/Dominik: please apply these two patches.=20
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

>
>PS: I couldn't find any documentation concerning the implementation of=20
>several CPUs with a frequency attached, is there any reference?

Only documentation for several CPUs with freq attached:
(From patch comments)
The following patch makes ondemand governor aware of policy->cpus.

policy->cpus mask lets multiple cpu use the same policy (useful where
cpus
share the frequency state), a recent change in cpufreq core.

Now ondemand governor looks at all cpus in policy->cpus and takes its
frequency increase/decrease decisions based on most lightly loaded cpu
in
the group. This patch will not affect systems where policy->cpus contain
only one cpu.

Thanks,
Venki
