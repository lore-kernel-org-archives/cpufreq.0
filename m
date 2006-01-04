From: "Devriendt, Paul" <paul.devriendt@amd.com>
Subject: RE: cpufreq: powernow-k8 frequency transitions question
Date: Tue, 3 Jan 2006 21:12:46 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A84303EF8031@SAUSEXMB1.amd.com>
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
To: Gunter Ohrner <G.Ohrner@post.rwth-aachen.de>, cpufreq@lists.linux.org.uk

> I own a Winchester 3000+ (max. 1,8GHz) which I tried to=20
> operate at 800 MHz
> (instead of 1,0GHz) but it locked hard.

Core speed must be >=3D HyperTransport link speed. It is possible
that you have a HT link running at 1 GHz.

Paul.
