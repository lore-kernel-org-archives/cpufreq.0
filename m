From: "Brown, Len" <len.brown@intel.com>
Subject: RE: [PATCH 4/4] minor optimizations to ondemand governor
Date: Fri, 30 Jun 2006 03:33:39 -0400
Message-ID: <CFF307C98FEABE47A452B27C06B85BB6E16653@hdsmsx411.amr.corp.intel.com>
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
To: Dave Jones <davej@redhat.com>, "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: "Starikovskiy, Alexey Y" <alexey.y.starikovskiy@intel.com>, cpufreq <cpufreq@www.linux.org.uk>

=20
>Longer term, I'd really like to see conservative & ondemand
>sharing more code as a separate helper .o file. They're similar
>in so many ways, it seems silly to duplicate so much code.

What value does cpufreq_conservative.c add over ondemand?

Are there some workloads we can measure to prove that
cpufreq_conservative.c should, or should-not exist?

-Len
