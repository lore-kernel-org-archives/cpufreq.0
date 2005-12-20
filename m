From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: returning from .target before sending CPUFREQ_POSTCHANGE
Date: Tue, 20 Dec 2005 12:26:33 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A84303218A3E@SAUSEXMB1.amd.com>
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
To: cpufreq@www.linux.org.uk


Is it legal to return from a .target=20
call without sending out a the=20
CPUFREQ_POSTCHANGE event? =20

I'm thinking about restructuring the=20
powernow-k8 driver so that instead of=20
busywaiting while polling the pending=20
bit, the driver sets up a periodic timer=20
poll mechanism to check the pending bit
and signals the CPUFREQ_POSTCHANGE
when the bit clears.

This would return control of execution
to other programs a little faster, but
I'm not sure if it's legal.

Comments would be appreciated.

-Mark Langsdorf
AMD, Inc.
