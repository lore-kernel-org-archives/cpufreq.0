From: "Devriendt, Paul" <paul.devriendt@amd.com>
Subject: RE: k8-powernow failing targ
Date: Wed, 30 Mar 2005 14:58:12 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A843023ADDD3@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Roes <jonathan.roes@gmail.com>
Cc: cpufreq@ZenII.linux.org.uk

> For enabling debug stuff, you have to compile your kernel with
> CONFIG_FREQ_DEBUG and to pass a kernel argument.  See help for
> "Enable CPUfreq debugging" in the cpufreq sub-menu when configuring
> the kernel for more details.

The system log will have tons of spew from powernow-k8 (and other
components) with the debug enabled. Included will be more detail on
exactly what it was doing when it failed, and (hopefully) also the
startup info when it reported the BIOS supplied PState information.
If you post that (if it is a reasonable size) or make it available
as a download then we will have more information on what the
problem might be. Paul.=20
