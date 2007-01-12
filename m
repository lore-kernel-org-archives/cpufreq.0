From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: Frequency can't switch on a dual Turion 64
Date: Fri, 12 Jan 2007 09:06:06 -0600
Message-ID: <1449F58C868D8D4E9C72945771150BDFD964C6@SAUSEXMB1.amd.com>
References: <43212.193.48.146.2.1168602995.squirrel@www.lievin.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <43212.193.48.146.2.1168602995.squirrel@www.lievin.net>
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
To: =?iso-8859-1?Q?Romain_Li=E9vin?= <roms@lievin.net>, davej@codemonkey.org.uk
Cc: cpufreq@lists.linux.org.uk

> I may have detected a bug with the K8 cpu frequency driver
> (powernow_k8.c). While the driver correctly
> detect the 2 availables frequencies (800 & 1600 MHz), the=20
> governor always uses the lowest one.

It looks like the powernow-k8 driver correctly constructs
a two entry frequency table and verifies it, and then
reverifies a second frequency table with only 1 entry in
it.

I'm not familiar enough with the cpufreq code to guess
why this is happening.  I don't think it's a powernow-k8
bug, but I suppose it could be doing something wrong.

-Mark Langsdorf
AMD, Inc.
