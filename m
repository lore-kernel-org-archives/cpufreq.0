From: "Devriendt, Paul" <paul.devriendt@amd.com>
Subject: RE: cpufreq: powernow-k8 frequency transitions question
Date: Mon, 2 Jan 2006 11:37:12 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A84303D430BD@SAUSEXMB1.amd.com>
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
To: Gunter Ohrner <G.Ohrner@post.rwth-aachen.de>
Cc: cpufreq@lists.linux.org.uk

> I found safety guards which return an error if an invalid frequency
> transition ("lo-lo transition") is requested.

Transitions between low frequencies (<=3D1.4GHz) are not supported by
hardware. The way to do them is to transition to an intermediate
high frequency. No BIOSs define two low PStates so the case never
occurs, but it could theoretically be done. The AMD BIOS and Kernel
Developers Guide available on AMD's web site provides more information
on K8 PStates.

Paul.
