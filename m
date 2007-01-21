From: Romain =?iso-8859-1?Q?Li=E9vin?= <roms@lievin.net>
Subject: RE: Frequency can't switch on a dual Turion 64
Date: Sun, 21 Jan 2007 11:28:56 +0100 (CET)
Message-ID: <1052.10.10.10.3.1169375336.squirrel@www.lievin.net>
References: <43212.193.48.146.2.1168602995.squirrel@www.lievin.net>
	<1449F58C868D8D4E9C72945771150BDFD964C6@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1449F58C868D8D4E9C72945771150BDFD964C6@SAUSEXMB1.amd.com>
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
To: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Cc: davej@codemonkey.org.uk, Romain =?iso-8859-1?Q?Li=E9vin?= <roms@lievin.net>, cpufreq@lists.linux.org.uk

Hi,

> It looks like the powernow-k8 driver correctly constructs
> a two entry frequency table and verifies it, and then
> reverifies a second frequency table with only 1 entry in
> it.

I feel very strange that frequency range can vary ("request for
verification of policy") between 2 calls of cpufreq_driver->verify() on
the same CPU (cpufreq.c: 1386 & 1400). First call returns
800000-1600000MHz while the second one returns 800000-800000. Moreover,
both calls are done before calling set_policy() at line 1413.

I think there is either a bug, either a problem with my configuration.
Anyways, I'm investigating this by taking a look at source code.

I decided to debug this but I can load the powernow-k8 module once. I
can't unload it; I have to reboot which is very annoying. Why module is
locked?

Regards, Romain.
-- 
email:	<roms@lievin.net>
web:	<http://www.lievin.net>
"Linux, y'a moins bien mais c'est plus cher !"
